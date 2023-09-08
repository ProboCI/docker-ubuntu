<?php

namespace Drupal\node_revision_delete\Commands;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Queue\QueueFactory;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager;
use Drush\Commands\DrushCommands;

/**
 * Drush command for putting all content in a queue.
 */
class QueueContent extends DrushCommands {

  use StringTranslationTrait;

  /**
   * The Entity Type Manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected EntityTypeManagerInterface $entityTypeManager;

  /**
   * Node Revision Plugin Manager.
   *
   * @var \Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager
   */
  protected NodeRevisionDeletePluginManager $pluginManager;

  /**
   * The queue service.
   *
   * @var \Drupal\Core\Queue\QueueFactory
   */
  protected QueueFactory $queue;

  /**
   * Constructor.
   *
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   The entity type manager service.
   * @param \Drupal\node_revision_delete\Plugin\NodeRevisionDeletePluginManager $node_revision_plugin_manager
   *   Node revision plugin manager.
   * @param \Drupal\Core\Queue\QueueFactory $queue
   *   The queue service.
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, NodeRevisionDeletePluginManager $node_revision_plugin_manager, QueueFactory $queue) {
    parent::__construct();
    $this->entityTypeManager = $entity_type_manager;
    $this->pluginManager = $node_revision_plugin_manager;
    $this->queue = $queue;
  }

  /**
   * Creates queue items or all content.
   *
   * This creates queue items for all content which then can be processed
   * during cron.
   *
   * @usage drush node-revision-delete:queue
   *   Creates queue items for all content where settings apply.
   *
   * @command node-revision-delete:queue
   *
   * @aliases nrdq
   */
  public function queueContent(): void {
    $content_types = $this->entityTypeManager->getStorage('node_type')->loadMultiple();
    foreach ($content_types as $content_type) {
      $settings = $this->pluginManager->getSettingsNodeType($content_type->id());
      // Check whether at least one plugin is enabled for this content type.
      foreach ($settings['plugin'] as $plugin_settings) {
        $status = (bool) ($plugin_settings['status'] ?? FALSE);
        if ($status) {
          // Create a queue for all nodes in this content type.
          $this->createQueue($content_type->id());
          break;
        }
      }
    }

  }

  /**
   * Create queue items for all nodes of a content type.
   *
   * @param string $node_type
   *   The content type machine name.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function createQueue(string $node_type): void {
    // Get all node IDs for this node type.
    $nids = $this->entityTypeManager->getStorage('node')->getQuery()
      ->condition('type', $node_type)
      ->accessCheck(FALSE)
      ->execute();
    foreach ($nids as $nid) {
      $this->queue->get('node_revision_delete')->createItem($nid);
    }
    $this->output()->writeln('Created ' . count($nids) . ' queue items for content-type: ' . $node_type);
  }

}
