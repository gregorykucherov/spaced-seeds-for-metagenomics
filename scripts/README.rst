Scripts
-------

Prerequisites
^^^^^^^^^^^^^

* `Python`_ 3.2+
* The following Python packages: `SnakeMake`_, `SMBL`_, `NumPy`_
  
  * you can install them using `PyPI`_ by `PIP`_: ``pip install snakemake smbl numpy`` (PIP can have be installed under a different name in your system : ``pip-3``, ``pip3``, etc.)

* `R`_


Running
^^^^^^^

Both scripts are written using `SnakeMake`_ (a Python-based Make-like build system). To run such script (typically named ``Snakefile``),
go to its directory and run ``snakemake``. You can also run it on more cores (using ``snakemake --cores 2`` for two cores or ``snakemake --cores``
for using all your cores).

All required files and programs (such as FASTA references, DwgSim) will be downloaded automatically.


.. _`Python`: https://www.python.org/
.. _`R`: http://www.r-project.org/
.. _`SnakeMake`: https://bitbucket.org/johanneskoester/snakemake/
.. _`SMBL`: http://github.com/karel-brinda/smbl
.. _`NumPy`: http://www.numpy.org/
.. _`PyPI`: https://pypi.python.org/pypi
.. _`PIP`: https://pip.pypa.io/en/latest/installing.html
