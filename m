From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Thu, 26 Nov 2009 12:56:59 +0000
Message-ID: <20091126125659.GD1037@rakim.wolfsonmicro.main>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>
 <4B0E3677.6000603@kernel.org>
 <200911261016.58810.peter.ujfalusi@nokia.com>
 <4B0E467A.8080201@kernel.org>
 <1259239225.3062.16.camel@palomino.walls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56759 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757287AbZKZM4z (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 07:56:55 -0500
Content-Disposition: inline
In-Reply-To: <1259239225.3062.16.camel@palomino.walls.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Walls <awalls@radix.net>
Cc: Tejun Heo <tj@kernel.org>, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>

On Thu, Nov 26, 2009 at 07:40:25AM -0500, Andy Walls wrote:

> I'm not sure doing things like I2C transactions in the in the top half
> of the IRQ handler is generally viable.  On shared IRQ lines, wouldn't
> this hold off the interrupt for another device for too long?

You're going to need to do I2C I/O to acknowledge and deassert the
interrupt on most of these devices so if someone's shared the IRQ line
with something that's too latency sensitive the hardware is broken
anyway.

> Workhandlers for deferring work are a nice way to avoid such bad system
> level interactions.

In order to cope with the fact that the IRQ can't be deasserted without
talking to the device it will almost always be masked while waiting for
the deferred work.
