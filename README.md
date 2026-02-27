# 🧬 Clinical Variant Annotation of Rare Genetic Disorders

<p align="center">
  <img src="https://img.shields.io/badge/Field-Clinical%20Bioinformatics-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Guidelines-ACMG%2FAMP-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Reference%20Genome-GRCh38%2Fhg38-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-blue?style=for-the-badge" />
</p>

---

## 📌 Project Overview

This repository contains a **clinical bioinformatics variant annotation workflow** for three rare genetic disorders. For each disorder, one highly relevant pathogenic variant was selected from **ClinVar**, annotated with phenotype data from **OMIM**, scored using **AlphaMissense** and **REVEL** pathogenicity predictors via the **UCSC Genome Browser**, and classified according to **ACMG/AMP guidelines**.

The three disorders studied are:

| # | Disorder | Gene | Chromosomal Location |
|---|---|---|---|
| 1 | Cystic Fibrosis (CF) | *CFTR* | Chr7: 117,587,806 |
| 2 | Familial Hypercholesterolemia (FH) | *LDLR* | Chr19: 11,105,587 |
| 3 | Phenylketonuria (PKU) | *PAH* | Chr12: 102,852,747 |

---

## 🔬 Clinical Findings Summary

| Disorder | Gene | Variant (HGVSp) | AlphaMissense | REVEL | ACMG Classification |
|---|---|---|---|---|---|
| Cystic Fibrosis | *CFTR* | p.Gly551Asp (G551D) | 0.9897 — Likely Pathogenic | 0.99 — Pathogenic | **Pathogenic** ⭐⭐⭐⭐ |
| Familial Hypercholesterolemia | *LDLR* | p.Asp227Glu (D227E) | 0.9881 — Likely Pathogenic | 0.864 — Pathogenic | **Pathogenic** ⭐⭐⭐ |
| Phenylketonuria | *PAH* | p.Arg408Trp (R408W) | 0.999 — Pathogenic | 0.79+ — Pathogenic | **Pathogenic** ⭐⭐⭐⭐ |

---

## 🧪 Variant Details

<details>
<summary><b>1. Cystic Fibrosis — CFTR: NM_000492.4:c.1652G>A (p.Gly551Asp)</b></summary>
<br>

