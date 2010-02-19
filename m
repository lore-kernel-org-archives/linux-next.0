From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: import of usb series failed
Date: Fri, 19 Feb 2010 07:53:43 -0800
Message-ID: <20100219155343.GA3946@kroah.com>
References: <20100218105500.898ece5e.sfr@canb.auug.org.au>
 <20100218002144.GA17850@kroah.com>
 <20100218132221.b15d151f.sfr@canb.auug.org.au>
 <20100219175218.10025a7a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:48586 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752881Ab0BSPxs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Feb 2010 10:53:48 -0500
Content-Disposition: inline
In-Reply-To: <20100219175218.10025a7a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Feb 19, 2010 at 05:52:18PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 18 Feb 2010 13:22:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 17 Feb 2010 16:21:44 -0800 Greg KH <greg@kroah.com> wrote:
> > >
> > > Very wierd, you must have gotten this just as I updated my tree.  It
> > 
> > Yeah, that is possible.
> > 
> > > should all be fine tomorrow, if not, please let me know.
> > 
> > Great, thanks.
> 
> I got the same today.  Is this a case of Git being a bit more picky about
> applying patches that quilt?

Very wierd.  I just ran 'git quiltimport' on my whole tree onto Linus's
latest git tree and it worked just fine.

What is the command you are using here to do this?  Perhaps there is
some other tree modifying this file causing a problem?

odd,

greg k-h
