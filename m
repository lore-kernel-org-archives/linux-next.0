From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix build error of driver/mfd/tc6393xb.c
Date: Sat, 5 Jul 2008 10:13:09 -0700
Message-ID: <200807051013.10078.david-b@pacbell.net>
References: <s5hiqvlc2ut.wl%tiwai@suse.de> <200807040954.34838.david-b@pacbell.net> <20080705083122.GA7026@doriath.ww600.siemens.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97]:30594 "HELO
	smtp124.sbc.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752118AbYGERNM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 5 Jul 2008 13:13:12 -0400
In-Reply-To: <20080705083122.GA7026@doriath.ww600.siemens.net>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Saturday 05 July 2008, Dmitry Baryshkov wrote:
> 
> > > I'm not sure whether it's a better fix at this moment.
> > 
> > Which platform is it which is trying to declare that it has
> > an implementation (HAVE_GPIO_LIB) of an interface that it
> > doesn't support (GENERIC_GPIO unset) ??
> 
> the powerpc with PPC_MPC52xx=y, PPC_MPC5200_GPIO=y

The most natural fix is to have the Kconfig for PPC_MPC52xx
select both GENERIC_GPIO and HAVE_GPIO_LIB.

- Dave
