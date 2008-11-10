From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: Tree for November 10
Date: Mon, 10 Nov 2008 15:26:52 +0300
Message-ID: <20081110122652.GA20072@x200.localdomain>
References: <20081110181649.fa586eb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.174]:16518 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754708AbYKJMX3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 07:23:29 -0500
Content-Disposition: inline
In-Reply-To: <20081110181649.fa586eb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a reminder that x86_64 UML is still busted:

  CC      arch/um/kernel/asm-offsets.s
In file included from arch/um/include/asm/fixmap.h:5,
                 from arch/um/include/shared/um_uaccess.h:10,
                 from arch/um/include/asm/uaccess.h:41,
                 from arch/um/include/asm/thread_info.h:13,
                 from include/linux/thread_info.h:55,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:50,
                 from include/linux/seqlock.h:29,
                 from include/linux/time.h:8,
                 from include/linux/timex.h:57,
                 from include/linux/sched.h:54,
                 from arch/um/sys-x86_64/shared/sysdep/kernel-offsets.h:2,
                 from arch/um/kernel/asm-offsets.c:1:
arch/um/include/asm/system.h:16:1: warning: "raw_local_irq_restore" redefined

			...

                 from arch/um/kernel/asm-offsets.c:1:
include/linux/proportions.h: In function 'prop_inc_percpu':
include/linux/proportions.h:75: error: implicit declaration of function 'local_irq_save'
include/linux/proportions.h:77: error: implicit declaration of function 'local_irq_restore'
