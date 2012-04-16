From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 16 Apr 2012 10:02:30 -0700
Message-ID: <20120416170230.GB2448@linux.vnet.ibm.com>
References: <20120416141117.6dfcc5931400fede4e8cbe58@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:34095 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415Ab2DPRC4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 13:02:56 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 16 Apr 2012 11:02:55 -0600
Content-Disposition: inline
In-Reply-To: <20120416141117.6dfcc5931400fede4e8cbe58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, "Paul E. McKenney" <paul.mckenney@linaro.org>

On Mon, Apr 16, 2012 at 02:11:17PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/binfmt_misc.c: In function 'create_entry':
> fs/binfmt_misc.c:314:2: error: implicit declaration of function '_copy_from_user' [-Werror=implicit-function-declaration]
> 
> Caused by commit d17faaa53e2e ("fs: Silence bogus copy_to_user() build
> errors").  _copy_from_user() appears to only exist for the x86 and tile
> architectures ...
> 
> I have used the rcu tree from next-20120413 for today.

<red face>

It turns out that bug that commit d17faaa53e2e was working around has
been fixed in 3.4-rc2, so I have dropped that patch and reposted the
series.  Please accept my apologies for the hassle!

							Thanx, Paul
