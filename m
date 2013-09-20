From: Jim Davis <jim.epost@gmail.com>
Subject: Problem building i386_defconfig with next-20130920
Date: Fri, 20 Sep 2013 10:07:42 -0700
Message-ID: <CA+r1ZhjS+97EhQYXYSg-U9-SCrymoDmMu9JceBVyj7Wt0N3vgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qe0-f53.google.com ([209.85.128.53]:60466 "EHLO
	mail-qe0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105Ab3ITRHn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2013 13:07:43 -0400
Received: by mail-qe0-f53.google.com with SMTP id jy17so461794qeb.12
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2013 10:07:42 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Trying to build a x86 kernel is failing with

kernel/bounds.c:1:0: error: CPU you selected does not support x86-64
instruction set
 /*
 ^
kernel/bounds.c:1:0: warning: -mregparm is ignored in 64-bit mode
[enabled by default]
make[1]: *** [kernel/bounds.s] Error 1
make: *** [prepare0] Error 2

Here's the steps I've gone through in detail, just in case it's pilot e=
rror :/

jim@krebstar:~/linux$ make distclean
  CLEAN   arch/x86/tools
  CLEAN   .tmp_versions
  CLEAN   scripts/basic
  CLEAN   scripts/kconfig
  CLEAN   include/config include/generated arch/x86/include/generated
  CLEAN   .config include/generated/uapi/linux/version.h
jim@krebstar:~/linux$ git clean -fdx
jim@krebstar:~/linux$ git remote -v
linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
(fetch)
linux-next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
(push)
origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
(fetch)
origin    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git
(push)
jim@krebstar:~/linux$ git remote update
=46etching origin
=46etching linux-next
jim@krebstar:~/linux$ git describe
v3.12-rc1
jim@krebstar:~/linux$ git tag | grep '^next-' | tail -1
next-20130920
jim@krebstar:~/linux$ make i386_defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
jim@krebstar:~/linux$ make
scripts/kconfig/conf --silentoldconfig Kconfig
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/syscalls/../include/generated/asm/syscalls_32.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  CHK     include/config/kernel.release
  UPD     include/config/kernel.release
  WRAP    arch/x86/include/generated/asm/clkdev.h
  CHK     include/generated/uapi/linux/version.h
  UPD     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  CC      kernel/bounds.s
gcc: warning: =91-mcpu=3D=92 is deprecated; use =91-mtune=3D=92 or =91-=
march=3D=92 instead
kernel/bounds.c:1:0: error: CPU you selected does not support x86-64
instruction set
 /*
 ^
kernel/bounds.c:1:0: warning: -mregparm is ignored in 64-bit mode
[enabled by default]
make[1]: *** [kernel/bounds.s] Error 1
make: *** [prepare0] Error 2
