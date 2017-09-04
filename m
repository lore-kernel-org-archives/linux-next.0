From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Mon, 4 Sep 2017 14:50:45 +1000
Message-ID: <20170904145045.090c048b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Paul,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "rcu_cpu_stall_suppress" [kernel/rcu/rcutorture.ko] undefined!
ERROR: "rcu_cpu_stall_suppress" [kernel/rcu/rcuperf.ko] undefined!

Caused by commit

  909bd6e3d9e7 ("rcu: Suppress RCU CPU stall warnings while dumping trace")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
