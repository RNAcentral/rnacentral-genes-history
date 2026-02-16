COPY (
    SELECT DISTINCT
        assembly.taxid,
        assembly.assembly_id,
        assembly.ensembl_url
    FROM ensembl_assembly assembly
) TO STDOUT CSV HEADER