=======================================
7. Модулі ядра: завантаження, видалення
=======================================

Призначення
===========

Створення простого модуля ядра.

Опис
====

Нижче наводяться приклади та інструкції для ОС `Ubuntu <https://ubuntu.com/>`_. За потребою встановіть необхідні інструменти (див. `Build Environment <https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel#Build_Environment>`_).

1. Встановіть пакет **Linux Kernel headers** для вашої версії ядра.

	.. code-block:: shell
		
		sudo apt-get install linux-headers-$(uname -r)

2. Побудуйте та протестуйте модуль **ex01**

	.. code-block:: c
		:caption: *ex01.c*

		#include <linux/init.h>
		#include <linux/module.h>
		#include <linux/kernel.h>
		
		MODULE_LICENSE("GPL");
		MODULE_AUTHOR("xone");
		MODULE_DESCRIPTION("A simple example Linux module.");
		MODULE_VERSION("0.01");
		
		static int __init ex01_init(void)
		{
		    printk(KERN_INFO "Hello!!!\n");
		    return 0;
		}
		
		static void __exit ex01_exit(void)
		{
		    printk(KERN_INFO "Bye...\n");
		}
		
		module_init(ex01_init);
		module_exit(ex01_exit);

	.. code-block:: make
		:caption: *Makefile*

		obj-m += ex01.o
		all:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
		clean:
		    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
		test:
		    sudo dmesg -C
		    sudo insmod ex01.ko
		    sudo rmmod ex01.ko
		    dmesg

3. Побудуйте, виправте помилки та протестуйте модулі **ex02** та **test_ex02**

	.. code-block:: c
		:caption: *ex02.c*

		#include <linux/module.h>

		MODULE_LICENSE("GPL");
		MODULE_AUTHOR("xone");
		MODULE_VERSION("0.01");
		MODULE_DESCRIPTION("A simple example Linux module.");

		static char retpref[] = "this string returned from ";

		char *test_01(void)
		{
			static char res[80];
			strcpy(res, retpref);
			strcat(res, __FUNCTION__);
			return res;
		}
		EXPORT_SYMBOL(test_01);

		char *test_02(void)
		{
			static char res[80];
			strcpy(res, retpref);
			strcat(res, __FUNCTION__);
			return res;
		}
		EXPORT_SYMBOL(test_02);

		static int __init xinit(void)
		{
			printk(KERN_INFO "ex02: Hello!!!\n");
			printk(KERN_INFO "ex02: %s\n", test_01());
			printk(KERN_INFO "ex02: %s\n", test_02());
			return 0;
		}

		static void __exit xexit(void)
		{
			printk(KERN_INFO "ex02: Bye...\n");
		}

	.. code-block:: c
		:caption: *test_ex02.c*

		#include <linux/module.h>

		MODULE_LICENSE("GPL");
		MODULE_AUTHOR("xone");
		MODULE_VERSION("0.01");
		MODULE_DESCRIPTION("Test ex02 Linux module.");

		extern char *test_01(void);
		extern char *test_02(void);

		static int __init xinit(void)
		{
			printk(KERN_INFO "test_ex02: Hello!!!\n");
			printk(KERN_INFO "test_ex02: %s\n", test_01());
			printk(KERN_INFO "test_ex02: %s\n", test_02());
			printk(KERN_INFO "test_ex02: Bye...\n");
			return -1;
		}

	.. code-block:: make
		:caption: *Makefile*

		obj-m += ex02.o test_ex02.o
		all:
			make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
		clean:
			make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
		test:
			# Add your implementation here

4. Додайте імплементацію цілі **test**.

5. Отримайте початковий код ядра (див. `інструкцію, розділ "Get kernel sources" <../_static/res/kernel_building.pdf>`_).

6. Виконайте налаштування та побудуйте ядро Linux (див. `інструкцію, розділ "Configure and build" <../_static/res/kernel_building.pdf>`_).

	.. code-block:: shell
		:caption: *Quick fixes*

		# Prepare build directory
		make O=${BUILD_KERNEL} i386_defconfig

	.. Caution::

		A kernel without a root filesystem is kind of useless.

7. Виконайте побудову **rootfs** за допомогою **Buildroot** (див. `інструкцію, розділ "Buildroot" <../_static/res/kernel_building.pdf>`_).

8. Розгорніть побудовану Linux-систему в **QEMU** (див. `KVM/QEMU Installation <https://help.ubuntu.com/community/KVM/Installation>`_; `інструкцію, розділ "Launch" <../_static/res/kernel_building.pdf>`_).

	.. code-block:: shell
		:caption: *Quick fixes*

		# Launch QUEMU
		qemu-system-i386 \
		   -kernel ${BUILD_KERNEL}/arch/i386/boot/bzImage \
		   -append "root=/dev/sda console=ttyS0" \
		   -drive format=raw,file=${BUILD_ROOTFS}/images/rootfs.ext3 \
		   -nic user,hostfwd=tcp::8022-:22 &

9. Виведіть повну інформацію про побудовану систему (версія ядра, ім'я користувача та хоста, версія компілятора, дата та час збірки).

10. Побудуйте тестові модулі ядра для розгорнутої Linux-системи, виконайте їх завантаження та видалення (див. `Secure Copy <https://en.wikipedia.org/wiki/Secure_copy_protocol#Secure_Copy_(remote_file_copy_program)>`_).

	.. Important::

		Основні команди управління модулями:
		
		- insmod - завантажити модуль.
		- rmmod - видалити модуль.
		- lsmod - переглянути завантажені модулі.
		- modinfo - інформація про модуль.

