From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 22 Jul 2008 11:31:58 +0100
Message-ID: <20080722113158.3ad57716@lxorguk.ukuu.org.uk>
References: <20080722163754.715cf9cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:60495 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754353AbYGVKtV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 06:49:21 -0400
In-Reply-To: <20080722163754.715cf9cb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 22 Jul 2008 16:37:54 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got conflicts in
> drivers/char/istallion.c, drivers/char/mxser.c, drivers/char/specialix.c,
> drivers/char/synclink_gt.c, drivers/char/tty_io.c,
> drivers/usb/gadget/serial.c, drivers/usb/serial/cp2101.c,
> drivers/usb/serial/io_ti.c, drivers/usb/serial/ir-usb.c,
> drivers/usb/serial/usb-serial.c, include/linux/tty.h and
> net/bluetooth/rfcomm/tty.c mainly against Linus' tree.
> 
> This is not unexpected since some of the ttydev tree has been merged, so I
> will drop it for today in the hope that things are better tomorrow.

I've fired the rest of the ttydev tree at Linus this morning now that
clashing stuff seems to have stopped being merged for a few hours. At
that point the ttydev tree should be empty. Andrew will push a few ip2
patches directly. Hopefully now there is a real tty devel tree it'll have
less clashes in future.

Thanks for the help in getting started with linux-next btw.

Alan
