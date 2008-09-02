From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Tue, 2 Sep 2008 10:22:33 +0100
Message-ID: <20080902102233.22cebd60@lxorguk.ukuu.org.uk>
References: <20080902172322.15c465e7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:59636 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750894AbYIBJjt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 05:39:49 -0400
In-Reply-To: <20080902172322.15c465e7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, 2 Sep 2008 17:23:22 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> /drivers/char/tty_ioctl.c: In function 'change_termios':
> drivers/isdn/capi/capi.c:1234: error: implicit declaration of function 'n_tty_ioctl'

Thanks - looks correct and I missed the ISDN code somehow

> drivers/isdn/gigaset/ser-gigaset.c: In function 'gigaset_tty_ioctl':
> drivers/isdn/gigaset/ser-gigaset.c:648: error: implicit declaration of function 'n_tty_ioctl'

Put what you like there, gigaset has been fairly busted for ages.

Alan
