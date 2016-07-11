From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the kspp tree
Date: Mon, 11 Jul 2016 15:11:00 +1000
Message-ID: <20160711151100.02c0b012@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57919 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751078AbcGKFLD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 01:11:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/x86_init.c

between commit:

  255303026193 ("x86: apply more __ro_after_init and const")

from the kspp tree and commit:

  1bf8915ae515 ("x86/tsc: Enumerate SKL cpu_khz and tsc_khz via CPUID")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/x86_init.c
index 111b838db7fe,58b459296e13..000000000000
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@@ -91,7 -91,8 +91,8 @@@ struct x86_cpuinit_ops x86_cpuinit = 
  static void default_nmi_init(void) { };
  static int default_i8042_detect(void) { return 1; };
  
 -struct x86_platform_ops x86_platform = {
 +struct x86_platform_ops x86_platform __ro_after_init = {
+ 	.calibrate_cpu			= native_calibrate_cpu,
  	.calibrate_tsc			= native_calibrate_tsc,
  	.get_wallclock			= mach_get_cmos_time,
  	.set_wallclock			= mach_set_rtc_mmss,
