
.. toctree::
	:caption: Лабораторні роботи
	:maxdepth: 2
  	:hidden:

  	labs/lab05
  	labs/lab06
  	labs/lab07
	labs/lab08

===========================
Програма курсу (частина II)
===========================

1. ОС Linux: обзор, файловая система, командная оболочка. Bash: command line, shell scripting.

2. Програмування мовою Сі для ОС Linux. GCC, CLANG. Розробка та налагодження програм. Створення статичних і динамічних бібліотек. Linux kernel coding style. QEMU.

3. Ядро ОС Linux: огляд, структура, збірка, встановлення. Модулі ядра: завантаження, видалення, залежності, діагностика, налагодження.

4. Віртуальна файлова система. Програмний інтерфейс. Ресурси.

-----

Інструменти розробки
====================

- `GNU Compiler Collection <https://en.wikipedia.org/wiki/GNU_Compiler_Collection>`_.
- `Clang <https://en.wikipedia.org/wiki/Clang>`_ with `LLVM <https://en.wikipedia.org/wiki/LLVM>`_ (`Ubuntu packages <https://apt.llvm.org/>`_, `download page <http://releases.llvm.org/download.html>`_). Handy tools: `LeakSanitizer <https://clang.llvm.org/docs/LeakSanitizer.html>`_, `scan-build <https://clang-analyzer.llvm.org/scan-build.html>`_, `ClangFormat <https://clang.llvm.org/docs/ClangFormat.html>`_.
- `Cppcheck <http://cppcheck.sourceforge.net/>`_.
- `Valgrind <http://valgrind.org/>`_.

-----

Посилання
=========

ОС Linux
--------

- `The Linux Kernel documentation <https://www.kernel.org/doc/html/latest/>`_.
- `Wiki: Standard input/output streams <https://en.wikipedia.org/wiki/Standard_streams>`_.
- `Wiki: Redirecting standard input and standard output <https://en.wikipedia.org/wiki/Redirection_(computing)>`_.
- `Wiki: Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`_.
- `Wiki: Filesystem Hierarchy Standard <https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard>`_.
- `Wiki: proc filesystem <https://en.wikipedia.org/wiki/Procfs>`_.
- `Разделы и файловые системы Linux <https://help.ubuntu.ru/wiki/%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D1%8B_%D0%B8_%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D1%8B%D0%B5_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B_linux>`_.
- `Стандартные права Unix <https://help.ubuntu.ru/wiki/%D1%81%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D1%8B%D0%B5_%D0%BF%D1%80%D0%B0%D0%B2%D0%B0_unix>`_.
- `Искусство программирования на языке сценариев командной оболочки <http://www.opennet.ru/docs/RUS/bash_scripting_guide/>`_.

C Programming Language
----------------------

- `Wiki: ANSI C <https://en.wikipedia.org/wiki/ANSI_C>`_.
- `Wiki: Makefile <https://en.wikipedia.org/wiki/Makefile>`_.
- `HTML and PDF versions of C89, C99, and C11 <http://port70.net/~nsz/c/>`_.
- `SEI CERT C Coding Standard <https://wiki.sei.cmu.edu/confluence/display/c/SEI+CERT+C+Coding+Standard>`_.
- `C Reference <https://en.cppreference.com/w/c>`_.
- `GNU Make Manual <https://www.gnu.org/software/make/manual/>`_.
- Making Code More Secure with GCC: `Part 1 <https://blogs.oracle.com/linux/making-code-more-secure-with-gcc-part-1>`_, `Part 2 <https://blogs.oracle.com/linux/making-code-more-secure-with-gcc-part-2>`_.

.. Attention::

	Set the Proxy for APT on Ubuntu

	**1)** Create the following file:

	*/etc/apt/apt.conf.d/proxy.conf*

	**2)** Add the following lines:

	*Acquire::http::proxy "http://172.17.10.2:3128";*

	*Acquire::https::proxy "http://172.17.10.2:3128";*

