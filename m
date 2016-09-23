From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Date: Fri, 23 Sep 2016 09:43:17 +0100
Message-ID: <57E4EB25.2020206@arm.com>
References: <20160923133116.707a8f07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160923133116.707a8f07@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 23/09/16 04:31, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> tmp/cc9rCfjd.s: Assembler messages:
> tmp/cc9rCfjd.s:310: Error: bad or missing co-processor number -- `mcr "mrc","mcr","p15, 0, r2, c12, c12, 3",u32'
> scripts/Makefile.build:290: recipe for target 'drivers/irqchip/irq-gic-v3.o' failed
> 
> Maybe caused by commit
> 
>   4f2546384150 ("ARM: Move system register accessors to asm/cp15.h")
> 
> I have used the kvm-arm tree from next-20160922 for today.

Ouch. This comes from 91ef844 ("irqchip/gic-v3: Reset BPR during
initialization") which has introduced a new accessor that doesn't get
converted by Vladimir's patch. My own fault.

This can be fixed-up by adding this to Vladimir's patch:

diff --git a/arch/arm/include/asm/arch_gicv3.h b/arch/arm/include/asm/arch_gicv3.h
index 996848e..809f3be 100644
--- a/arch/arm/include/asm/arch_gicv3.h
+++ b/arch/arm/include/asm/arch_gicv3.h
@@ -216,6 +216,15 @@ static inline void gic_write_sre(u32 val)
 	isb();
 }
 
+static inline void gic_write_bpr1(u32 val)
+{
+#ifndef __write_sysreg
+	asm volatile("mcr " __stringify(ICC_BPR1) : : "r" (val));
+#else
+	write_sysreg(val, ICC_BPR1);
+#endif
+}
+
 /*
  * Even in 32bit systems that use LPAE, there is no guarantee that the I/O
  * interface provides true 64bit atomic accesses, so using strd/ldrd doesn't

but that'll create a minor conflict.

Another possibility is to put Vladimir's series on the backburner until
tip/irq/core gets in, and bring it back at this time. I'd prefer the
first solution, as it gives a bit more exposure to the code...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
