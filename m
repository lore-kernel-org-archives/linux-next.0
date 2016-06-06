From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 6 Jun 2016 14:03:27 +1000
Message-ID: <20160606140327.09e40ec6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52542 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750764AbcFFED3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jun 2016 00:03:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

include/linux/kexec.h: In function 'boot_phys_to_virt':
include/linux/kexec.h:358:9: error: implicit declaration of function 'phys_to_virt' [-Werror=implicit-function-declaration]
  return phys_to_virt(boot_phys_to_phys(entry));
         ^
include/linux/kexec.h:358:9: error: return makes pointer from integer without a cast [-Werror=int-conversion]
In file included from arch/powerpc/platforms/cell/ras.c:22:0:
arch/powerpc/include/asm/io.h: At top level:
arch/powerpc/include/asm/io.h:801:22: error: conflicting types for 'phys_to_virt'
 static inline void * phys_to_virt(unsigned long address)
                      ^
In file included from arch/powerpc/platforms/cell/ras.c:17:0:
include/linux/kexec.h:358:9: note: previous implicit declaration of 'phys_to_virt' was here
  return phys_to_virt(boot_phys_to_phys(entry));
         ^
In file included from kernel/ksysfs.c:16:0:
include/linux/kexec.h: In function 'boot_phys_to_virt':
include/linux/kexec.h:358:9: error: implicit declaration of function 'phys_to_virt' [-Werror=implicit-function-declaration]
  return phys_to_virt(boot_phys_to_phys(entry));
         ^
include/linux/kexec.h:358:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
In file included from include/linux/crash_dump.h:5:0,
                 from arch/powerpc/kernel/crash_dump.c:14:
include/linux/kexec.h: In function 'boot_phys_to_virt':
include/linux/kexec.h:358:9: error: implicit declaration of function 'phys_to_virt' [-Werror=implicit-function-declaration]
  return phys_to_virt(boot_phys_to_phys(entry));
         ^
include/linux/kexec.h:358:9: error: return makes pointer from integer without a cast [-Werror=int-conversion]
In file included from include/linux/io.h:25:0,
                 from arch/powerpc/kernel/crash_dump.c:15:
arch/powerpc/include/asm/io.h: At top level:
arch/powerpc/include/asm/io.h:801:22: error: conflicting types for 'phys_to_virt'
 static inline void * phys_to_virt(unsigned long address)
                      ^
In file included from include/linux/crash_dump.h:5:0,
                 from arch/powerpc/kernel/crash_dump.c:14:
include/linux/kexec.h:358:9: note: previous implicit declaration of 'phys_to_virt' was here
  return phys_to_virt(boot_phys_to_phys(entry));
         ^

Caused by commit

  4382eb9055be ("kexec: allow architectures to override boot mapping")

Architecture seem to define phys_to_virt() in either asm/io.h or
asm/memory.h or asm/virtconvert.h or asm/page*.h ... or asm-generic/io.h.
:-(

I have reverted that commit for today (and commit c9aaeae038fa ("ARM:
kexec: fix kexec for Keystone 2")).

-- 
Cheers,
Stephen Rothwell
