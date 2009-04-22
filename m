From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Wed, 22 Apr 2009 11:50:29 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org>
References: <20090422133821.804bf9d6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:41644 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756485AbZDVPub (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 11:50:31 -0400
In-Reply-To: <20090422133821.804bf9d6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Wed, 22 Apr 2009, Stephen Rothwell wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/usb-serial.c between commit
> 098aa19445c918bb8430f9b5cb840b546de570f2 ("USB: serial: fix lifetime and
> locking problems") from the usb.current tree and commit
> 1156df675ae541b21dc343912413f201f87a3909 ("tty-usb-use-port") from the
> ttydev tree.
> 
> OK, I can't figure this out easily, so I have used the ttydev version of
> the file - effectively reverting the usb.current change.
> 
> Alan (Cox), when the usb.current change goes into Linus' tree (it is
> destined for 2.6.30), you will have to fix the conflict.  You could do
> this now by adding that patch to your series and fixing the mess ... Alan
> (Stern) you may want to help with this.  I can cope with having the same
> patch on both sides of the merge (I won't even complain :-)).

I'll be happy to help, although no doubt Alan Cox is quite capable of 
resolving the conflicts on his own.

Alan Stern
