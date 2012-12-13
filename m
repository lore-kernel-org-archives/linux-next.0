From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Thu, 13 Dec 2012 15:38:35 -0800
Message-ID: <20121213233835.GA515@kroah.com>
References: <20121127004948.6e7973525843529de827ed0e@canb.auug.org.au>
 <1353940512.22512.38.camel@fedora>
 <20121127100530.20174586b57ef55da58608d4@canb.auug.org.au>
 <20121214103256.ce307015fd09961ad82346f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47176 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754757Ab2LMXii (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Dec 2012 18:38:38 -0500
Content-Disposition: inline
In-Reply-To: <20121214103256.ce307015fd09961ad82346f9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <srostedt@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 14, 2012 at 10:32:56AM +1100, Stephen Rothwell wrote:
> Hi Steve, Greg,
> 
> On Tue, 27 Nov 2012 10:05:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Mon, 26 Nov 2012 09:35:12 -0500 Steven Rostedt <srostedt@redhat.com> wrote:
> > >
> > > On Tue, 2012-11-27 at 00:49 +1100, Stephen Rothwell wrote:
> > > > 
> > > > After merging the final tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > > 
> > > > In file included from drivers/staging/sb105x/sb_pci_mp.c:1:0:
> > > > drivers/staging/sb105x/sb_pci_mp.h:22:25: fatal error: asm/segment.h: No such file or directory
> > > 
> > > I haven't tested this with any other arch than x86. That said, what
> > > about this instead:
> > > 
> > > > Caused by commit 68a81291ff66 ("staging: Add SystemBase Multi-2/PCI
> > > > driver").
> > > > 
> > > > I have disabled this driver with this patch:
> > > > 
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Tue, 27 Nov 2012 00:45:07 +1100
> > > > Subject: [PATCH] disable the SB105X driver
> > > > 
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  drivers/staging/sb105x/Kconfig |    1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/staging/sb105x/Kconfig b/drivers/staging/sb105x/Kconfig
> > > > index ac87c5e..c957e32 100644
> > > > --- a/drivers/staging/sb105x/Kconfig
> > > > +++ b/drivers/staging/sb105x/Kconfig
> > > > @@ -2,6 +2,7 @@ config SB105X
> > > >  	tristate "SystemBase PCI Multiport UART"
> > > >  	select SERIAL_CORE
> > > >  	depends on PCI
> > > > +	depends on BROKEN
> > > 
> > > 	depends on X86
> > > 
> > > You can add my SOB if you want. I don't care either way.
> > 
> > Please just send a (tested) patch to Greg.
> 
> This now breaks Linus' tree .....

Ugh, can someone send me a patch to forward to Linus to fix this please?
Steven, how about fixing the problem properly?

thanks,

greg k-h
