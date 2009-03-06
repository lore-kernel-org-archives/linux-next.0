From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpufreq tree with the x86 tree
Date: Fri, 6 Mar 2009 15:26:19 +1100
Message-ID: <20090306152619.f919772e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56774 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753344AbZCFE0Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 23:26:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Matthias-Christian Ott <ott@mirix.org>

Hi Dave,

Today's linux-next merge of the cpufreq tree got a conflict in
arch/x86/include/asm/timer.h between commit
8e6dafd6c741cd4679b4de3c5d9698851e4fa59c ("x86: refactor x86_quirks
support") from the x86 tree and commit
199785eac892a1fa1b71cc22bec58e8b156d9311 ("[CPUFREQ] p4-clockmod reports
wrong frequency") from the cpufreq tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/include/asm/timer.h
index a81195e,4f5c247..0000000
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@@ -12,9 -11,8 +12,9 @@@ unsigned long native_calibrate_tsc(void
  
  #ifdef CONFIG_X86_32
  extern int timer_ack;
- extern int recalibrate_cpu_khz(void);
 -#endif
 +extern irqreturn_t timer_interrupt(int irq, void *dev_id);
 +#endif /* CONFIG_X86_32 */
+ extern int recalibrate_cpu_khz(void);
  
  extern int no_timer_check;
  
