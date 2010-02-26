From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the usb tree with the i.MX tree
Date: Fri, 26 Feb 2010 09:04:03 +0100
Message-ID: <20100226080403.GA24846@pengutronix.de>
References: <20100226182545.b4d5b6c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:35989 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935455Ab0BZIEK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2010 03:04:10 -0500
Content-Disposition: inline
In-Reply-To: <20100226182545.b4d5b6c7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Fuzzey <mfuzzey@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>

Hi Stephen,

On Fri, Feb 26, 2010 at 06:25:45PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the usb tree got a conflict in
> arch/arm/mach-mx2/devices.c between various commits from the i.MX tre=
e
> and commits 304ae32ac8ac68ac5a091a67187645dc84b6067c ("USB: MXC: use
> DMA_BIT_MASK macro rather than hardcoded constants") and
> 3f1c5d0f4c64f5e9e4ac329a935b3da67593691f ("USB: MXC: add platform
> resources for i.MX21 USB host controller") from the usb tree.
>=20
> I fixed it up (I think - see below) and cam carry the fixes as necess=
ary.
looks OK for me, too.

thanks Stephen,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
