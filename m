From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Wed, 19 Apr 2017 13:50:16 +1000
Message-ID: <20170419135016.259c2d59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51943 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759423AbdDSDuT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 23:50:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

kernel/rcu/rcutorture.c: In function 'rcu_torture_stats_print':
kernel/rcu/rcutorture.c:1369:3: error: implicit declaration of function 'srcutorture_get_gp_data' [-Werror=implicit-function-declaration]
   srcutorture_get_gp_data(cur_ops->ttype, srcu_ctlp,
   ^

Caused by commit

  b4d55cac0a93 ("srcu: Make rcutorture writer stalls print SRCU GP state")

This config has CONFIG_CLASSIC_SRCU=y and CONFIG_RCU_TORTURE_TEST=m, so
CONFIG_RCU_TORTURE_TEST is not defined - CONFIG_RCU_TORTURE_TEST_MODULE
is defined.  You probably want to protect srcutorture_get_gp_data() with
IS_ENABLED(CONFIG_RCU_TORTURE_TEST) instead.

I have used the rcu tree from next-20170418 for today.

-- 
Cheers,
Stephen Rothwell
