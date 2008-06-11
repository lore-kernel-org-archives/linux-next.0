From: Greg KH <greg@kroah.com>
Subject: Re: Template of what you're after? (Was [ANNOUNCE] linux-staging
	tree created)
Date: Wed, 11 Jun 2008 09:23:03 -0700
Message-ID: <20080611162303.GA22134@kroah.com>
References: <20080610190540.GA25066@kroah.com> <1213146346.16146.17.camel@nigel-laptop> <20080611032948.GB4483@kroah.com> <1213157025.16146.40.camel@nigel-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57455 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137AbYFKQ1q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 12:27:46 -0400
Content-Disposition: inline
In-Reply-To: <1213157025.16146.40.camel@nigel-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nigel Cunningham <nigel@tuxonice.net>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 02:03:45PM +1000, Nigel Cunningham wrote:
> Hi again.
> 
> On Tue, 2008-06-10 at 20:29 -0700, Greg KH wrote:
> > Is the patch "stand-alone", only adding new code in discrete chunks like
> > a new driver or filesystem would?
> 
> Just another thought - I should have said that I don't really know what
> patches to add a new driver or filesystem look like. I can only imagine
> a filesystem going in all-in-one-patch, so I'd probably appreciate an
> example/template to work off, as might others.

If you look in the -staging tree, there are 17 "template/example"
patches in there to go off of :)

Basically, one patch per feature.  It sounds like the tuxonice is much
too big for this kind of thing.

Just respin your patches and post them to lkml for review.  You should
be able to set up your own tree for inclusion in linux-next if they are
ready to go in.

thanks,

greg k-h
