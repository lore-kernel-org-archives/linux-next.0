From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 09:17:50 +0100
Message-ID: <20160215081750.GD12289@pengutronix.de>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
 <20160214200755.GB10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:54942 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752058AbcBOISP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 03:18:15 -0500
Content-Disposition: inline
In-Reply-To: <20160214200755.GB10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Hello Russell,

On Sun, Feb 14, 2016 at 08:07:55PM +0000, Russell King - ARM Linux wrot=
e:
> On Sun, Feb 14, 2016 at 08:55:01PM +0100, Uwe Kleine-K=F6nig wrote:
> > So the unexpected abnormality here is that even though this device =
is
> > instantiated by dt, the driver doesn't provide any compatibles.
> > Either my expectation is wrong, then 67d02a1bbb33455 should be reve=
rted
>=20
> Your expectation is wrong.  AMBA primecell devices have hardware IDs
> and are matched to their drivers by those IDs.  Just like PCI.

pci devices don't appear in dt, do they? I don't see the connection
between amba devices and platform devices, see my other mail in this
thread for some more details.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
