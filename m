From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Thu, 7 Jan 2016 19:57:25 +1100
Message-ID: <20160107195725.3a130b4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53011 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbcAGI51 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 03:57:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

[I found this a few days ago, but I think I forgot to send the email,
sorry.]

After merging the rcu tree, today's linux-next build (powerpc
allyesconfig) failed like this:

kernel/rcu/rcuperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_srcu_array'
kernel/rcu/rcutorture.o:(.discard+0x0): first defined here

Caused by commit

  abcd7ec0808e ("rcutorture: Add RCU grace-period performance tests")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
