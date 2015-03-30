Spaced seeds improve metagenomic classification
===============================================

In this repository are supplementary plots for http://arxiv.org/abs/1502.06256


.. contents::
	:depth: 2


Seed-Kraken
-----------

Seed-Kraken is located in a standalone repository: http://github.com/macieksk/seed-kraken/. Its documentation can be found on http://seed-kraken.readthedocs.org/en/latest/.


Supplementary plots 
-------------------

section.3.2
^^^^^^^^^^^

* `rank.cor.seed..weight.*.pdf`  -- Spearman rank correlation between alignment (dis)similarity and score (hits or coverage), alignment (read) length 100, various spaced seed weights 
* `rank.cor.seed..weight.rl250.*.pdf` -- as above, alignment length 250 
* `relative.mutual.information..seed.weight.*.pdf` -- mutual information divided by entropy is ploted as a measure of interdependence between alignment (dis)similarity and score (hits or coverage)
* `relative.mutual.information..seed.weight.rl250.*.pdf` -- as above, alignment length 250 
* `smooth.scatter..spaced.vs.contig.pdf` -- scatter plots of alignment (dis)similarity vs score (hits or coverage)
* `smooth.scatter..spaced.vs.contig.zoom.rl100.pdf` -- as above zoomed region, alignment length 100
* `smooth.scatter..spaced.vs.contig.zoom.rl250.pdf` -- as above zoomed region, alignment length 250

section.3.3
^^^^^^^^^^^

4 report files with scatter plots of alignment (dis)similarity vs score (hits or coverage), plots in several flavors, experiments on 4 real genomes

* `d_report_Borrelia_garinii.pdf`_
* `d_report_Chlamydia.pdf`_
* `d_report_Human_chr_21.pdf`_
* `d_report_Mycobacterium_tuberculosis.pdf`_

.. _d\_report_Borrelia_garinii.pdf:            section.3.3/d_report_Borrelia_garinii.pdf
.. _d\_report_Chlamydia.pdf:                   section.3.3/d_report_Chlamydia.pdf
.. _d\_report_Human_chr_21.pdf:                section.3.3/d_report_Human_chr_21.pdf
.. _d\_report_Mycobacterium_tuberculosis.pdf:  section.3.3/d_report_Mycobacterium_tuberculosis.pdf

section.3.4
^^^^^^^^^^^

Plot comparing seed-Kraken with original Kraken, performance and sensitivity, spaced seeds of various weights and spans.

* `seed-kraken_plt1_many_spans.pdf`_

.. _seed-kraken_plt1_many_spans.pdf:           section.3.4/seed-kraken_plt1_many_spans.pdf

