From: Ingo Molnar <mingo@elte.hu>
Subject: Re: S3 sleep no longer works on x86_64 in 2.6.27
Date: Thu, 23 Oct 2008 14:51:04 +0200
Message-ID: <20081023125104.GA9506@elte.hu>
References: <20081023122405.GC14838@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57313 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752414AbYJWMvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 08:51:32 -0400
Content-Disposition: inline
In-Reply-To: <20081023122405.GC14838@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gleb Natapov <gleb@redhat.com>
Cc: gcosta@redhat.com, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Gleb Natapov <gleb@redhat.com> wrote:

> Hi,
> 
> S3 sleep no longer works on x86_64 (at least in KVM, but it looks like 
> this is the kernel bug). Kernel 2.6.26 works. I think that the commit 
> that caused the problem is a939098af, but I can't be 100% sure since 
> compilation is broken at this point.
> 
> Triple fault happens during S3 resume. It happens in 
> arch/x86/kernel/head_64.S during access to GDT after it was loaded on 
> line 213 (lgdt early_gdt_descr(%rip)) early_gdt_descr points to 
> per_cpu__gdt_page and this address contains valid GDT entries during a 
> regular boot, but on S3 resume in contains garbage. It seems that 
> per_cpu area is reallocated somewhere, but I don't understand this 
> magic enough to fix it. Can somebody look at this and explain what 
> happens?

could you check whether the (post-v2.6.27) upstream fix below does the 
trick for you?

	Ingo

--------------->

>From 3038edabf48f01421c621cb77a712b446d3a5d67 Mon Sep 17 00:00:00 2001
From: Rafael J. Wysocki <rjw@sisk.pl>
Date: Fri, 17 Oct 2008 01:26:27 +0200
Subject: [PATCH] x86 ACPI: fix breakage of resume on 64-bit UP systems with SMP kernel

x86 ACPI: Fix breakage of resume on 64-bit UP systems with SMP kernel

We are now using per CPU GDT tables in head_64.S and the original
early_gdt_descr.address is invalidated after boot by
setup_per_cpu_areas().  This breaks resume from suspend to RAM on
x86_64 UP systems using SMP kernels, because this part of head_64.S
is also executed during the resume and the invalid GDT address
causes the system to crash.  It doesn't break on 'true' SMP systems,
because early_gdt_descr.address is modified every time
native_cpu_up() runs.  However, during resume it should point to the
GDT of the boot CPU rather than to another CPU's GDT.

For this reason, during suspend to RAM always make
early_gdt_descr.address point to the boot CPU's GDT.

This fixes http://bugzilla.kernel.org/show_bug.cgi?id=11568, which
is a regression from 2.6.26.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
Acked-by: Pavel Machek <pavel@suse.cz>
Cc: <stable@kernel.org>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
Reported-and-tested-by: Andy Wettstein <ajw1980@gmail.com>
---
 arch/x86/kernel/acpi/sleep.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
index 426e5d9..c44cd6d 100644
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -10,6 +10,7 @@
 #include <linux/dmi.h>
 #include <linux/cpumask.h>
 #include <asm/segment.h>
+#include <asm/desc.h>
 
 #include "realmode/wakeup.h"
 #include "sleep.h"
@@ -98,6 +99,8 @@ int acpi_save_state_mem(void)
 	header->trampoline_segment = setup_trampoline() >> 4;
 #ifdef CONFIG_SMP
 	stack_start.sp = temp_stack + 4096;
+	early_gdt_descr.address =
+			(unsigned long)get_cpu_gdt_table(smp_processor_id());
 #endif
 	initial_code = (unsigned long)wakeup_long64;
 	saved_magic = 0x123456789abcdef0;
