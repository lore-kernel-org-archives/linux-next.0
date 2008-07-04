From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Fri, 4 Jul 2008 09:50:17 -0700
Message-ID: <200807040950.17877.david-b@pacbell.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <20080704124256.GB21747@doriath.ww600.siemens.net> <s5hk5g1ls9l.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97]:32368 "HELO
	smtp124.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1759417AbYGDQuU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 12:50:20 -0400
In-Reply-To: <s5hk5g1ls9l.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Friday 04 July 2008, Takashi Iwai wrote:
> 
> > The proper fix probably is to make PPC_MPC5200_GPIO also select
> > GENERIC_GPIO.

I think it's higher in the dependency tree than that.


> > I don't think that building GPIO_LIB w/o GENERIC_GPIO 
> > should be supported.
> 
> [Added David to Cc]
> 
> Then HAVE_GPIO_LIB should depend on GENERIC_GPIO.

They must go together ... right.  Anything using gpiolib
without the interface it implements needs a head-exam. ;)

But since ISTR that Kconfig (still) doesn't get dependencies
right when you "select" something that depends on something
else, that particular solution won't fly.


> Or, linux/gpio.h should be fixed so that the code can be built
> properly without GENERIC_GPIO.

No; GENERIC_GPIO is the interface, HAVE_GPIO_LIB is one
of the valid ways to implement it.

It should work if HAVE_GPIO_LIB selected GENERIC_GPIO...

- Dave
