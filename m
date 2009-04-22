From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ttydev tree with the
	usb.current tree
Date: Wed, 22 Apr 2009 09:38:57 -0700
Message-ID: <20090422163857.GA19484@kroah.com>
References: <20090422133821.804bf9d6.sfr@canb.auug.org.au> <Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org> <20090422173009.4b6e684e@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:35169 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753393AbZDVRlM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 13:41:12 -0400
Content-Disposition: inline
In-Reply-To: <20090422173009.4b6e684e@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Alan Stern <stern@rowland.harvard.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, Apr 22, 2009 at 05:30:09PM +0100, Alan Cox wrote:
> > I'll be happy to help, although no doubt Alan Cox is quite capable of 
> > resolving the conflicts on his own.
> 
> Greg - can you send me the diff you applied in the end, then we can move
> the patch from the USB tree into the tty tree otherwise its not going to
> be possible to keep the two trees based on Linus base otherwise. Better
> yet forcefeed it to Linus instead as its quite a icky bug and wants fixing
> ASAP IMHO.

Ok, I'll send it to Linus today, and we can handle the merge after that.

thanks,

greg k-h
