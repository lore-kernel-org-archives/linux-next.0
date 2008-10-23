From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: linux-next: x86_64 UML broken
Date: Thu, 23 Oct 2008 18:14:55 +0400
Message-ID: <20081023141455.GA1594@x200.localdomain>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:15125 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbYJWOLo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 10:11:44 -0400
Received: by nf-out-0910.google.com with SMTP id d3so137561nfc.21
        for <linux-next@vger.kernel.org>; Thu, 23 Oct 2008 07:11:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rui.p.m.sousa@gmail.com, mingo@elte.hu

On um-x86_64-debug-y:

  SYMLINK arch/um/include/kern_constants.h
  SYMLINK arch/um/include/sysdep
make[2]: `arch/um/sys-x86_64/user-offsets.s' is up to date.
  Using /src/linux-1 as source for kernel
  GEN     /src/build/um-x86_64-debug-y/Makefile
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  CC      arch/um/kernel/asm-offsets.s
In file included from /src/linux-1/include/linux/spinlock.h:90,
                 from /src/linux-1/include/linux/seqlock.h:29,
                 from /src/linux-1/include/linux/time.h:8,
                 from /src/linux-1/include/linux/timex.h:57,
                 from /src/linux-1/include/linux/sched.h:54,
                 from arch/um/include/sysdep/kernel-offsets.h:2,
                 from /src/linux-1/arch/um/kernel/asm-offsets.c:1:
/src/linux-1/include/linux/spinlock_up.h: In function '__raw_spin_lock_flags':
/src/linux-1/include/linux/spinlock_up.h:31: error: implicit declaration of function 'local_irq_save'
In file included from /src/linux-1/include/linux/sched.h:77,
                 from arch/um/include/sysdep/kernel-offsets.h:2,
                 from /src/linux-1/arch/um/kernel/asm-offsets.c:1:
/src/linux-1/include/linux/proportions.h: In function 'prop_inc_percpu':
/src/linux-1/include/linux/proportions.h:77: error: implicit declaration of function 'local_irq_restore'
make[2]: *** [arch/um/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2
