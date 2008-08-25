From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Mon, 25 Aug 2008 16:44:18 +1000
Message-ID: <20080825164418.3e74cad0.sfr@canb.auug.org.au>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42840 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751549AbYHYGoZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:44:25 -0400
In-Reply-To: <20080807133525.8901e2ef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Herbert,

On Thu, 7 Aug 2008 13:35:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the crypto tree got a conflict in
> include/asm-x86/cpufeature.h between commit
> 32e1d0a0651004f5fe47f85a2a5c725ad579a90c ("x64, x2apic/intr-remap: cpuid
> bits for x2apic feature") from the x86 tree and commit
> 1f4f8a5d7935c81b5b3c7601ec9ac021db30ba4f ("crypto: crc32c - Use Intel
> CRC32 instruction") from the crypto tree.
> 
> Just simple overlapping additions.  I added both of them and can carry
> the fixup.

This now also conflicts with commit
a648bf4632628c787abb0514277f2a231fca39ca ("x86, xsave: xsave cpuid
feature bits") from the x86 tree.

The fixup looks like below.  Maybe the X86_FEATURE_XMM4_2 bits could also
be added in the x86 tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/asm-x86/cpufeature.h
index 5ffd493,762f6a6..0000000
--- a/include/asm-x86/cpufeature.h
+++ b/include/asm-x86/cpufeature.h
@@@ -92,8 -91,7 +92,9 @@@
  #define X86_FEATURE_CX16	(4*32+13) /* CMPXCHG16B */
  #define X86_FEATURE_XTPR	(4*32+14) /* Send Task Priority Messages */
  #define X86_FEATURE_DCA		(4*32+18) /* Direct Cache Access */
+ #define X86_FEATURE_XMM4_2	(4*32+20) /* Streaming SIMD Extensions-4.2 */
 +#define X86_FEATURE_X2APIC	(4*32+21) /* x2APIC */
 +#define X86_FEATURE_XSAVE	(4*32+26) /* XSAVE */
  
  /* VIA/Cyrix/Centaur-defined CPU features, CPUID level 0xC0000001, word 5 */
  #define X86_FEATURE_XSTORE	(5*32+ 2) /* on-CPU RNG present (xstore insn) */
@@@ -192,8 -190,7 +193,9 @@@ extern const char * const x86_power_fla
  #define cpu_has_gbpages		boot_cpu_has(X86_FEATURE_GBPAGES)
  #define cpu_has_arch_perfmon	boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
  #define cpu_has_pat		boot_cpu_has(X86_FEATURE_PAT)
+ #define cpu_has_xmm4_2		boot_cpu_has(X86_FEATURE_XMM4_2)
 +#define cpu_has_x2apic		boot_cpu_has(X86_FEATURE_X2APIC)
 +#define cpu_has_xsave		boot_cpu_has(X86_FEATURE_XSAVE)
  
  #if defined(CONFIG_X86_INVLPG) || defined(CONFIG_X86_64)
  # define cpu_has_invlpg		1
