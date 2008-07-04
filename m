From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Fri, 4 Jul 2008 16:42:56 +0400
Message-ID: <20080704124256.GB21747@doriath.ww600.siemens.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <20080704114755.GA21747@doriath.ww600.siemens.net> <s5hej69c0tt.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:17951 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756844AbYGDMnU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jul 2008 08:43:20 -0400
Received: by yw-out-2324.google.com with SMTP id 9so522610ywe.1
        for <linux-next@vger.kernel.org>; Fri, 04 Jul 2008 05:43:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <s5hej69c0tt.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 04, 2008 at 02:04:30PM +0200, Takashi Iwai wrote:
> At Fri, 4 Jul 2008 15:47:55 +0400,
> Dmitry Baryshkov wrote:
> > 
> > On Fri, Jul 04, 2008 at 01:20:42PM +0200, Takashi Iwai wrote:
> > > Fix the build of tc6393xb  due to missing definition of struct
> > > gpio_chip.
> > > 
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > 
> > > ---
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 9f93c29..2981da4 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -44,7 +44,7 @@ config HTC_PASIC3
> > >  
> > >  config MFD_TC6393XB
> > >  	bool "Support Toshiba TC6393XB"
> > > -	depends on HAVE_GPIO_LIB
> > > +	depends on HAVE_GPIO_LIB && GENERIC_GPIO
> > >  	select MFD_CORE
> > >  	help
> > >  	  Support for Toshiba Mobile IO Controller TC6393XB
> > 
> > Which configuration does provide HAVE_GPIO_LIB but not GENERIC_GPIO?
> 
> The below is the config with which I got the error.

The proper fix probably is to make PPC_MPC5200_GPIO also select
GENERIC_GPIO. I don't think that building GPIO_LIB w/o GENERIC_GPIO
should be supported.

-- 
With best wishes
Dmitry
