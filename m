From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the usb tree with the i.MX tree
Date: Fri, 26 Feb 2010 09:04:22 +0100
Message-ID: <20100226080422.GB24846@pengutronix.de>
References: <20100226181003.a08c83cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:36006 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935455Ab0BZIEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2010 03:04:25 -0500
Content-Disposition: inline
In-Reply-To: <20100226181003.a08c83cf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Fuzzey <mfuzzey@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>

On Fri, Feb 26, 2010 at 06:10:03PM +1100, Stephen Rothwell wrote:
> Hi Greg,
>=20
> Today's linux-next merge of the usb tree got a conflict in
> arch/arm/mach-mx2/devices.h between commit
> 68c94b40b31926f627573a7f656b903f6644744e ("arm/mx2: use cpp magic to
> create spi_imx devices") from the i.MX tree and commit
> 3f1c5d0f4c64f5e9e4ac329a935b3da67593691f ("USB: MXC: add platform
> resources for i.MX21 USB host controller") from the usb tree.
>=20
> Just context changes.  I fixed it up (see below) and can carry the fi=
x as
> necessary.
Looks OK, thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
