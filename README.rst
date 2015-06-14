Spaced seeds improve metagenomic classification
===============================================

This repository contains all supplementary material for paper *Spaced seeds improve metagenomic classification* by K.Brinda, M.Sykulski, G.Kucherov. Preliminary version available at http://arxiv.org/abs/1502.06256.

Scripts
-------

Snakemake scripts used in Section 3.1.2 (Classifying unaligned reads) and 3.3 (Correlation on real genomes) are available `here`_.

.. _`here`: ./scripts

Supplementary plots 
-------------------

Section.3.2
^^^^^^^^^^^

* ``rank.cor.seed..weight.*.pdf``  - Spearman rank correlation between alignment (dis)similarity and score (hits or coverage), alignment (read) lengths 100 and 250, various spaced seed weights 

  * read length 100: `RCS_rl100_w18`_, `RCS_rl100_w20`_, `RCS_rl100_w22`_, `RCS_rl100_w24`_, `RCS_rl100_w26`_
  * read length 250: `RCS_rl250_w18`_, `RCS_rl250_w20`_, `RCS_rl250_w22`_, `RCS_rl250_w24`_, `RCS_rl250_w26`_

* ``relative.mutual.information..seed.weight.*.pdf`` - mutual information divided by entropy is ploted as a measure of interdependence between alignment (dis)similarity and score (hits or coverage)

  * read length 100: `RMI_rl100_w18`_, `RMI_rl100_w20`_, `RMI_rl100_w22`_, `RMI_rl100_w24`_, `RMI_rl100_w26`_
  * read length 250: `RMI_rl250_w18`_, `RMI_rl250_w20`_, `RMI_rl250_w22`_, `RMI_rl250_w24`_, `RMI_rl250_w26`_

* `smooth.scatter..spaced.vs.contig.pdf`_ - scatter plots of alignment (dis)similarity vs score (hits or coverage), alignment length 100

  * `smooth.scatter..spaced.vs.contig.zoom.rl100.pdf`_ - as above zoomed region, 

.. _`RCS_rl100_w16`:  section.3.2/rank.cor.seed..weight.16.pdf
.. _`RCS_rl100_w18`:  section.3.2/rank.cor.seed..weight.18.pdf
.. _`RCS_rl100_w20`:  section.3.2/rank.cor.seed..weight.20.pdf
.. _`RCS_rl100_w22`:  section.3.2/rank.cor.seed..weight.22.pdf
.. _`RCS_rl100_w24`:  section.3.2/rank.cor.seed..weight.24.pdf
.. _`RCS_rl100_w26`:  section.3.2/rank.cor.seed..weight.26.pdf
.. _`RCS_rl250_w16`:  section.3.2/rank.cor.seed..weight.rl250.16.pdf
.. _`RCS_rl250_w18`:  section.3.2/rank.cor.seed..weight.rl250.18.pdf
.. _`RCS_rl250_w20`:  section.3.2/rank.cor.seed..weight.rl250.20.pdf
.. _`RCS_rl250_w22`:  section.3.2/rank.cor.seed..weight.rl250.22.pdf
.. _`RCS_rl250_w24`:  section.3.2/rank.cor.seed..weight.rl250.24.pdf
.. _`RCS_rl250_w26`:  section.3.2/rank.cor.seed..weight.rl250.26.pdf

.. _`RMI_rl100_w16`:  section.3.2/relative.mutual.information..seed.weight.16.pdf
.. _`RMI_rl100_w18`:  section.3.2/relative.mutual.information..seed.weight.18.pdf
.. _`RMI_rl100_w20`:  section.3.2/relative.mutual.information..seed.weight.20.pdf
.. _`RMI_rl100_w22`:  section.3.2/relative.mutual.information..seed.weight.22.pdf
.. _`RMI_rl100_w24`:  section.3.2/relative.mutual.information..seed.weight.24.pdf
.. _`RMI_rl100_w26`:  section.3.2/relative.mutual.information..seed.weight.26.pdf
.. _`RMI_rl250_w16`:  section.3.2/relative.mutual.information..seed.weight.rl250.16.pdf
.. _`RMI_rl250_w18`:  section.3.2/relative.mutual.information..seed.weight.rl250.18.pdf
.. _`RMI_rl250_w20`:  section.3.2/relative.mutual.information..seed.weight.rl250.20.pdf
.. _`RMI_rl250_w22`:  section.3.2/relative.mutual.information..seed.weight.rl250.22.pdf
.. _`RMI_rl250_w24`:  section.3.2/relative.mutual.information..seed.weight.rl250.24.pdf
.. _`RMI_rl250_w26`:  section.3.2/relative.mutual.information..seed.weight.rl250.26.pdf


.. _`smooth.scatter..spaced.vs.contig.pdf`:  section.3.2/smooth.scatter..spaced.vs.contig.pdf
.. _`smooth.scatter..spaced.vs.contig.zoom.rl100.pdf`:  section.3.2/smooth.scatter..spaced.vs.contig.zoom.rl100.pdf
 

Section.3.3
^^^^^^^^^^^

4 report files with scatter plots of alignment (dis)similarity vs score (hits or coverage), plots in several flavors, experiments on 4 real genomes

* `d_report_Borrelia_garinii.pdf`_
* `d_report_Chlamydia.pdf`_
* `d_report_Human_chr_21.pdf`_
* `d_report_Mycobacterium_tuberculosis.pdf`_

.. _`d_report_Borrelia_garinii.pdf`:            section.3.3/d_report_Borrelia_garinii.pdf
.. _`d_report_Chlamydia.pdf`:                   section.3.3/d_report_Chlamydia.pdf
.. _`d_report_Human_chr_21.pdf`:                section.3.3/d_report_Human_chr_21.pdf
.. _`d_report_Mycobacterium_tuberculosis.pdf`:  section.3.3/d_report_Mycobacterium_tuberculosis.pdf

Section.3.4
^^^^^^^^^^^

Plots comparing seed-Kraken with original Kraken, performance and sensitivity on several data sets, spaced seeds of various weights and spans, tables with all results and used seeds.

* `supplement.3.4.pdf`_

.. _`supplement.3.4.pdf`:           section.3.4/supplement.3.4.pdf

Seed-Kraken
-----------

Seed-Kraken, a modification of Kraken utilizing spaced k-mers instead of contiguous k-mers, is located in a `standalone repository`_. For more details, see its `documentation`_.

.. _`standalone repository`: http://github.com/macieksk/seed-kraken
.. _`documentation`: http://seed-kraken.readthedocs.org/en/latest
