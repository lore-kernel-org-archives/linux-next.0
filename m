From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Wed, 22 Apr 2009 17:30:09 +0100
Message-ID: <20090422173009.4b6e684e@lxorguk.ukuu.org.uk>
References: <20090422133821.804bf9d6.sfr@canb.auug.org.au>
	<Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:35558 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752011AbZDVQ31 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 12:29:27 -0400
In-Reply-To: <Pine.LNX.4.44L0.0904221142020.3405-100000@iolanthe.rowland.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

> I'll be happy to help, although no doubt Alan Cox is quite capable of 
> resolving the conflicts on his own.

Greg - can you send me the diff you applied in the end, then we can move
the patch from the USB tree into the tty tree otherwise its not going to
be possible to keep the two trees based on Linus base otherwise. Better
yet forcefeed it to Linus instead as its quite a icky bug and wants fixing
ASAP IMHO.

Alan
