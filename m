From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH linux-next] ARM: imx: fix imx_init_l2cache storage class
Date: Wed, 10 Jul 2013 22:30:53 +0800
Message-ID: <20130710143051.GA24654@S2101-09.ap.freescale.net>
References: <1373449546-1040-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:41309 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750736Ab3GJO3w convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jul 2013 10:29:52 -0400
Content-Disposition: inline
In-Reply-To: <1373449546-1040-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, trivial@kernel.org

Vincent,

Sorry.  I was not aware of that imx_v6_v7_defconfig does not have
CACHE_L2X0 enabled, so I did not catch it with my testing.  Thanks for
fixing it.

On Wed, Jul 10, 2013 at 11:45:46AM +0200, Vincent Stehl=C3=A9 wrote:
> Commit 879ec1ceeac21285d62606c1e96520887efcd9bc makes imx_init_l2cach=
e a common
> function and updates the header declaration accordingly. Fix function=
 storage
> class, too.
>=20
The commit ID is not stable, and I dropped it and applied the patch.

Shawn

> This fixes the following compilation error:
>=20
>   arch/arm/mach-imx/system.c:101:123: error: static declaration of =E2=
=80=98imx_init_l2cache=E2=80=99 follows non-static declaration
>   In file included from arch/arm/mach-imx/system.c:32:0:
>   arch/arm/mach-imx/common.h:165:13: note: previous declaration of =E2=
=80=98imx_init_l2cache=E2=80=99 was here
>   arch/arm/mach-imx/system.c:101:123: warning: =E2=80=98imx_init_l2ca=
che=E2=80=99 defined but not used [-Wunused-function]
>=20
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@freescale.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: trivial@kernel.org
> ---
>=20
>=20
> Hi,
>=20
> Linux next-20130710 breaks compilation of ARM multi_v7_defconfig. Thi=
s patch fixes it.
>=20
> (Note: this patch is necessary for the link, too: http://www.spinics.=
net/lists/kernel/msg1563777.html)
>=20
> Best regards,
>=20
> V.
>=20
>=20
>  arch/arm/mach-imx/system.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-imx/system.c b/arch/arm/mach-imx/system.c
> index e5592ca..64ff37e 100644
> --- a/arch/arm/mach-imx/system.c
> +++ b/arch/arm/mach-imx/system.c
> @@ -98,7 +98,7 @@ void __init mxc_arch_reset_init_dt(void)
>  }
> =20
>  #ifdef CONFIG_CACHE_L2X0
> -static void __init imx_init_l2cache(void)
> +void __init imx_init_l2cache(void)
>  {
>  	void __iomem *l2x0_base;
>  	struct device_node *np;
> --=20
> 1.7.10.4
>=20
>=20
>=20
