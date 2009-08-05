From: Greg KH <greg@kroah.com>
Subject: Re: tty tree change for linux-next
Date: Wed, 5 Aug 2009 10:08:00 -0700
Message-ID: <20090805170800.GA4909@kroah.com>
References: <20090801043905.GA12779@kroah.com>
 <20090801164104.5e9b2f17.sfr@canb.auug.org.au>
 <20090801172245.1d3e8b31.sfr@canb.auug.org.au>
 <20090801171815.GA15259@kroah.com>
 <20090802091605.eeebc7fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:45782 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934483AbZHERJM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2009 13:09:12 -0400
Content-Disposition: inline
In-Reply-To: <20090802091605.eeebc7fa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Aug 02, 2009 at 09:16:05AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Sat, 1 Aug 2009 10:18:15 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > Ok, that's not good at all, I just took the patches straight from Alan.
> > I'll edit them up this weekend to work better (i.e. in the format that
> > all of my other patches are in, pseudo-mbox headers, which both quilt
> > and git seem to like.)
> 
> Thanks.

This should now be all fixed up.  If you happen to notice any I missed,
please let me know.

thanks,

greg k-h
