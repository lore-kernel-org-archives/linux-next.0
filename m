From: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>
Subject: Re: [PATCH next] ARM: virt: fix build of hyp-stub
Date: Fri, 19 Feb 2016 10:18:02 +0000
Message-ID: <20160219101802.GA4524@e106794-lin.cambridge.arm.com>
References: <1455838277-11083-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455838277-11083-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Hi Vincent,

On Fri, Feb 19, 2016 at 12:31:17AM +0100, Vincent Stehl=C3=A9 wrote:
> Compile hyp-stub explicitly for arm v7-a. This fixes the following bu=
ild
> errors:
>=20
>   arch/arm/kernel/hyp-stub.S: Assembler messages:
>   arch/arm/kernel/hyp-stub.S:168: Error: selected processor does not =
support `ubfx r7,r7,#28,#4' in ARM mode
>   arch/arm/kernel/hyp-stub.S:176: Error: selected processor does not =
support `isb' in ARM mode
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
> Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>=20
>=20
> Hi,
>=20
> This can be seen with linux next-20160218 and arm e.g. allmodconfig.

Thanks for doing this. I just posted my fix to the patch system, before
seeing yours (it also requires change in boot/compressed/Makefile -
hyp-stub is built twice). See the previous discussion about this issue
here: http://thread.gmane.org/gmane.linux.ports.arm.kernel/479256

Thanks,
Jean-Philippe

>=20
> Best regards,
>=20
> V.
>=20
>=20
>  arch/arm/kernel/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index 2c5f160..15684c5 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -88,6 +88,8 @@ obj-$(CONFIG_DEBUG_LL)	+=3D debug.o
>  obj-$(CONFIG_EARLY_PRINTK)	+=3D early_printk.o
> =20
>  obj-$(CONFIG_ARM_VIRT_EXT)	+=3D hyp-stub.o
> +AFLAGS_hyp-stub.o		:=3D-Wa,-march=3Darmv7-a
> +
>  ifeq ($(CONFIG_ARM_PSCI),y)
>  obj-$(CONFIG_SMP)		+=3D psci_smp.o
>  endif
> --=20
> 2.7.0
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
