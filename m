From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ttydev tree with the
	usb.current tree
Date: Mon, 27 Apr 2009 21:58:28 -0700
Message-ID: <20090428045828.GB11810@kroah.com>
References: <20090422133821.804bf9d6.sfr@canb.auug.org.au> <Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org> <20090422173009.4b6e684e@lxorguk.ukuu.org.uk> <20090422163857.GA19484@kroah.com> <20090428144256.f7870238.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54805 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752072AbZD1FEE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 01:04:04 -0400
Content-Disposition: inline
In-Reply-To: <20090428144256.f7870238.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Alan Stern <stern@rowland.harvard.edu>, linux-next@vger.kernel.org

On Tue, Apr 28, 2009 at 02:42:56PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Wed, 22 Apr 2009 09:38:57 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Wed, Apr 22, 2009 at 05:30:09PM +0100, Alan Cox wrote:
> > > > I'll be happy to help, although no doubt Alan Cox is quite capable of 
> > > > resolving the conflicts on his own.
> > > 
> > > Greg - can you send me the diff you applied in the end, then we can move
> > > the patch from the USB tree into the tty tree otherwise its not going to
> > > be possible to keep the two trees based on Linus base otherwise. Better
> > > yet forcefeed it to Linus instead as its quite a icky bug and wants fixing
> > > ASAP IMHO.
> > 
> > Ok, I'll send it to Linus today, and we can handle the merge after that.
> 
> Any ETA?

It's all in Linus's tree, and has been for a few days now.  Are you
still getting merge errors?

thanks,

greg k-h
