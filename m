From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with Linus' tree
Date: Tue, 27 Sep 2011 16:04:11 +1000
Message-ID: <20110927160411.7bcec0906847959fb6e88a81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, Frederic Weisbecker <fweisbec@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in
arch/x86/kernel/process_64.c between commit a0bfa1373859 ("cpuidle: stop
depending on pm_idle") from Linus' tree and commit 18349ca4b42e ("x86:
Enter rcu extended qs after idle notifier call") from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/process_64.c
index f693e44,dee2e6c..0000000
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@@ -137,8 -136,12 +137,14 @@@ void cpu_idle(void
  			enter_idle();
  			/* Don't trace irqs off for idle */
  			stop_critical_timings();
- 			if (cpuidle_idle_call())
+ 
 -			/* enter_idle() needs rcu for notifiers */
 -			rcu_enter_nohz();
 -			pm_idle();
 -			rcu_exit_nohz();
++			if (cpuidle_idle_call()) {
++				/* enter_idle() needs rcu for notifiers */
++				rcu_enter_nohz();
 +				pm_idle();
++				rcu_exit_nohz();
++			}
+ 
  			start_critical_timings();
  
  			/* In many cases the interrupt that ended idle
