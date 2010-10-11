From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm tree with the arm-current tree
Date: Mon, 11 Oct 2010 12:24:41 +1100
Message-ID: <20101011122441.606a0643.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42853 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752671Ab0JKBYp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Oct 2010 21:24:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Larsen <al@alarsen.net>, Greg Ungerer <gerg@snapgear.com>

Hi Russell,

Today's linux-next merge of the arm tree got a conflict in
arch/arm/mach-at91/include/mach/system.h between commit
5c189208b606a85b4e97109af70d59f10a42fdfd ("ARM: 6436/1: AT91: Fix
power-saving in idle-mode on 926T processors") from the arm-current tree
and commit cb809b1a5ebffca8cf0314b788919989e8e4ab5f ("AT91: fix use of
clock disable on idle for AT91x40 devices") from the arm tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-at91/include/mach/system.h
index ee8db15,bfbb612..0000000
--- a/arch/arm/mach-at91/include/mach/system.h
+++ b/arch/arm/mach-at91/include/mach/system.h
@@@ -32,12 -33,16 +32,16 @@@ static inline void arch_idle(void
  	 * Disable the processor clock.  The processor will be automatically
  	 * re-enabled by an interrupt or by a reset.
  	 */
+ #ifdef AT91_PS
+ 	at91_sys_write(AT91_PS_CR, AT91_PS_CR_CPU);
+ #else
  	at91_sys_write(AT91_PMC_SCDR, AT91_PMC_PCK);
+ #endif
 -#else
 +#ifndef CONFIG_CPU_ARM920T
  	/*
  	 * Set the processor (CP15) into 'Wait for Interrupt' mode.
 -	 * Unlike disabling the processor clock via the PMC (above)
 -	 *  this allows the processor to be woken via JTAG.
 +	 * Post-RM9200 processors need this in conjunction with the above
 +	 * to save power when idle.
  	 */
  	cpu_do_idle();
  #endif
