-- Query the ensemble stable prefixes for the taxids they have
-- This will be converted to a directory name so we can grab stuff from the FTP

COPY(
    SELECT 
    esp.taxid,
    rnc_taxonomy.name as organism_name
    FROM ensembl_stable_prefixes esp 
    JOIN rnc_taxonomy ON esp.taxid = rnc_taxonomy.id
    WHERE esp.taxid NOT IN (SELECT DISTINCT(taxid) FROM rnc_genes)
    ORDER BY rnc_taxonomy.name
) TO STDOUT WITH CSV HEADER;