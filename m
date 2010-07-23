From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the catalin tree with the arm tree
Date: Fri, 23 Jul 2010 13:15:14 +1000
Message-ID: <20100723131514.8d3b97e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

Today's linux-next merge of the catalin tree got a conflict in
arch/arm/kernel/entry-armv.S between commit
df0698be14c6683606d5df2d83e3ae40f85ed0d9 ("ARM: stack protector: change
the canary value per task") from the arm tree and commit
838105a674b7b72cb26c346155a40901c5bf7723 ("ARM: Remove the domain
switching on ARMv6k/v7 CPUs") from the catalin tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/kernel/entry-armv.S
index bb8e93a,d05e080..0000000
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@@ -737,12 -737,7 +737,12 @@@ ENTRY(__switch_to
  	ldr	r6, [r2, #TI_CPU_DOMAIN]
  #endif
  	set_tls	r3, r4, r5
 +#if defined(CONFIG_CC_STACKPROTECTOR) && !defined(CONFIG_SMP)
 +	ldr	r7, [r2, #TI_TASK]
 +	ldr	r8, =__stack_chk_guard
 +	ldr	r7, [r7, #TSK_STACK_CANARY]
 +#endif
- #ifdef CONFIG_MMU
+ #ifdef CONFIG_CPU_USE_DOMAINS
  	mcr	p15, 0, r6, c3, c0, 0		@ Set domain register
  #endif
  	mov	r5, r0
