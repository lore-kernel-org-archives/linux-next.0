From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 27 Apr 2010 08:13:05 -0700
Message-ID: <20100427151305.GA7653@kroah.com>
References: <20100427141224.834a102a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:44775 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751447Ab0D0POs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Apr 2010 11:14:48 -0400
Content-Disposition: inline
In-Reply-To: <20100427141224.834a102a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

On Tue, Apr 27, 2010 at 02:12:24PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "uart_console_device" [drivers/serial/altera_uart.ko] undefined!
> ERROR: "uart_console_device" [drivers/serial/altera_jtaguart.ko] undefined!
> 
> Introduced by commits 76bdbd933febe791fee114e7bb6c42bbd1a3f4f3 ("serial:
> Add driver for the Altera UART") and
> 11c59b34b299d7214b466cf799410a9a540476e3 ("serial: Add driver for the
> Altera JTAG UART").
> 
> I have reverted those commits for today.

Those came in through the tty quilt tree, not the staging tree, right?

Tobias, care to send me a patch to resolve this?  I already fixed one
Kconfig issue in these patches (forcing the driver to always be built
in.)  Is that what caused this symbol issue?

thanks,

greg k-h
