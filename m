From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Tree for May 24 (ratelimits, CONFIG_PRINTK not
 enabled)
Date: Tue, 24 May 2011 11:49:48 -0700
Message-ID: <1306262988.2298.49.camel@Joe-Laptop>
References: <20110524140212.a4f19769.sfr@canb.auug.org.au>
	 <20110524113328.e3d5867b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1970 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752696Ab1EXStu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 May 2011 14:49:50 -0400
In-Reply-To: <20110524113328.e3d5867b.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, davem@davemloft.net

On Tue, 2011-05-24 at 11:33 -0700, Randy Dunlap wrote:
> On Tue, 24 May 2011 14:02:12 +1000 Stephen Rothwell wrote:
> > Hi all,
> > Changes since 20110523:
> when CONFIG_PRINTK is not enabled:
> net/core/filter.c:353: warning: type defaults to 'int' in declaration of 'DEFINE_RATELIMIT_STATE'
> net/core/filter.c:353: warning: parameter names (without types) in function declaration
> net/core/filter.c:353: error: invalid storage class for function 'DEFINE_RATELIMIT_STATE'
> net/core/filter.c:353: error: implicit declaration of function '__ratelimit'
> net/core/filter.c:353: error: '_rs' undeclared (first use in this function)

Thanks for the report Randy.

I wonder if it's better to new create sections for
!CONFIG_PRINTK in bug.h.  That might make the image
a bit smaller when !CONFIG_PRINTK too.

> Adding <linux/ratelimit.h> to <asm-generic/bug.h> causes other problems:

Yup, that's not a good solution.
