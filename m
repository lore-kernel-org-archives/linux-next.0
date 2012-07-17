From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 17 Jul 2012 11:10:53 +0100
Message-ID: <20120717111053.287191b3@pyramind.ukuu.org.uk>
References: <20120717134506.3f3f0614ad1d5193689de334@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:36937 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076Ab2GQKHY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jul 2012 06:07:24 -0400
In-Reply-To: <20120717134506.3f3f0614ad1d5193689de334@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 17 Jul 2012 13:45:06 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Greg,
> 
> After merging the tty tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/tty/tty_ioctl.c: In function 'set_sgflags':
> drivers/tty/tty_ioctl.c:741:9: error: request for member 'c_iflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:742:9: error: request for member 'c_oflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:743:9: error: request for member 'c_lflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:745:10: error: request for member 'c_iflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:746:10: error: request for member 'c_lflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:749:10: error: request for member 'c_lflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:753:10: error: request for member 'c_oflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:756:10: error: request for member 'c_iflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:757:10: error: request for member 'c_lflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:759:15: error: request for member 'c_lflag' in something not a structure or union
> drivers/tty/tty_ioctl.c:760:10: error: request for member 'c_cc' in something not a structure or union
> drivers/tty/tty_ioctl.c:761:10: error: request for member 'c_cc' in something not a structure or union
> 
> Caused by commit adc8d746caa6 ("tty: move the termios object into the
> tty").  Did anyone build test this?  :-(

It's known not to build. I sent Greg some patches but he wants them
versus a different tree. I hope to have that done and tested in the next
couple of days, until then I'd suggest you drop the tty tree - in
particular because the version you are currently using scribbles on other
bits of of memory.

Alan
