From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 19 Aug 2008 12:57:08 -0700
Message-ID: <20080819195708.GB10502@kroah.com>
References: <20080819174310.1eec34dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53805 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755311AbYHSUI5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 16:08:57 -0400
Content-Disposition: inline
In-Reply-To: <20080819174310.1eec34dc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

On Tue, Aug 19, 2008 at 05:43:10PM +1000, Stephen Rothwell wrote:
> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/safe_serial.c between commit
> 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB: remove info() macro from
> usb.h") from the usb tree and commit
> 5e6c4a742d494b0b049d7f01ce00da5b351d2cb8 ("tty-usbserial-kref") from the
> ttydev tree.
> 
> These changes modify each others context.  I fixed it up (see below) and
> can carry the fix.

Looks fine to me, thanks for doing this.

greg k-h
