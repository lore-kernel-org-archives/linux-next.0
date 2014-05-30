From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: nommu build failures on ARM in linux-next
Date: Fri, 30 May 2014 09:58:30 +0200
Message-ID: <20140530075830.GO22169@pengutronix.de>
References: <5387661F.1050000@windriver.com>
 <20140529185534.GK3693@n2100.arm.linux.org.uk>
 <20140529234012.GL3693@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39576 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbaE3H6j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2014 03:58:39 -0400
Content-Disposition: inline
In-Reply-To: <20140529234012.GL3693@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, May 30, 2014 at 12:40:12AM +0100, Russell King - ARM Linux wrote:
> Even so, I suspect even with this build problem solved, that's not going
> to be the end of the story for noMMU breakage... it's certainly something
> that gets very little testing by anyone.  I suspect it should be removed
> from the mainline kernel tree rather than being a constant source of these
> kinds of problems.

Uwe can have a look next week.

Taken that it took *ages* to get Cortex-M3 support in mainline and taken
that it might become more interesting with the upcoming generation of
FPGAs and Cortex-A SoCs with an additional Cortex-M, it would be pretty
bad to lose NOMMU again.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
