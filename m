From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Tue, 1 Sep 2015 13:50:06 +1000
Message-ID: <20150901135006.78be270e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48501 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751737AbbIADuI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2015 23:50:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!
ERROR: "percpu_down_write" [kernel/locking/locktorture.ko] undefined!
ERROR: "percpu_up_write" [kernel/locking/locktorture.ko] undefined!
ERROR: "percpu_down_read" [kernel/locking/locktorture.ko] undefined!
ERROR: "percpu_up_read" [kernel/locking/locktorture.ko] undefined!
ERROR: "__percpu_init_rwsem" [kernel/locking/locktorture.ko] undefined!

Caused by commits

  04be76a9b067 ("locktorture: Support rtmutex torturing")
  40b2996f9b32 ("locktorture: Add torture tests for percpu_rwsem")

and maybe more.

I have used the rcu tree from next-20150831 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
