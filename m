From: Guenter Roeck <linux@roeck-us.net>
Subject: next: Crashes in x86 images due to 'locking/rwsem, x86: Clean up
 ____down_write()'
Date: Thu, 12 May 2016 06:34:29 -0700
Message-ID: <57348665.3050301@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60732 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbcELNem (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2016 09:34:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Borislav,

your patch 'locking/rwsem, x86: Clean up ____down_write()' causes various
crashes in x86 qemu tests.

BUG: unable to handle kernel paging request at 80000015
IP: [<c1846353>] down_write+0x23/0x30

Call Trace:
  [<c1374cd5>] crypto_larval_kill+0x15/0x70
  [<c13761c6>] crypto_wait_for_test+0x46/0x70
  [<c137660c>] crypto_register_alg+0x5c/0x70
  [<c1376655>] crypto_register_algs+0x35/0x80
  [<c1c1e815>] ? hmac_module_init+0xf/0xf
  [<c1c1e828>] crypto_null_mod_init+0x13/0x41
  [<c100047b>] do_one_initcall+0x3b/0x150
  [ ... ]


BUG: unable to handle kernel paging request at 80000015
IP: [<c1848e43>] down_write+0x23/0x30

Call Trace:
  [<c10530d5>] copy_process.part.52+0xba5/0x15c0
  [<c184a458>] ? _raw_spin_unlock_bh+0x18/0x20
  [<c1053c9d>] _do_fork+0xcd/0x380
  [<c105403c>] SyS_clone+0x2c/0x30
  [<c100174a>] do_int80_syscall_32+0x5a/0xa0
  [<c184ac5e>] entry_INT80_32+0x2a/0x2a

BUG: unable to handle kernel paging request at 80000015
IP: [<c1848e43>] down_write+0x23/0x30

Call Trace:
  [<c1155f30>] unlink_file_vma+0x30/0x50
  [<c1150ed3>] free_pgtables+0x33/0xc0
  [<c115719e>] exit_mmap+0x8e/0xe0
  [<c105220b>] mmput+0x2b/0xa0
  [<c117f452>] flush_old_exec+0x312/0x650
  [<c11c3c0d>] load_elf_binary+0x2ad/0x1080
  [<c114f00c>] ? __get_user_pages+0x3c/0x60
  [<c114f08f>] ? get_user_pages_remote+0x5f/0x70
  [<c13c6a11>] ? _copy_from_user+0x31/0x50
  [<c117f00c>] search_binary_handler+0x7c/0x1b0
  [<c118059b>] do_execveat_common+0x4bb/0x650
  [<c1180754>] do_execve+0x24/0x30
  [<c118094b>] SyS_execve+0x1b/0x20
  [<c100174a>] do_int80_syscall_32+0x5a/0xa0
  [<c184ac5e>] entry_INT80_32+0x2a/0x2a

Reverting the patch fixes the problem.

Complete logs are available at http://kerneltests.org/builders/qemu-x86-next.
Scripts, configuration, and root file system used are available at
	https://github.com/groeck/linux-build-test/tree/master/rootfs/x86

Bisect log is attached.

Guenter

---
Bisect log:

# bad: [13425f1bf7f9f28fcef53057303319d5afb907f7] Add linux-next specific files for 20160511
# good: [44549e8f5eea4e0a41b487b63e616cb089922b99] Linux 4.6-rc7
git bisect start 'HEAD' 'v4.6-rc7'
# good: [b6cf27d48f370bf2d42888921632ae05340aaca9] Merge remote-tracking branch 'crypto/master'
git bisect good b6cf27d48f370bf2d42888921632ae05340aaca9
# bad: [607563e7793b7c4f3ab134dc200552a555ca5cb2] Merge remote-tracking branch 'tip/auto-latest'
git bisect bad 607563e7793b7c4f3ab134dc200552a555ca5cb2
# good: [05454bc3dd6d8c4cff684ea881d79db952030075] Merge remote-tracking branch 'block/for-next'
git bisect good 05454bc3dd6d8c4cff684ea881d79db952030075
# good: [3ed15da0d55d9147f6434fe57db60a5b4059cbfd] Merge remote-tracking branch 'spi/for-next'
git bisect good 3ed15da0d55d9147f6434fe57db60a5b4059cbfd
# bad: [25ea4e608611c03ad9829a727f6cc198db952d06] Merge branch 'perf/core'
git bisect bad 25ea4e608611c03ad9829a727f6cc198db952d06
# good: [f127fa098d76444c7a47b2f009356979492d77cd] perf/x86/intel/pt: Add IP filtering register/CPUID bits
git bisect good f127fa098d76444c7a47b2f009356979492d77cd
# good: [13a00bc35b2a9f8b750a292dcc84111bdfb1edd4] Merge branch 'efi/core'
git bisect good 13a00bc35b2a9f8b750a292dcc84111bdfb1edd4
# bad: [0b749d9316aa32dc3fe67d7c0b4fb650873709aa] Merge branch 'locking/rwsem'
git bisect bad 0b749d9316aa32dc3fe67d7c0b4fb650873709aa
# good: [a1cc5bcfcfca0b99f009b117785142dbdc3b87a3] locking/atomics: Flip atomic_fetch_or() arguments
git bisect good a1cc5bcfcfca0b99f009b117785142dbdc3b87a3
# good: [00fb16e26ac8559e69c3bb14284f4a548d28ee0d] locking/rwsem, x86: Add frame annotation for call_rwsem_down_write_failed_killable()
git bisect good 00fb16e26ac8559e69c3bb14284f4a548d28ee0d
# good: [e3825ba1af3a27d7522c9f5f929f5a13b8b138ae] irqchip/gic-v3: Add support for partitioned PPIs
git bisect good e3825ba1af3a27d7522c9f5f929f5a13b8b138ae
# good: [5e4c588054d52d1b25633c6074c5f3c6228e26ed] Merge branch 'irq/core'
git bisect good 5e4c588054d52d1b25633c6074c5f3c6228e26ed
# bad: [71c01930b42e5dd65d4820dea116bcbe95a0b768] locking/rwsem, x86: Clean up ____down_write()
git bisect bad 71c01930b42e5dd65d4820dea116bcbe95a0b768
# first bad commit: [71c01930b42e5dd65d4820dea116bcbe95a0b768] locking/rwsem, x86: Clean up ____down_write()
