From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 08:25:56 -0700
Message-ID: <20080701152556.GA3973@kroah.com>
References: <20080701215713.8796c966.sfr@canb.auug.org.au> <d1df296985842ab0a986b05dd20ff3b7@felipebalbi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:43715 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757507AbYGAPbG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 11:31:06 -0400
Content-Disposition: inline
In-Reply-To: <d1df296985842ab0a986b05dd20ff3b7@felipebalbi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <me@felipebalbi.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

On Tue, Jul 01, 2008 at 06:59:00AM -0500, Felipe Balbi wrote:
> 
> 
> On Tue, 1 Jul 2008 21:57:13 +1000, Stephen Rothwell <sfr@canb.auug.org.au>
> wrote:
> > Hi Alan,
> > 
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/usb/serial/ir-usb.c between commit
> > 3128101cf92692e300fdb8bf66a9e8f286cbaa7f ("usb: irda: cleanup on ir-usb
> > module") from the usb tree and commits
> > ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") and
> > ad58854921eeeab97a09600260ea03fa097394e4 ("48-tty-tidy-usb-ir-usb") from
> > the ttydev tree.
> > 
> > I didn't even know where to start :-(, so I used the version from the
> > ttydev tree (since the other is just a cleanup).
> 
> Greg, should i refresh the patch and resend ?

No, your patch is fine, the tty tree should be able to handle this.

thanks,

greg k-h
