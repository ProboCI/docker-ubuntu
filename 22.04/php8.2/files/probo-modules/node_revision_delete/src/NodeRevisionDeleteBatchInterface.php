<?php

namespace Drupal\node_revision_delete;

/**
 * An interface for batch controller to process node revision deletes.
 *
 * @package Drupal\node_revision_delete
 */
interface NodeRevisionDeleteBatchInterface {

  /**
   * Prepares and executes batches.
   */
  public function batch(): void;

  /**
   * Batch step definition to process a queue.
   *
   * Based on \Drupal\Core\Cron::processQueues().
   *
   * @param string $node_type
   *   The machine name of the content type to create a queue for.
   * @param array|\DrushBatchContext $context
   *   An associative array or DrushBatchContext.
   *
   * @throws \Drupal\Component\Plugin\Exception\PluginException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function queue(string $node_type, &$context): void;

  /**
   * Callback when finishing a batch job.
   *
   * @param bool $success
   *   Indicate that the batch API tasks were all completed successfully.
   * @param array $results
   *   The value set in $context['results'] by callback_batch_operation().
   * @param array $operations
   *   If $success is FALSE, contains the operations that remained unprocessed.
   */
  public function finish(bool $success, array $results, array $operations): void;

}
