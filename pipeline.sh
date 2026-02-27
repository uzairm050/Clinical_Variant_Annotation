#!/usr/bin/env bash
# ============================================================
# Clinical Variant Annotation Pipeline
# Assignment #2 — Clinical Bioinformatics
# ============================================================
# Description:
#   This script demonstrates the bioinformatics steps used to
#   filter, extract, and validate the three pathogenic variants
#   studied in this assignment using BCFTools.
#
# Reference Genome: GRCh38 (hg38)
# Genes of Interest: CFTR (CF), LDLR (FH), PAH (PKU)
# ============================================================

set -euo pipefail

echo "=============================================="
echo " Clinical Variant Annotation Pipeline"
echo " Reference: GRCh38/hg38"
echo "=============================================="

# -------------------------------------------------------
# Step 1: Define target regions for the 3 genes
# -------------------------------------------------------
echo ""
echo "[Step 1] Defining target regions for CFTR, LDLR, and PAH..."

# CFTR gene region — Chromosome 7
CFTR_REGION="chr7:117,480,025-117,668,665"

# LDLR gene region — Chromosome 19
LDLR_REGION="chr19:11,089,444-11,133,820"

# PAH gene region — Chromosome 12
PAH_REGION="chr12:102,835,615-102,960,382"

echo "  CFTR: $CFTR_REGION"
echo "  LDLR: $LDLR_REGION"
echo "  PAH:  $PAH_REGION"

# -------------------------------------------------------
# Step 2: Filter the raw patient VCF to target regions
# -------------------------------------------------------
# NOTE: Replace 'patient_raw.vcf.gz' with actual patient VCF file
# This step requires BCFTools to be installed: https://samtools.github.io/bcftools/

echo ""
echo "[Step 2] Filtering patient VCF to target gene regions..."

# Example BCFTools commands (requires patient_raw.vcf.gz):
# bcftools view -r chr7:117480025-117668665,chr19:11089444-11133820,chr12:102835615-102960382 \
#   -o Data/patient_filtered_regions.vcf.gz -O z patient_raw.vcf.gz
# bcftools index Data/patient_filtered_regions.vcf.gz
echo "  [INFO] BCFTools region filter command ready (requires input VCF)"

# -------------------------------------------------------
# Step 3: Extract the 3 specific pathogenic variants
# -------------------------------------------------------
echo ""
echo "[Step 3] Extracting specific pathogenic variants by position..."

# CFTR G551D: chr7:117587806 G>A
# LDLR D227E: chr19:11105587 C>G
# PAH  R408W: chr12:102852747 C>T

# Example BCFTools command:
# bcftools view -r chr7:117587806,chr19:11105587,chr12:102852747 \
#   Data/patient_filtered_regions.vcf.gz -o Data/patient_variants_extracted.vcf

echo "  CFTR G551D  -> chr7:117587806  G>A"
echo "  LDLR D227E  -> chr19:11105587  C>G"
echo "  PAH  R408W  -> chr12:102852747 C>T"

# -------------------------------------------------------
# Step 4: Validate the curated VCF
# -------------------------------------------------------
echo ""
echo "[Step 4] Validating the curated VCF file..."

if [ -f "Data/patient_variants.vcf" ]; then
    VARIANT_COUNT=$(grep -v "^#" Data/patient_variants.vcf | wc -l)
    echo "  VCF file found: Data/patient_variants.vcf"
    echo "  Total variants: $VARIANT_COUNT"

    echo ""
    echo "  Variant Summary:"
    grep -v "^#" Data/patient_variants.vcf | awk -F'\t' '{
        split($8, info, ";");
        gene=""; hgvsp=""; clnsig="";
        for (i in info) {
            if (info[i] ~ /^GENE=/) { split(info[i], a, "="); gene=a[2]; }
            if (info[i] ~ /^HGVS_P=/) { split(info[i], a, "="); hgvsp=a[2]; }
            if (info[i] ~ /^CLNSIG=/) { split(info[i], a, "="); clnsig=a[2]; }
        }
        printf "  %-6s %-20s %-15s %s\n", $1, gene, hgvsp, clnsig;
    }'
else
    echo "  [WARNING] Data/patient_variants.vcf not found. Run from repo root."
fi

# -------------------------------------------------------
# Step 5: Summary
# -------------------------------------------------------
echo ""
echo "[Step 5] Pipeline complete."
echo ""
echo "  Output files:"
echo "  - Data/patient_variants.vcf              -> Curated VCF (3 pathogenic variants)"
echo "  - Clinical_Variant_Annotation_Report.xlsx -> Full annotation report"
echo "  - Screenshots/                            -> AlphaMissense & REVEL from UCSC"
echo ""
echo "  To submit to ClinVar for annotation:"
echo "  Visit https://www.ncbi.nlm.nih.gov/clinvar/docs/submission_portal/"
echo "  and upload Data/patient_variants.vcf"
echo ""
echo "=============================================="
echo " Analysis Complete"
echo "=============================================="
