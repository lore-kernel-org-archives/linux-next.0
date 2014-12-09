From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 9 Dec 2014 06:07:33 -0800
Message-ID: <20141209140733.GA25340@linux.vnet.ibm.com>
References: <20141209224230.57f0aa34@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:53662 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754022AbaLIOH6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2014 09:07:58 -0500
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 9 Dec 2014 07:07:57 -0700
Content-Disposition: inline
In-Reply-To: <20141209224230.57f0aa34@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pranith Kumar <bobby.prani@gmail.com>

On Tue, Dec 09, 2014 at 10:42:30PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (powerpc
> allnoconfig) failed like this:
> 
> include/linux/notifier.h:51:4: warning: its scope is only this definition or declaration, which is probably not what you want
> In file included from include/linux/memory_hotplug.h:6:0,
>                  from include/linux/mmzone.h:790,
>                  from include/linux/gfp.h:5,
>                  from arch/powerpc/mm/pgtable.c:25:
> include/linux/notifier.h:51:4: error: 'struct notifier_block' declared inside parameter list [-Werror]
>     unsigned long action, void *data);
>     ^
> 
> And many more (most just warnings ...).
> 
> Presumably caused by commit 44dec3761b63 ("srcu: Isolate srcu sections
> using CONFIG_SRCU") and reverting that commit makes the messages go
> away, so I have done that for today.

Apologies, I forgot to push the fix to rcu/next, will do.

							Thanx, Paul
