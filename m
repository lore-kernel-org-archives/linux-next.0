From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm tree build failure
Date: Tue, 19 Aug 2008 17:06:56 +0100
Message-ID: <20080819160656.GA20537@flint.arm.linux.org.uk>
References: <20080819155319.23e0e8b4.sfr@canb.auug.org.au> <200808191316.21469.marek.vasut@gmail.com> <s5hljytw8qf.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:42959 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbYHSQHX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 12:07:23 -0400
Content-Disposition: inline
In-Reply-To: <s5hljytw8qf.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Aug 19, 2008 at 01:21:44PM +0200, Takashi Iwai wrote:
> I also got a build error with ucb1400 regarding undefined
> gpio_get_value() (sorry I lost the exact build log).
> 
> The patch below fixes it, but not 100% sure whether it breaks the
> build on ARM.  Please check it.

There's nothing in ucb1400.h that would require gpio.h, nor in
ucb1400_*.c, so I think it's safe to remove.  Mind if I merge your
patch into Marek's original to avoid bisect problems?

Ditto for Stephen's patch?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
