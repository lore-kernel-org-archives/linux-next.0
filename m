From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 31 Mar 2014 18:56:08 -0700
Message-ID: <533A1CB8.1060401@zytor.com>
References: <20140224151732.7461213fabef4fc1bbca8213@canb.auug.org.au>	<20140306150010.e873f440ac5a22d8812268a4@canb.auug.org.au>	<20140328165238.7d9e0804a2781eaaa88a4fa5@canb.auug.org.au>	<alpine.DEB.2.02.1403311140180.14882@ionos.tec.linutronix.de>	<20140331215743.a357aa685a63c06ea303dbba@canb.auug.org.au> <20140401112637.454be94f789d5fd9db729dcd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:51422 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751032AbaDAB5E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Mar 2014 21:57:04 -0400
In-Reply-To: <20140401112637.454be94f789d5fd9db729dcd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>

On 03/31/2014 05:26 PM, Stephen Rothwell wrote:
> 
> And today from Linus' tree I get these:
> 
> x86_64_allmodconfig:
> 
> arch/x86/crypto/sha1_ssse3_glue.c:43:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes] static asmlinkage void (*sha1_transform_asm)(u32 *,
> const char *, unsigned int); ^ 
> arch/x86/crypto/sha256_ssse3_glue.c:56:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes] static asmlinkage void (*sha256_transform_asm)(const
> char *, u32 *, u64); ^ arch/x86/crypto/sha512_ssse3_glue.c:55:1:
> warning: 'externally_visible' attribute have effect only on public
> objects [-Wattributes] static asmlinkage void
> (*sha512_transform_asm)(const char *, u64 *, u64); ^
> 
> arm_multi_v7_defconfig:
> 
> drivers/irqchip/irq-sun4i.c:39:70: warning: 'externally_visible'
> attribute have effect only on public objects [-Wattributes] 
> drivers/irqchip/irq-sun4i.c:140:1: warning: 'externally_visible'
> attribute have effect only on public objects [-Wattributes] 
> drivers/irqchip/irq-armada-370-xp.c:357:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes] drivers/irqchip/irq-gic.c:283:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes] drivers/irqchip/irq-sirfsoc.c:51:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes] drivers/irqchip/irq-vt8500.c:183:1: warning:
> 'externally_visible' attribute have effect only on public objects
> [-Wattributes]
> 

Please see the tree "[GIT PULL] x86 LTO changes for v3.15".

	-hpa
