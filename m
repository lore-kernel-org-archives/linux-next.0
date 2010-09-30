From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the i.MX
	tree
Date: Thu, 30 Sep 2010 08:41:40 +0200
Message-ID: <20100930064140.GI29811@pengutronix.de>
References: <20100930112302.e554d367.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:49261 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab0I3Glo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2010 02:41:44 -0400
Content-Disposition: inline
In-Reply-To: <20100930112302.e554d367.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Thu, Sep 30, 2010 at 11:23:02AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the sound-asoc tree got a conflict in
> arch/arm/mach-mx3/devices.c between commit
> 4697bb926f43b8012ebd111ef43834f42126a0ef ("ARM: imx: dynamically allo=
cate
> imx-ssi devices") from the i.MX tree and commit
> f0fba2ad1b6b53d5360125c41953b7afcd6deff0 ("ASoC: multi-component - AS=
oC
> Multi-Component Support") from the sound-asoc tree.
>=20
> The former removed that code that the latter changed.  I just used th=
e
> former.
>=20
> The latter was just changing some names, so ti may be able to be
> integrated into the former.
I think the same problem exists for mx2.  Maybe git didn't notice as
arch/arm/mach-mx2/devices.c was moved to arch/arm/mach-imx/devices.c
(and merged with arch/arm/mach-mx1/devices.c)?!

I didn't test, but I guess we need the following patch squashed into th=
e
merge:

diff --git a/arch/arm/plat-mxc/devices/platform-imx-ssi.c b/arch/arm/pl=
at-mxc/devices/platform-imx-ssi.c
index 38a7a0b..6d74a25 100644
--- a/arch/arm/plat-mxc/devices/platform-imx-ssi.c
+++ b/arch/arm/plat-mxc/devices/platform-imx-ssi.c
@@ -101,7 +101,7 @@ struct platform_device *__init imx_add_imx_ssi(
 		DMARES(rx1),
 	};
=20
-	return imx_add_platform_device("imx-ssi", data->id,
+	return imx_add_platform_device("imx-ssi-dai", data->id,
 			res, ARRAY_SIZE(res),
 			pdata, sizeof(*pdata));
 }

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
