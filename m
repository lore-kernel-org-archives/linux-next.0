From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the i.MX tree with the arm-soc tree
Date: Fri, 9 Sep 2011 08:41:36 +0200
Message-ID: <20110909064136.GG28816@pengutronix.de>
References: <20110909114016.4a2a35295d3c84e37663289e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60019 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888Ab1IIGlh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Sep 2011 02:41:37 -0400
Content-Disposition: inline
In-Reply-To: <20110909114016.4a2a35295d3c84e37663289e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hello,

On Fri, Sep 09, 2011 at 11:40:16AM +1000, Stephen Rothwell wrote:
> The conflict looks like this:
>=20
> diff --cc arch/arm/mach-imx/Makefile
> index f87cc55,d22096a..0000000
> --- a/arch/arm/mach-imx/Makefile
> +++ b/arch/arm/mach-imx/Makefile
> @@@ -3,7 -3,7 +3,11 @@@ obj-$(CONFIG_IMX_HAVE_DMA_V1) +=3D dma-v1
>   obj-$(CONFIG_SOC_IMX1) +=3D clock-imx1.o mm-imx1.o
>   obj-$(CONFIG_SOC_IMX21) +=3D clock-imx21.o mm-imx21.o
>  =20
> ++<<<<<<< HEAD
>  +obj-$(CONFIG_SOC_MX25) +=3D clock-imx25.o mm-imx25.o ehci-imx25.o c=
pu-imx25.o
> ++=3D=3D=3D=3D=3D=3D=3D
> + obj-$(CONFIG_SOC_IMX25) +=3D clock-imx25.o mm-imx25.o ehci-imx25.o =
cpu-imx25.o
> ++>>>>>>> i.MX/for-next
>  =20
>   obj-$(CONFIG_SOC_IMX27) +=3D cpu-imx27.o pm-imx27.o
>   obj-$(CONFIG_SOC_IMX27) +=3D clock-imx27.o mm-imx27.o ehci-imx27.o
>=20
> Given that there are no other references to SOC_MX25 in the resulting
> tree, I used the latter version.
That's right.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
