From: Qais Yousef <qsyousef@gmail.com>
Subject: Re: linux-next: Tree for Mar 14 (mips qemu failure bisected)
Date: Wed, 16 Mar 2016 22:17:41 +0000
Message-ID: <56E9DB85.9090405@gmail.com>
References: <20160314174037.0097df55@canb.auug.org.au>
 <20160314143729.GA31845@roeck-us.net> <20160315052659.GA9320@roeck-us.net>
 <56E884BA.5050103@gmail.com> <20160316001713.GA4412@roeck-us.net>
 <20160316132210.GA21918@roeck-us.net> <56E9C1CA.7050208@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070206070600080600020506"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56E9C1CA.7050208@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------070206070600080600020506
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2016 20:27, Qais Yousef wrote:
>
>
> On 16/03/2016 13:22, Guenter Roeck wrote:
>> On Tue, Mar 15, 2016 at 05:17:13PM -0700, Guenter Roeck wrote:
>>> On Tue, Mar 15, 2016 at 09:55:06PM +0000, Qais Yousef wrote:
>>>> Hi Guenter,
>>>>
>> [ ... ]
>>>>>> Qemu test results:
>>>>>>     total: 96 pass: 69 fail: 27
>>>>>> Failed tests:
>>>>> [ ... ]
>>>>>>     mips:mips_malta_smp_defconfig
>>>>> I bisected this failure to commit bb11cff327e54 ("MIPS: Make smp 
>>>>> CMP, CPS and MT
>>>>> use the new generic IPI functions". Bisect log is attached.
>>>> Thanks for bisecting this. I tested this on a real Malta system but 
>>>> not
>>>> qemu. I'll try to reproduce.
>>>>
>>> I run the tests with only a single CPU core enabled. Maybe that causes
>>> problems with your code ?
>>>
>> I ran another qemu test (this time on mainline) with "-smp 2", but 
>> the only
>> difference is that the image now gets stuck even earlier.
>>
>> Also, I ran another set of bisects, this time with both mips and mips64
>> on mainline (after your patch landed), with the same results.
>>
>> Guenter
>>
>
> OK thanks for the info. The offending commit just enables using quite 
> a few of the newly added code before that. So the problem could be in 
> any of the newly added code.
>
> Unfortunately I can only look at this during my limited time in the 
> evening and I have to setup my system to compile and run this, so I 
> won't be able to get to the bottom of this as fast as I'd like to.
>
> Qais

OK I was up and running faster than I thought I would be. Can you 
confirm that you're hitting a BUG_ON() in mips_smp_ipi_init()?

What I see is that BUG_ON() is hit because we couldn't find an ipidomain 
to allocate the ipis from. The reason of whih is that the qemu malta 
machine doesn't have a GIC though the config is compiled with GIC on. 
Also if I remember correctly qemu malta doesn't really support SMP. I 
think that was the reason I never ran this on qemu.

I'm not sure what's the best way forward here. I can add a check to 
verify gic_present inside this function and return early. Patch attached.

Ralf, thoughts?

Thanks,
Qais

--------------070206070600080600020506
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="0001-MIPS-Fix-broken-malta-qemu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-MIPS-Fix-broken-malta-qemu.patch"

>From fca2323ade4dd67e5fed6933a32e6739d3707ff7 Mon Sep 17 00:00:00 2001
From: Qais Yousef <qsyousef@gmail.com>
Date: Wed, 16 Mar 2016 21:55:04 +0000
Subject: [PATCH] MIPS: Fix broken malta qemu

Malta defconfig compile with GIC on. Hence when compiling for SMP it causes the
new IPI code to be activated. But on qemu malta there's no GIC causing a
BUG_ON(!ipidomain) to be hit in mips_smp_ipi_init().

Introduce an extra check that gic_preset is true and skip initialising IPIs if
it's not.

Signed-off-by: Qais Yousef <qsyousef@gmail.com>
---
 arch/mips/kernel/smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 37708d9..972f64d 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -33,6 +33,7 @@
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/ftrace.h>
+#include <linux/irqchip/mips-gic.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -243,6 +244,13 @@ static int __init mips_smp_ipi_init(void)
 	struct irq_domain *ipidomain;
 	struct device_node *node;
 
+	/*
+	 * If the config says GIC is present, but the harware doesn't actually
+	 * have it we could get stuffed, so double check that GIC is present
+	 */
+	if (WARN_ON(!gic_present))
+		return 0;
+
 	node = of_irq_find_parent(of_root);
 	ipidomain = irq_find_matching_host(node, DOMAIN_BUS_IPI);
 
-- 
1.9.1


--------------070206070600080600020506--
