:hide-toc:

===========================
Програма курсу (частина II)
===========================

.. toctree::
	:caption: Лабораторні роботи
	:maxdepth: 2
  	:hidden:

  	labs/lab05
  	labs/lab06
  	labs/lab07
	labs/lab08

1. :doc:`ОС Linux: обзор, файловая система, командная оболочка. Bash: command line, shell scripting. <labs/lab05>`

2. :doc:`Програмування мовою Сі для ОС Linux. GCC, CLANG. Linux kernel coding style. Автоматична побудова програм за допомогою утиліти make. Створення статичних і динамічних бібліотек. <labs/lab06>`

3. :doc:`Ядро ОС Linux: огляд, структура, збірка, встановлення. Модулі ядра: завантаження, видалення, залежності, діагностика, налагодження. <labs/lab07>`

4. :doc:`Віртуальна файлова система. Програмний інтерфейс. Ресурси. <labs/lab08>`

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

	Для вирішення проблем з оновленням пакетів в лабораторіях НТУ "ХПІ" потрібно налаштувати проксі для APT в Ubuntu, а саме:

	**1)** Створити файл

	*/etc/apt/apt.conf.d/proxy.conf*

	**2)** Додати в створений файл наступні рядки

	*Acquire::http::proxy "http://172.17.10.2:3128";*

	*Acquire::https::proxy "http://172.17.10.2:3128";*

