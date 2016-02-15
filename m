From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 18:12:01 +0100
Message-ID: <20160215171201.GK12289@pengutronix.de>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de>
 <56C1CE95.6020206@arm.com>
 <20160215144344.GF10826@n2100.arm.linux.org.uk>
 <20160215162753.GI12289@pengutronix.de>
 <20160215164937.GC25556@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34023 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751452AbcBORMH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 12:12:07 -0500
Content-Disposition: inline
In-Reply-To: <20160215164937.GC25556@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Greg,

On Mon, Feb 15, 2016 at 08:49:37AM -0800, Greg Kroah-Hartman wrote:
> On Mon, Feb 15, 2016 at 05:27:53PM +0100, Uwe Kleine-K=F6nig wrote:
> > Greg, can you drop this patch, or do you need a proper changelog fo=
r a
> > revert? On top of that I'd then create a new patch which is more
> > conservative.
>=20
> A hint as to what the git commit id was would be helpful, I can just
> revert it based on that.

This is 67d02a1bbb33 ("driver-core: platform: probe of-devices only
using list of compatibles")

If you need a log, something like:

	Reallow binding of of-devices by name

	It turned out that there are valid reasons (e.g. step by step
	conversion to device tree probing using auxdata) to bind
	of-instantiated devices to drivers by name. So revert to the
	original logic.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
