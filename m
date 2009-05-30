From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for May 29 (__rdmsr_on_cpu() OOPS)
Date: Sat, 30 May 2009 21:37:57 +0200
Message-ID: <200905302137.57644.bzolnier@gmail.com>
References: <20090529145018.ff547ea1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:55654 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756167AbZE3Tff (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 May 2009 15:35:35 -0400
In-Reply-To: <20090529145018.ff547ea1.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <borislav.petkov@amd.com>


next-20090529 oopses in __rdmsr_on_cpu() on my Pentium M laptop.

.jpg + .config:
http://www.kernel.org/pub/linux/kernel/people/bart/next-20090529-oops.*

(gdb) l *0xc023410f
0xc023410f is in __rdmsr_on_cpu (arch/x86/lib/msr.c:25).
20              if (rv->msrs)
21                      reg = &rv->msrs[this_cpu - rv->off];
22              else
23                      reg = &rv->reg;
24
25              rdmsr(rv->msr_no, reg->l, reg->h);
26      }
27
28      static void __wrmsr_on_cpu(void *info)
29      {

Thus the problem seems to be introduced by:

commit 23d19840368b2787d2da97ad0f0f29248503648a
Author: Borislav Petkov <borislav.petkov@amd.com>
Date:   Fri May 22 13:52:19 2009 +0200

    x86: MSR: add methods for writing of an MSR on several CPUs
...

and indeed the following patch fixes it:

[ Borislav, feel free to fold it into the above change or replace by
  a more complete one if needed (there may be more rv fields needing
  initialization). ]

From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] x86: MSR: fix __rdmsr_on_cpu() OOPS

{rd,wr}msr_on_cpu() need to explicitly initalize rv.msrs
(since rv is allocated on the stack).

Cc: Borislav Petkov <borislav.petkov@amd.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
 arch/x86/lib/msr.c |    2 ++
 1 file changed, 2 insertions(+)

Index: b/arch/x86/lib/msr.c
===================================================================
--- a/arch/x86/lib/msr.c
+++ b/arch/x86/lib/msr.c
@@ -44,6 +44,7 @@ int rdmsr_on_cpu(unsigned int cpu, u32 m
 	int err;
 	struct msr_info rv;
 
+	rv.msrs   = NULL;
 	rv.msr_no = msr_no;
 	err = smp_call_function_single(cpu, __rdmsr_on_cpu, &rv, 1);
 	*l = rv.reg.l;
@@ -58,6 +59,7 @@ int wrmsr_on_cpu(unsigned int cpu, u32 m
 	int err;
 	struct msr_info rv;
 
+	rv.msrs   = NULL;
 	rv.msr_no = msr_no;
 	rv.reg.l = l;
 	rv.reg.h = h;
