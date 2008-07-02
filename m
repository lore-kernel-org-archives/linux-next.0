From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 11:10:06 -0700
Message-ID: <20080702111006.5b820108.randy.dunlap@oracle.com>
References: <20080702153011.c9cc0c4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:53340 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827AbYGBSKj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 14:10:39 -0400
In-Reply-To: <20080702153011.c9cc0c4a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

On Wed, 2 Jul 2008 15:30:11 +1000 Stephen Rothwell wrote:

> Hi Alan,
> 
> Today's linux-next build (sparc defconfig) failed like this:


istallion (on x86_64 or i386) has several build errors:

linux-next-20080702/drivers/char/istallion.c:829: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:891: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:892: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:893: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:928: error: 'struct tty_ldisc' has no member named 'flush_buffer'
linux-next-20080702/drivers/char/istallion.c:929: error: 'struct tty_ldisc' has no member named 'flush_buffer'
linux-next-20080702/drivers/char/istallion.c:1205: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:1234: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:1663: warning: unused variable 'ival'
linux-next-20080702/drivers/char/istallion.c:1860: error: 'struct stliport' has no member named 'refcount'
linux-next-20080702/drivers/char/istallion.c:4250: error: 'struct tty_port' has no member named 'flag'
linux-next-20080702/drivers/char/istallion.c:4501: warning: initialization from incompatible pointer type
make[3]: *** [drivers/char/istallion.o] Error 1



---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
