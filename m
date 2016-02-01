From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 1 Feb 2016 01:53:57 -0800
Message-ID: <20160201095357.GO6719@linux.vnet.ibm.com>
References: <20160201135551.657cd095@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:46214 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693AbcBAJyE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2016 04:54:04 -0500
Received: from localhost
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 1 Feb 2016 02:54:03 -0700
Content-Disposition: inline
In-Reply-To: <20160201135551.657cd095@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 01, 2016 at 01:55:51PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from /home/sfr/next/next/include/linux/spinlock_types.h:18:0,
>                  from /home/sfr/next/next/include/linux/spinlock.h:81,
>                  from /home/sfr/next/next/kernel/rcu/tree.c:33:
> /home/sfr/next/next/kernel/rcu/tree.c: In function 'rcu_init_one':
> /home/sfr/next/next/include/linux/lockdep.h:299:27: error: 'struct rt_mutex' has no member named 'dep_map'
>    lockdep_init_map(&(lock)->dep_map, name, key, 0)
>                            ^
> /home/sfr/next/next/kernel/rcu/tree.c:4572:4: note: in expansion of macro 'lockdep_set_class_and_name'
>     lockdep_set_class_and_name(&rnp->exp_funnel_mutex,
>     ^
> 
> Caused by commit
> 
>   725b7f3805c6 ("rcu: Convert expedited grace-period funnel lock to rt_mutex")
> 
> I have used the rcu tree from next-20160129 for today.

Apologies, that was too experimental for -next.  I have placed rcu/next
to precede the offending commit.

							Thanx, Paul
