From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm tree build failure
Date: Thu, 18 Sep 2008 23:04:57 +0100
Message-ID: <20080918220457.GC17688@flint.arm.linux.org.uk>
References: <20080919040901.4a55f305.sfr@canb.auug.org.au> <f17812d70809181126x374b3056ib1fa7aad5475b89@mail.gmail.com> <f17812d70809181133ha833a5ewbdcea402dccfea92@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40100 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754472AbYIRWFV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Sep 2008 18:05:21 -0400
Content-Disposition: inline
In-Reply-To: <f17812d70809181133ha833a5ewbdcea402dccfea92@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Sep 19, 2008 at 02:33:02AM +0800, Eric Miao wrote:
> On Fri, Sep 19, 2008 at 2:26 AM, Eric Miao <eric.y.miao@gmail.com> wrote:
> >> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> >> index 8854dbb..361240a 100644
> >> --- a/drivers/video/backlight/Kconfig
> >> +++ b/drivers/video/backlight/Kconfig
> >> @@ -27,6 +27,7 @@ config LCD_CLASS_DEVICE
> >>  config LCD_CORGI
> >>        tristate "LCD Panel support for SHARP corgi/spitz model"
> >>        depends on LCD_CLASS_DEVICE && SPI_MASTER
> >> +       depends on ARM
> >
> > I think a "depends on PXA_SHARPSL" would be more precise here.
> >
> >>        default n
> >>        help
> >>          Say y here to support the LCD panels usually found on SHARP
> >
> 
> Russell,
> 
> Since the patch titled:
> 
> "lcd: add SPI-based LCD and backlight driver for SHARP corgi/spitz"
> 
> is merged in your tree, and I don't know if it hits the mainline or not
> (most likely not), I'd suggest to merge this into that one with Stephen's
> Signed-off-by. Would you please do that at your convenience, or let
> me know if you would like me to.

I've added your suggested change instead (PXA_SHARPSL makes much more
sense) so it doesn't require any additional sign-offs.  Will push it
out in about half an hour.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
