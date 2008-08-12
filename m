From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 12 Aug 2008 13:42:12 -0700
Message-ID: <20080812204212.GB2594@kroah.com>
References: <20080812165830.86c08de0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:58228 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbYHLUpD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2008 16:45:03 -0400
Content-Disposition: inline
In-Reply-To: <20080812165830.86c08de0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>

On Tue, Aug 12, 2008 at 04:58:30PM +1000, Stephen Rothwell wrote:
> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/class/cdc-acm.c between commit
> 9e02103a5b182c5c99aaa8efa1def46bd215c707 ("usb: cdc-acm: stop dropping tx
> buffers") from the usb.current tree and commit
> 1b873c25c7cb1571784626ce044b63a28909e288 ("tty-fix-cdc-acm") from the
> ttydev tree.
> 
> The former removed a line that the latter modified.  I just removed the
> line.

Sounds correct to me, thanks for doing that.

greg k-h
