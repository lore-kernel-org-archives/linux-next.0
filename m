From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: acpi tree build failure
Date: Fri, 6 Feb 2009 21:32:47 -0800
Message-ID: <20090207053247.GA14918@kroah.com>
References: <20090202132254.456b7725.sfr@canb.auug.org.au> <20090205131340.edc6e6a8.sfr@canb.auug.org.au> <20090205050056.GA7651@kroah.com> <alpine.LFD.2.00.0902062303090.26256@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58139 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754002AbZBGFit (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 7 Feb 2009 00:38:49 -0500
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0902062303090.26256@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Kay Sievers <kay.sievers@vrfy.org>

On Fri, Feb 06, 2009 at 11:06:28PM -0500, Len Brown wrote:
> 
> On Wed, 4 Feb 2009, Greg KH wrote:
> 
> > On Thu, Feb 05, 2009 at 01:13:40PM +1100, Stephen Rothwell wrote:
> > > Greg, Len,
> > > 
> > > On Mon, 2 Feb 2009 13:22:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > drivers/platform/x86/oqo-wmi.c: In function 'oqo_kine_init':
> > > > drivers/platform/x86/oqo-wmi.c:595: error: 'struct device' has no member named 'bus_id'
> > > > 
> > > > Caused by commit 03919980ad590ad5c5c181d1bd7d58513ad170bc ("platform/x86:
> > > > Add oqo-wmi driver for model 2 OQO backlight and rfkill control")
> > > > interacting with commit c44c8304353aa6da82cbf98040c6a9c254e68e1c ("driver
> > > > core: get rid of struct device's bus_id string array") from the
> > > > driver-core tree.
> > > 
> > > Still getting this (of course).  Can you guys come up with a fix, please?
> > 
> > Len, you have the patch from Kay, what do you want to do with it?
> 
> I don't recall a patch from Kay specifically for OQO.
> OQO is sitting in my tree to get exposure while it waits for
> a few updates from Matthew.

Ah, sorry, I was confused with the other acpi bus_id patch.

> I think it can be restored with this 1 liner, which I can apply to it.

Yes, your patch looks fine.

thanks,

greg k-h