- **Variant Type:** Single Nucleotide Variant (SNV), 1 bp substitution
- **ClinVar ID:** [VCV000007107](https://www.ncbi.nlm.nih.gov/clinvar/variation/7107/) — Reviewed by Expert Panel ⭐⭐⭐⭐
- **OMIM:** [#219700](https://www.omim.org/entry/219700)

**Molecular Mechanism:**
This is a Class III "gating" mutation. The G551D substitution prevents the CFTR chloride channel from opening in response to ATP, resulting in near-total loss of chloride ion transport (<1% of normal function), causing thick mucus and classic CF symptoms.

**Clinical Features:**
Chronic obstructive lung disease, frequent infections, pancreatic insufficiency, elevated sweat chloride (>60 mmol/L), and in males, congenital bilateral absence of the vas deferens (CBAVD).

**Pharmacogenomics:**
Responds to **Ivacaftor** (CFTR potentiator), confirmed in the STRIVE and ENVISION clinical trials.

**ACMG Evidence:** PS3 | PS4 | PP3
</details>

<details>
<summary><b>2. Familial Hypercholesterolemia — LDLR: NM_000527.5:c.681C>G (p.Asp227Glu)</b></summary>
<br>

- **Variant Type:** Single Nucleotide Variant (SNV), 1 bp substitution
- **ClinVar ID:** [rs121908028](https://www.ncbi.nlm.nih.gov/clinvar/variation/251/) — Multiple Submitters ⭐⭐⭐
- **OMIM:** [#143890](https://www.omim.org/entry/143890)

**Molecular Mechanism:**
Missense mutation disrupting a calcium-binding site in the 5th repeat of the LDLR ligand-binding domain. Creates a "binding-defective" receptor that cannot efficiently clear LDL cholesterol. Known as the "FH Afrikaner-1" founder mutation.

**Clinical Features:**
Early-onset atherosclerosis, elevated plasma LDL cholesterol, tendon xanthomas, xanthelasma, corneal arcus, and high risk of premature coronary heart disease.

**ACMG Evidence:** PS4 (Very Strong) | PP1_Strong | PS3_Moderate | PM1 | PM2 | PP3 | PP4
</details>

<details>
<summary><b>3. Phenylketonuria — PAH: NM_000277.3:c.1222C>T (p.Arg408Trp)</b></summary>
<br>

- **Variant Type:** Single Nucleotide Variant (SNV), 1 bp substitution at CpG hotspot
- **ClinVar ID:** [VCV000000577](https://www.ncbi.nlm.nih.gov/clinvar/variation/577/) — Reviewed by Expert Panel ⭐⭐⭐⭐
- **OMIM:** [#261600](https://www.omim.org/entry/261600)

**Molecular Mechanism:**
C>T transition replacing Arginine with Tryptophan at codon 408 of the PAH enzyme catalytic domain. Causes severe protein misfolding and near-total loss of enzymatic activity (<2%), leading to toxic phenylalanine accumulation in the brain.

**Clinical Features:**
Severe intellectual disability, microcephaly, seizures, developmental delay, distinctive "mousy" body odor, and hypopigmentation (fair skin and hair).

**ACMG Evidence:** PS3 (Strong) | PM3 (Strong) | PP3 | PP4 (Moderate)
</details>

---

## 🗂️ Repository Structure

```
Clinical_Variant_Annotation/
│
├── 📁 Data/
│   ├── patient_variants.vcf                      # VCF v4.2 file with 3 pathogenic variants
│   └── Clinical_Variant_Annotation_Report.xlsx   # Full clinical annotation report
│
├── 📁 Screenshots/
│   └── (AlphaMissense & REVEL scores from UCSC Genome Browser)
│
├── pipeline.sh     # BCFTools filtering pipeline script
└── README.md       # Project documentation (this file)
```

---

## ⚙️ Steps to Reproduce

**1. Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/Clinical_Variant_Annotation.git
cd Clinical_Variant_Annotation
```

**2. View the annotation report**

Open `Data/Clinical_Variant_Annotation_Report.xlsx` in Microsoft Excel or LibreOffice Calc.

**3. Inspect the VCF file**
```bash
cat Data/patient_variants.vcf
```

**4. Run the filtering pipeline** *(requires BCFTools)*
```bash
bash pipeline.sh
```

**5. Submit VCF to ClinVar for annotation**

Upload `Data/patient_variants.vcf` at the [ClinVar Submission Portal](https://www.ncbi.nlm.nih.gov/clinvar/docs/submission_portal/).

---

## 🛠️ Tools & Databases

| Tool / Database | Purpose |
|---|---|
| [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) | Variant selection and clinical significance |
| [OMIM](https://www.omim.org/) | Gene-phenotype relationships and inheritance |
| [UCSC Genome Browser](https://genome.ucsc.edu/) | AlphaMissense & REVEL visualization |
| [AlphaMissense](https://alphamissense.hegelab.org/) | Deep-learning structural impact predictor |
| [REVEL](https://sites.google.com/site/revelgenomics/) | Ensemble missense pathogenicity scorer |
| [BCFTools](https://samtools.github.io/bcftools/) | VCF filtering and manipulation |

---

## 📚 Key References

- CFTR2 Expert Panel (2017). ClinVar submission for G551D — 4-star expert panel review.
- Gregory et al. (1991). Maturation and function of CFTR variants. *Nature*.
- Hobbs et al. (1992). Functional characterization of LDLR missense mutations. *Journal of Clinical Investigation*.
- Richards et al. (2015). ACMG/AMP standards and guidelines for sequence variant interpretation. *Genetics in Medicine*.
- OMIM #219700 (Cystic Fibrosis) | OMIM #143890 (Familial Hypercholesterolemia) | OMIM #261600 (Phenylketonuria)

---

> **Assignment #2** | Clinical Bioinformatics | **Due: 1st March**
> 
> *Select three genetic disorders → identify pathogenic variants from ClinVar → annotate with OMIM → score with AlphaMissense & REVEL → classify using ACMG/AMP guidelines → generate VCF → document on GitHub.*
