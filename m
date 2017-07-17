From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [linux-next][bisected 1c0eaf0f] Today's next kernel fails to boot on ppc bare-metal
Date: Mon, 17 Jul 2017 12:10:59 +1000
Message-ID: <87mv8324p8.fsf@concordia.ellerman.id.au>
References: <1500025360.5335.37.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500025360.5335.37.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, benh@kernel.crashing.org, mikey@neuling.org
List-Id: linux-next.vger.kernel.org

Hi Abdul,

Thanks for the bug report.

Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> Hi 
>
> Today's linux-next fails to boot on ppc bare-metal
>
> Test: Boot
> Machine: Power 8 bare-metal
> kernel: 4.12.0-next-20170713
> gcc: version 4.8.5
> config : Tul-NV-config attached.

[swearing redacted]

Does this help?

cheers


diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 9b87abb178f0..cad6b57ce494 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -78,7 +78,7 @@ void opal_configure_cores(void)
 	 *  ie. Host hash  supports  hash guests
 	 *      Host radix supports  hash/radix guests
 	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+	if (early_cpu_has_feature(CPU_FTR_ARCH_300)) {
 		reinit_flags |= OPAL_REINIT_CPUS_MMU_HASH;
 		if (early_radix_enabled())
 			reinit_flags |= OPAL_REINIT_CPUS_MMU_RADIX;
