From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Mon, 1 Feb 2016 13:55:51 +1100
Message-ID: <20160201135551.657cd095@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34803 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752407AbcBACzx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 21:55:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from /home/sfr/next/next/include/linux/spinlock_types.h:18:0,
                 from /home/sfr/next/next/include/linux/spinlock.h:81,
                 from /home/sfr/next/next/kernel/rcu/tree.c:33:
/home/sfr/next/next/kernel/rcu/tree.c: In function 'rcu_init_one':
/home/sfr/next/next/include/linux/lockdep.h:299:27: error: 'struct rt_mutex' has no member named 'dep_map'
   lockdep_init_map(&(lock)->dep_map, name, key, 0)
                           ^
/home/sfr/next/next/kernel/rcu/tree.c:4572:4: note: in expansion of macro 'lockdep_set_class_and_name'
    lockdep_set_class_and_name(&rnp->exp_funnel_mutex,
    ^

Caused by commit

  725b7f3805c6 ("rcu: Convert expedited grace-period funnel lock to rt_mutex")

I have used the rcu tree from next-20160129 for today.

-- 
Cheers,
Stephen Rothwell
