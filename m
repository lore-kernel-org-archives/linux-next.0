From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the tip tree
Date: Mon, 24 Aug 2015 18:22:25 +1000
Message-ID: <20150824182225.76165d7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49065 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753807AbbHXIW2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Aug 2015 04:22:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  arch/x86/kernel/cpu/mshyperv.c

between commit:

  88c9281a9fba ("x86/hyperv: Mark the Hyper-V TSC as unstable")

from the tip tree and commit:

  2517281d63a2 ("Drivers: hv: vmbus: add special kexec handler")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/cpu/mshyperv.c
index 6fd023d7492d,f794bfa3c138..000000000000
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@@ -141,7 -186,8 +186,10 @@@ static void __init ms_hyperv_init_platf
  	no_timer_check = 1;
  #endif
  
 +	mark_tsc_unstable("running on Hyper-V");
++
+ 	machine_ops.shutdown = hv_machine_shutdown;
+ 	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
  }
  
  const __refconst struct hypervisor_x86 x86_hyper_ms_hyperv = {
