From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Thu, 21 Aug 2008 11:21:51 +0100
Message-ID: <20080821112151.6383d0c3@lxorguk.ukuu.org.uk>
References: <20080821180308.141bccb7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:41695 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753009AbYHUKjW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Aug 2008 06:39:22 -0400
In-Reply-To: <20080821180308.141bccb7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

On Thu, 21 Aug 2008 18:03:08 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got trivial conflicts in
> drivers/usb/serial/aircable.c and drivers/usb/serial/keyspan_pda.c
> between commit 7b4dc5ed3acb8410fd078a6876d01c206af803ed ("USB: remove use
> of err() in drivers/usb/serial") from the usb tree and commit
> 9c3656d0341bc2763b3f4abc9484776ff28c1c12 ("tty-usbserial-kref") from the
> ttydev tree.
> 
> Just overlapping context of changes. I fixed it up (see below).  I assume
> that the err -> dev_err changes could be added to your tree, Alan.

I took that as a hint and have done so.
