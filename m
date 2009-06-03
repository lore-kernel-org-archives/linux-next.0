From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the ttydev tree
Date: Wed, 3 Jun 2009 08:00:17 -0700
Message-ID: <20090603150017.GD30890@kroah.com>
References: <20090603180734.f175e04f.sfr@canb.auug.org.au> <20090603095547.1641ca7b@lxorguk.ukuu.org.uk> <20090603204655.3f431574.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:39113 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754900AbZFCP1M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2009 11:27:12 -0400
Content-Disposition: inline
In-Reply-To: <20090603204655.3f431574.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Craig Shelley <craig@microtron.org.uk>

On Wed, Jun 03, 2009 at 08:46:55PM +1000, Stephen Rothwell wrote:
> Hi Alan,
> 
> On Wed, 3 Jun 2009 09:55:47 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> >
> > > As a side issue, the last patch has no SOB from Craig in the ttydev tree.
> > 
> > Yes it does...
> > 
> >     Signed-off-by: Craig Shelley <craig@microtron.org.uk>
> >     
> >     (Fixed some collisions merging)
> >     
> >     Signed-off-by: Alan Cox <alan@linux.intel.com>
> 
> Sorry, going blind in my old age :-)
> 
> > > So, I just used the ttydev tree version on the assumption that my
> > > reasoning above is correct.
> > 
> > and the ttydev tree one is the one to use
> 
> Thanks for the confirmation.

Ok, I'll drop these three patches from my tree.

thanks,

greg k-h
