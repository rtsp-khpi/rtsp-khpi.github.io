======================================
6. Програмування мовою Сі для ОС Linux
======================================

Призначення
===========

Розробка програми "`Гра в кості <https://uk.wikipedia.org/wiki/%D0%9A%D0%BE%D1%81%D1%82%D1%96_(%D0%B3%D1%80%D0%B0)>`_" мовою Сі для ОС Linux.

Опис
====

1. Для автоматизації побудови програми використовувати утиліту `make <https://en.wikipedia.org/wiki/Make_(software)>`_. Реалізувати цілі:

	- help - виведення довідкової інформації.
	- release - побудова програми для випуску.
	- debug - побудова програми для відлагодження.
	- test - перевірки функціональності.
	- dist - створення `deb-пакету <https://en.wikipedia.org/wiki/Deb_(file_format)>`_ для його подальшого встановлення командою ``sudo dpkg -i file_name.deb`` (`Easy way to create a Debian package <https://linuxconfig.org/easy-way-to-create-a-debian-package-and-local-package-repository>`_).
	- install - встановлення до зазначеної директорії.
	- uninstall - видалення раніше встановленої програми.
	- clean - очищення робочого каталогу.
	- distclean - видалення з робочого каталогу файлів раніше створеного пакета для встановлення.

2. Дотримуватися `Linux kernel coding style <https://www.kernel.org/doc/html/latest/process/coding-style.html>`_. Файл `.clang-format <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/.clang-format>`_.

3. Використовувати наступні назви директорій:

	- src - для розташування початкових кодів.
	- bin - для розташування результатів компіляції.
	- lib - для розташування створеної бібліотеки.
	- /opt/your_app_name - директорія для встановлення.

4. Створити і використовувати статичну бібліотеку.

	.. code-block:: bash
		:caption: Приклад створення бібліотеки util

		gcc -c util.c
		ar -r libutil.a util.o
		gcc main.c -o main -static -L./ -lutil

5. Продемонструвати відсутність витоку пам'яті з використанням відповідних допоміжних засобів, наприклад:

	.. code-block:: bash

		gcc -std=c99 -pedantic-errors -Wall -Wextra -fsanitize=leak -O0 -g xxx.c
		cppcheck --enable=all --addon=cert.py .
		valgrind --leak-check=full --leak-resolution=med ./xxx

6. Для зберігання результатів (ім'я користувача, результати підрахунку балів гравців, результат гри, відмітка про час) використовувати `двоспрямовані списки <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/list.h>`_.

7. Режими гри визначати параметрами командного рядка.

8. Розробити скрипт побудови і тестування (перевірка результатів виконання) програми.

