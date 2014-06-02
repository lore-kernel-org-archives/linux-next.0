From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: nommu build failures on ARM in linux-next
Date: Mon, 2 Jun 2014 09:19:05 +0200
Message-ID: <20140602071905.GD11207@pengutronix.de>
References: <5387661F.1050000@windriver.com>
 <20140529185534.GK3693@n2100.arm.linux.org.uk>
 <20140529234012.GL3693@n2100.arm.linux.org.uk>
 <20140530080257.GW20155@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:47599 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751442AbaFBHTU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2014 03:19:20 -0400
Content-Disposition: inline
In-Reply-To: <20140530080257.GW20155@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jonathan Austin <Jonathan.Austin@arm.com>, Kevin Hilman <khilman@deeprootsystems.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, kernel@pengutronix.de, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello,

On Fri, May 30, 2014 at 10:02:57AM +0200, Uwe Kleine-K=F6nig wrote:
> > Even so, I suspect even with this build problem solved, that's not =
going
> > to be the end of the story for noMMU breakage... it's certainly som=
ething
> > that gets very little testing by anyone.  I suspect it should be re=
moved
> > from the mainline kernel tree rather than being a constant source o=
f these
> > kinds of problems.
> That would mean that support for Cortex-M3 would die, too, which woul=
d
> (IMHO) be sad.
Just for your information: The problem in question here doesn't affect
ARM-v7M (aka Cortex-M[34]) because the patch only touches areas
protected by #ifdef CONFIG_CPU_CP15 which is off for these machines.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
