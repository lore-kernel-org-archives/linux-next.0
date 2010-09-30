From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the i.MX
	tree
Date: Thu, 30 Sep 2010 08:52:02 +0200
Message-ID: <20100930065202.GK29811@pengutronix.de>
References: <20100930112302.e554d367.sfr@canb.auug.org.au> <20100930064140.GI29811@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:54800 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753663Ab0I3GwE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2010 02:52:04 -0400
Content-Disposition: inline
In-Reply-To: <20100930064140.GI29811@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

Hello,

On Thu, Sep 30, 2010 at 08:41:40AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Sep 30, 2010 at 11:23:02AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the sound-asoc tree got a conflict in
> > arch/arm/mach-mx3/devices.c between commit
> > 4697bb926f43b8012ebd111ef43834f42126a0ef ("ARM: imx: dynamically al=
locate
> > imx-ssi devices") from the i.MX tree and commit
> > f0fba2ad1b6b53d5360125c41953b7afcd6deff0 ("ASoC: multi-component - =
ASoC
> > Multi-Component Support") from the sound-asoc tree.
> >=20
> > The former removed that code that the latter changed.  I just used =
the
> > former.
> >=20
> > The latter was just changing some names, so ti may be able to be
> > integrated into the former.
> I think the same problem exists for mx2.  Maybe git didn't notice as
> arch/arm/mach-mx2/devices.c was moved to arch/arm/mach-imx/devices.c
> (and merged with arch/arm/mach-mx1/devices.c)?!
>=20
> I didn't test, but I guess we need the following patch squashed into =
the
> merge:
>=20
> diff --git a/arch/arm/plat-mxc/devices/platform-imx-ssi.c b/arch/arm/=
plat-mxc/devices/platform-imx-ssi.c
> index 38a7a0b..6d74a25 100644
> --- a/arch/arm/plat-mxc/devices/platform-imx-ssi.c
> +++ b/arch/arm/plat-mxc/devices/platform-imx-ssi.c
> @@ -101,7 +101,7 @@ struct platform_device *__init imx_add_imx_ssi(
>  		DMARES(rx1),
>  	};
> =20
> -	return imx_add_platform_device("imx-ssi", data->id,
> +	return imx_add_platform_device("imx-ssi-dai", data->id,
>  			res, ARRAY_SIZE(res),
>  			pdata, sizeof(*pdata));
>  }
I just noticed there are some more problems:

	ukl@octopus:~/gsrc/linux-2.6$ git grep \"imx-ssi[^-] next/master -- ar=
ch/arm/mach-{imx,mx*}
	next/master:arch/arm/mach-imx/clock-imx27.c:    _REGISTER_CLOCK("imx-s=
si.0", NULL, ssi1_clk)
	next/master:arch/arm/mach-imx/clock-imx27.c:    _REGISTER_CLOCK("imx-s=
si.1", NULL, ssi2_clk)
	next/master:arch/arm/mach-mx25/clock.c: _REGISTER_CLOCK("imx-ssi.0", N=
ULL, ssi1_clk)
	next/master:arch/arm/mach-mx25/clock.c: _REGISTER_CLOCK("imx-ssi.1", N=
ULL, ssi2_clk)
	next/master:arch/arm/mach-mx5/clock-mx51.c:     _REGISTER_CLOCK("imx-s=
si.0", NULL, ssi1_clk)
	next/master:arch/arm/mach-mx5/clock-mx51.c:     _REGISTER_CLOCK("imx-s=
si.1", NULL, ssi2_clk)

The change to clock-imx27.c got lost similar to mx2/devices.c.  When
f0fba2ad1b6b53d5360125c41953b7afcd6deff0 was commited
arch/arm/mach-mx5/clock-mx51.c and arch/arm/mach-mx25/clock.c didn't
contain the clock for imx-ssi, yet.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
