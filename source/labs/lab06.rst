======================================
6. Програмування мовою Сі для ОС Linux
======================================

Призначення
===========

Розробка програми "`Гра в кості <https://uk.wikipedia.org/wiki/%D0%9A%D0%BE%D1%81%D1%82%D1%96_(%D0%B3%D1%80%D0%B0)>`_" мовою Сі для ОС Linux.

Опис
====

1. Дотримуватися `Linux kernel coding style <https://www.kernel.org/doc/html/latest/process/coding-style.html>`_. Конфігураційний файл `.clang-format <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/.clang-format>`_ для утиліти автоматичного форматування початкового коду `clang-format <https://clang.llvm.org/docs/ClangFormat.html#standalone-tool>`_.

2. Використовувати наступні назви директорій:

	- *src* - для розташування початкових кодів.
	- *bin* - для розташування результатів компіляції.
	- *lib* - для розташування створеної бібліотеки.
	- */opt/your_app_name* - для встановлення за замовчуванням.

3. Автоматизувати побудову програми за допомогою утиліти `make <https://en.wikipedia.org/wiki/Make_(software)>`_. Реалізувати цілі:

	- *help* - виведення довідкової інформації.
	- *release* - побудова програми для випуску.
	- *debug* - побудова програми для відлагодження.
	- *test* - перевірка функціональності.
	- *install* - встановлення до зазначеної директорії.
	- *uninstall* - видалення раніше встановленої програми.
	- *clean* - очищення робочого каталогу.
	- *dist* - створення `deb-пакету <https://en.wikipedia.org/wiki/Deb_(file_format)>`_ (`Easy way to create a Debian package <https://linuxconfig.org/easy-way-to-create-a-debian-package-and-local-package-repository>`_).
	- *distclean* - видалення з робочого каталогу файлів раніше створеного deb-пакета.

	.. code-block:: shell
		:caption: *Приклад. Команда встановлення пакету file_name.deb*

		sudo dpkg -i file_name.deb 

4. Створити і використовувати статичну бібліотеку.

	.. code-block:: shell
		:caption: *Приклад. Створення і використання бібліотеки util*

		# Creating a library named util
		gcc -c file01.c file02.c
		ar rcs libutil.a file01.o file02.o
		
		# Using the library
		gcc main.c -L./ -lutil -o main.bin
		
		# List symbols from the library
		nm libutil.a

5. Режими гри визначати параметрами командного рядка (кількість гральних кісточок, кількість гравців, вид гри тощо).

6. Для зберігання результатів (ім'я користувача, результати підрахунку балів гравців, результат гри, відмітка про час) використовувати `двоспрямовані списки <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/list.h>`_.

7. Продемонструвати відсутність витоку пам'яті за допомогою додаткових програмних засобів, наприклад: `Cppcheck <https://github.com/danmar/cppcheck>`_, `LeakSanitizer <https://clang.llvm.org/docs/LeakSanitizer.html>`_, `Memcheck <https://www.valgrind.org/docs/manual/quick-start.html#quick-start.mcrun>`_.

	.. code-block:: shell
		:caption: *Приклад. Перевірка наявності витоку пам'яті*

		# Using GCC memory leak detector
		gcc -std=c99 -pedantic-errors -Wall -Wextra -fsanitize=leak -O0 -g -o xxx xxx.c
		./xxx
		
		# Use Cppcheck to check all source files in the current directory
		cppcheck --enable=all --addon=cert.py .
		
		# Running your program named xxx under Memcheck
		valgrind --leak-check=full --leak-resolution=med ./xxx

8. Розробити bash-скрипт тестування програми: порівняти результати виконання із заздалегідь відомими значеннями.

