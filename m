From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Wed, 19 Sep 2012 14:59:25 +0100
Message-ID: <20120919145925.35e95b5a@pyramind.ukuu.org.uk>
References: <20120919143136.46dd2318963c0d8524492041@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:36202 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754106Ab2ISNyu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Sep 2012 09:54:50 -0400
In-Reply-To: <20120919143136.46dd2318963c0d8524492041@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

On Wed, 19 Sep 2012 14:31:36 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/usb/serial/vizzini.c: In function 'vizzini_set_termios':
> drivers/usb/serial/vizzini.c:454:22: error: invalid type argument of '->' (have 'struct ktermios')
> 
> Caused by commit c05fecb1d57e ("USB: serial: add vizzini driver")
> interacting with commit adc8d746caa6 ("tty: move the termios object into
> the tty") from the tty tree.
> 
> I added the following merge fix patch and can carry it as necessary:

Vizzini seems to have teleported into Greg's tree. Greg - it's got a pile
of other bugs in it plus complete bogus comments and the like. You don't
seem to have every posted it to the lists for comment or if you did it
didn't turn up here ?

Alan
