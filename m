From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 27 Jul 2010 08:43:53 +0100
Message-ID: <20100727084353.5b14224a@lxorguk.ukuu.org.uk>
References: <20100727151843.7d253148.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:45694 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752706Ab0G0HcY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jul 2010 03:32:24 -0400
In-Reply-To: <20100727151843.7d253148.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Feng Tang <feng.tang@intel.com>, Alan Cox <alan@linux.intel.com>

On Tue, 27 Jul 2010 15:18:43 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/serial/mfd.c:37:30: error: linux/serial_mfd.h: No such file or directory
> drivers/serial/mfd.c: In function 'port_show_regs':
> drivers/serial/mfd.c:166: error: 'UART_FOR' undeclared (first use in this function)
> 
> ... and on ... and on ...
> 
> Caused by commit c3190cf68dfc58c33de0fd59b919cbb864acbba4 ("hsu: driver
> for Medfield High Speed UART device") and following.   Did it miss a file?
> 
> A little more care and testing, please.

Yes although I had a local copy so it built and tested beautifully 8(

Will send Greg and updated set of those patches versus todays -next
