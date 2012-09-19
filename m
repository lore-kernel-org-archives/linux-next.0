From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the tty tree
Date: Wed, 19 Sep 2012 08:17:05 +0100
Message-ID: <20120919071705.GC16905@kroah.com>
References: <20120919141636.99298d4d5e8501ec377e5594@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34083 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753144Ab2ISHRI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Sep 2012 03:17:08 -0400
Content-Disposition: inline
In-Reply-To: <20120919141636.99298d4d5e8501ec377e5594@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Wed, Sep 19, 2012 at 02:16:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/io_edgeport.c between commit adc8d746caa6 ("tty: move
> the termios object into the tty") from the tty tree and commit
> 984f68683298 ("USB: serial: io_edgeport.c: remove dbg() usage") from the
> usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks correct to me, thanks for the fix.

greg k-h
