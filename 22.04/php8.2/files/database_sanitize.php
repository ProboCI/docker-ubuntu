<?php 
#!/usr/bin/env drush

use Drush\Drush;

// Initialize the database
$db = \Drupal::database();

$query = $db->query("
  SELECT 
      table_schema as `database`, 
      table_name AS `table`, 
      round(((data_length + index_length) / 1024 / 1024), 2) `size` 
  FROM information_schema.TABLES
  WHERE (table_name LIKE '%watchdog%'
    OR table_name LIKE '%search_index%'
    OR table_name LIKE 'node_revision_%'
    OR table_name LIKE 'paragraph_revision_%'
    OR table_name LIKE '%cache_%'
    OR table_name LIKE 'cachetags')
    AND `table_schema`='drupal'
  ORDER BY (data_length + index_length) DESC
");

$tables = $query->fetchAll();
$count = 0;
foreach ($tables as $table) {
  print $table->table . ': ' . $table->size . "\n";
  $db->query('TRUNCATE TABLE ' . $table->table);
}
