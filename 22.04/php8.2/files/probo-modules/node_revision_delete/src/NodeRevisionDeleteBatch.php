<?php

namespace Drupal\node_revision_delete;

use Drupal\Core\Batch\BatchBuilder;
use Drupal\Core\DependencyInjection\DependencySerializationTrait;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Messenger\MessengerInterface;
use Drupal\Core\Queue\QueueFactory;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager;

/**
 * Batch controller to process node revision delete.
 *
 * Class NodeRevisionDeleteBatch declaration.
 *
 * @package Drupal\queue_ui
 */
class NodeRevisionDeleteBatch implements NodeRevisionDeleteBatchInterface {

  use StringTranslationTrait;
  use DependencySerializationTrait;

  /**
   * Node Revision Plugin Manager.
   *
   * @var \Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager
   */
  protected NodeRevisionDeletePluginManager $pluginManager;

  /**
   * Messenger.
   *
   * @var \Drupal\Core\Messenger\MessengerInterface
   */
  protected MessengerInterface $messenger;

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected EntityTypeManagerInterface $entityTypeManager;

  /**
   * The queue service.
   *
   * @var \Drupal\Core\Queue\QueueFactory
   */
  protected QueueFactory $queue;

  /**
   * Constructor of the Node Revision Delete Batch service.
   *
   * @param \Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager $node_revision_plugin_manager
   *   Node revision plugin manager.
   * @param \Drupal\Core\Messenger\MessengerInterface $messenger
   *   Messenger.
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   The entity type manager.
   * @param \Drupal\Core\Queue\QueueFactory $queue
   *   The queue service.
   */
  public function __construct(NodeRevisionDeletePluginManager $node_revision_plugin_manager, MessengerInterface $messenger, EntityTypeManagerInterface $entity_type_manager, QueueFactory $queue) {
    $this->pluginManager = $node_revision_plugin_manager;
    $this->messenger = $messenger;
    $this->entityTypeManager = $entity_type_manager;
    $this->queue = $queue;
  }

  /**
   * {@inheritdoc}
   */
  public function batch(): void {
    $batch = (new BatchBuilder())
      ->setTitle($this->t('Creating queue items'))
      ->setFinishCallback([$this, 'finish'])
      ->setProgressMessage($this->t('Processing nodes...'))
      ->setInitMessage($this->t('Initializing...'));

    $content_types = $this->entityTypeManager->getStorage('node_type')->loadMultiple();
    foreach ($content_types as $content_type) {
      $settings = $this->pluginManager->getSettingsNodeType($content_type->id());
      // Check whether at least one plugin is enabled for this content type.
      foreach ($settings['plugin'] as $plugin_settings) {
        $status = (bool) ($plugin_settings['status'] ?? FALSE);
        if ($status) {
          // Create a queue for all nodes in this content type.
          $batch->addOperation([$this, 'queue'], [$content_type->id()]);
          break;
        }
      }
    }

    batch_set($batch->toArray());
  }

  /**
   * {@inheritdoc}
   */
  public function queue(string $node_type, &$context): void {
    // Get all node IDs for this node type.
    $nids = $this->entityTypeManager->getStorage('node')->getQuery()
      ->condition('type', $node_type)
      ->accessCheck(FALSE)
      ->execute();
    foreach ($nids as $nid) {
      $this->queue->get('node_revision_delete')->createItem($nid);
      $context['results']['processed'][] = $nid;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function finish(bool $success, array $results, array $operations): void {
    if (!empty($results['processed'])) {
      $this->messenger->addMessage(
        $this->formatPlural(
          count($results['processed']),
          'One queue items created.',
          '@count queue items created.',
        )
      );
    }
    elseif (!isset($results['processed'])) {
      $this->messenger->addWarning($this->t('No queues created. Either you do not have any nodes on your site or all content types have their node revision delete settings disabled.'));
    }
  }

}
