From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Sun, 14 Feb 2016 20:07:55 +0000
Message-ID: <20160214200755.GB10826@n2100.arm.linux.org.uk>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:51486 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbcBNUIO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2016 15:08:14 -0500
Content-Disposition: inline
In-Reply-To: <20160214195501.GA12289@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, Feb 14, 2016 at 08:55:01PM +0100, Uwe Kleine-K=F6nig wrote:
> So the unexpected abnormality here is that even though this device is
> instantiated by dt, the driver doesn't provide any compatibles.
> Either my expectation is wrong, then 67d02a1bbb33455 should be revert=
ed

Your expectation is wrong.  AMBA primecell devices have hardware IDs
and are matched to their drivers by those IDs.  Just like PCI.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
