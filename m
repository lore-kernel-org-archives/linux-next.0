From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the  ttydevtree
Date: Wed, 29 Apr 2009 10:52:49 -0700
Message-ID: <20090429175249.GB29144@kroah.com>
References: <20090429162228.752887ac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:46404 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752254AbZD2R6W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 13:58:22 -0400
Content-Disposition: inline
In-Reply-To: <20090429162228.752887ac.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Elina Pasheva <epasheva@sierrawireless.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On Wed, Apr 29, 2009 at 04:22:28PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/sierra.c between commit
> e675a5b8305a4d244273c34698ba411ddcc0f42a ("tty-usb-use-port") from the
> ttydev tree and commit 7b8163621c22ea34636314da663b9cdea50342be ("USB:
> serial: sierra driver debug info visibility improvement") from the usb
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good to me, thanks.

Alan, are your changes going to be for .30, or are they pending for .31?

thanks,

greg k-h
