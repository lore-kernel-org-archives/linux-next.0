From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: rr tree build failure
Date: Fri, 21 Nov 2008 10:34:03 -0800
Message-ID: <20081121183403.GC16353@suse.de>
References: <20081121141913.90d05091.sfr@canb.auug.org.au> <200811212128.52317.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:35925 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752695AbYKUTrI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Nov 2008 14:47:08 -0500
Content-Disposition: inline
In-Reply-To: <200811212128.52317.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>

On Fri, Nov 21, 2008 at 09:28:51PM +1030, Rusty Russell wrote:
> On Friday 21 November 2008 13:49:13 Stephen Rothwell wrote:
> > Hi Rusty,
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> >
> > drivers/usb/core/usb.c:958:76: error: macro "__module_param_call" requires
> > 7 arguments, but only 6 given
> >
> > Caused by commit 636c06e04b23e9dabf709c496cb9a28459f63eaa
> > ("param:core_param-really-really-early").
> >
> > I have dropped the rr tree again.
> 
> Yes, I didn't get a reply from Greg about whether he really needs "nousb" to
> be a module param, so I dropped my proposed USB fix.  I've restored it now.
> 
> Greg, here's the complete patch I have now:
> 
> Subject: USB: Use core_param.
> 
> Found this when I changed args to __module_param_call.  We now have
> core_param for exactly this.
> 
> This reverts to the 2005 (pre- aafbf24a) behaviour where "nousb" was
> not a module parameter, just a kernel command line parameter.  That's
> more sensible anyway.

No, please stick with the post 2005 behavior :)

thanks,

greg k-h
