From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 16:12:28 +0000
Message-ID: <20160215161228.GH10826@n2100.arm.linux.org.uk>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de>
 <56C1F19F.8090100@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:53424 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbcBOQMi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 11:12:38 -0500
Content-Disposition: inline
In-Reply-To: <56C1F19F.8090100@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Feb 15, 2016 at 07:41:19AM -0800, Guenter Roeck wrote:
> On 02/15/2016 02:59 AM, Uwe Kleine-K=F6nig wrote:
> >Hello Guenter,
> >
> >On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
> >>Uwe,
> >>
> >>Your patch 'driver-core: platform: probe of-devices only using list=
 of
> >>compatibles' causes the following qemu tests to crash in -next.
> >>
> >>arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
> >>arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
> >>arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
> >>arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
> >>
> >>Crash log:
> >>
> >>VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error=
 -6
> >>Please append a correct "root=3D" boot option; here are the availab=
le partitions:
> >>1f00          131072 mtdblock0  (driver?)
> >>1f01           32768 mtdblock1  (driver?)
> >>Kernel panic - not syncing: VFS: Unable to mount root fs on unknown=
-block(0,0)
> >
> >Can you provide a complete boot log? This might already reveal which
> >device is failing. It might not be the mmci device but something it
> >depends on (clock, bus parent, irq).
> >
>=20
> Sure, something else may be failing, but why does reverting your patc=
h
> fix the problem ?
>=20
> Anyway, complete logs are at http://kerneltests.org/builders.
>=20
> http://kerneltests.org/builders/qemu-arm-next/builds/376/steps/qemubu=
ildcommand/logs/stdio
>=20
> is the most recent log (next-20120215). Look for the vexpress crashes=
; the overo
> crash bisected to to 'PM / OPP: Disable OPPs that aren't supported by=
 the regulator',
> in next-20160212, which I have not fully analyzed yet, and the beagle=
 crashes
> as well as the 'new' overo crash are brand new.

Looking at the vexpress-ca9 one, nothing stands out to me apart from th=
e
lack of messages about a MMC driver.  I don't see anything there which
indicates why that would be.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
