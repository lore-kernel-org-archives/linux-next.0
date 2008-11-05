From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: patch excluded from usb tree
Date: Tue, 4 Nov 2008 20:47:15 -0800
Message-ID: <20081105044715.GA3668@kroah.com>
References: <20081103114011.0bddceaa.sfr@canb.auug.org.au> <20081105130329.83967496.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38614 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754243AbYKEEtq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Nov 2008 23:49:46 -0500
Content-Disposition: inline
In-Reply-To: <20081105130329.83967496.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Nov 05, 2008 at 01:03:29PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 3 Nov 2008 11:40:11 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I have excluded the patch "USB: driver for gotemp device" from the
> > linux-next tree.  Its commit message starts like this:
> > 
> > NOT FOR MAINLINE!
> > 
> > Which, I think, cannot be interpreted as "intended for the next merge
> > window".  :-)
> > 
> > Could you please move it out of the NEXT section of your series.
> 
> Please?  :-) I have excluded the same three patches.

Ick, sorry, I missed this.

I'll move them out of my tree right now.

thanks,

greg k-h
