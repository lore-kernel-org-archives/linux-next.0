From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb.current tree build failure
Date: Wed, 6 Aug 2008 21:24:14 -0700
Message-ID: <20080807042414.GC25803@kroah.com>
References: <20080801112021.547dfaea.sfr@canb.auug.org.au> <20080801061250.GB8634@kroah.com> <20080807105600.76386f62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48043 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbYHGEpj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Aug 2008 00:45:39 -0400
Content-Disposition: inline
In-Reply-To: <20080807105600.76386f62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

On Thu, Aug 07, 2008 at 10:56:00AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 31 Jul 2008 23:12:50 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Aug 01, 2008 at 11:20:21AM +1000, Stephen Rothwell wrote:
> > > 
> > > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > > 
> > > drivers/built-in.o: In function `.usb_reset_device':
> > > (.text+0x1bfeb4): undefined reference to `.usb_forced_unbind_intf'
> > > drivers/built-in.o: In function `.usb_reset_device':
> > > (.text+0x1c03b8): undefined reference to `.usb_rebind_intf'
> > > 
> > > Caused by commit 78d9a487ee961c356e1a934d9a92eca38ffb3a70 ("USB: Force
> > > unbinding of drivers lacking reset_resume or other methods").
> > > 
> > > The above config has CONFIG_USB=y and CONFIG_PM not set.
> > > 
> > > I applied the following (probably incorrect) patch.
> > 
> > Thanks, this is my fault, I applied the wrong patch from Alan (he sent
> > me a later more correct version.)  Should be fixed in the tree for
> > tomorrow.
> 
> This is still no fixed ...

Yeah, trying to figure it out...

greg k-h
