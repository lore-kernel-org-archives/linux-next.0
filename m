From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the ttydev tree
Date: Fri, 5 Jun 2009 10:42:03 -0700
Message-ID: <20090605174203.GD6479@kroah.com>
References: <20090605153445.291acd58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:48688 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752438AbZFERqd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 13:46:33 -0400
Content-Disposition: inline
In-Reply-To: <20090605153445.291acd58.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Craig Shelley <craig@microtron.org.uk>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Fri, Jun 05, 2009 at 03:34:45PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/cp210x.c between commit
> 7219905ae9bb14e9c8f7a7ab434b70363b904a7c ("cp210x-func-renames") from the
> ttydev tree and commit 8a5870836006ec7dd112082a39e0057b49e5bd91 ("USB:
> usb-serial: replace shutdown with disconnect, release") from the usb tree.
> 
> I love churn!  :-)

Heh, so do I :)

> I fixed this up (see below) and can carry the fix as necessary.

Looks good to me, thanks for doing this.

greg k-h
