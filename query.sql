-- BigQuery Extraction Script: HTTP Archive & CrUX Telemetry
SELECT
  date,
  client,
  is_root_page,
  ROUND(APPROX_QUANTILES(CAST(JSON_VALUE(summary, '$.bytesTotal') AS INT64), 1000)[OFFSET(500)] / 1024, 2) AS p50_total_kb,
  ROUND(APPROX_QUANTILES(CAST(JSON_VALUE(summary, '$.bytesJS') AS INT64), 1000)[OFFSET(500)] / 1024, 2) AS p50_js_kb,
  APPROX_QUANTILES(CAST(JSON_VALUE(summary, '$.reqTotal') AS INT64), 1000)[OFFSET(500)] AS p50_total_requests,
  APPROX_QUANTILES(CAST(JSON_VALUE(summary, '$.reqJS') AS INT64), 1000)[OFFSET(500)] AS p50_js_requests
FROM
  `httparchive.all.pages`
WHERE
  date IN ('2021-07-01', '2023-07-01', '2025-07-01')
GROUP BY
  date,
  client,
  is_root_page
ORDER BY
  date ASC,
  client DESC;
