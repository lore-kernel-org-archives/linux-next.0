From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree with the
 usb.current tree
Date: Thu, 12 Mar 2009 09:44:34 +0000
Message-ID: <20090312094434.4caaa695@lxorguk.ukuu.org.uk>
References: <20090312150455.e5ab0a56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:33520 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751446AbZCLJoH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 05:44:07 -0400
In-Reply-To: <20090312150455.e5ab0a56.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Axel Wachtler <axel.wachtler@atmel.com>, Michael Hennerich <michael.hennerich@analog.com>

> Today's linux-next merge of the ttydev tree got conflicts in
> drivers/usb/serial/ftdi_sio.c and drivers/usb/serial/ftdi_sio.h.  It
> looks like the same two patches have been applied to the ttydev
> (tty-ftdi-gnice, tty-ftdi-dresdenelec) and the usb.current (USB: serial:

These are USB identifier updates to a USB driver that's also a tty
driver. I'll drop them in favour of GregKH's tree carring them.
