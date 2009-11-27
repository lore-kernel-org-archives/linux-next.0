From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: workqueues tree build failure
Date: Fri, 27 Nov 2009 11:38:08 +0000
Message-ID: <20091127113808.GC29821@rakim.wolfsonmicro.main>
References: <20091126190050.3f9d7fef.sfr@canb.auug.org.au>
 <s5h3a40pdm7.wl%tiwai@suse.de>
 <4B0F90F3.2010204@kernel.org>
 <200911271209.18979.peter.ujfalusi@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60035 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753482AbZK0LiD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 06:38:03 -0500
Content-Disposition: inline
In-Reply-To: <200911271209.18979.peter.ujfalusi@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Cc: ext Tejun Heo <tj@kernel.org>, Takashi Iwai <tiwai@suse.de>, Andy Walls <awalls@radix.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 27, 2009 at 12:09:18PM +0200, Peter Ujfalusi wrote:

> For the record: on OMAP platforms the I2C implementation is sleeping during the 
> transfer (internally using interrupt based transfer), which might be not that 
> wise in the tasklet. Since the I2C bus is kind of a slow bus, this could take 
> several ms in some cases.

There's also the possibility of contention with other users of the I2C
bus which doesn't help matters here.
