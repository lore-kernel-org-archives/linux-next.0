From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 21:00:31 +1100
Message-ID: <20081015210031.0d51294c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44987 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752114AbYJOKoC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 06:44:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
kernel/signal.c between commit f06febc96ba8e0af80bcc3eaec0a109e88275fac
("timers: fix itimer/many thread hang") from the timers tree and commit
e3c5b08cf35d6e1913789255e0755dfb46cc0807 ("CRED: Use RCU to access
another task's creds and to release a task's own creds") from the creds
tree.

Just context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/signal.c
index 105217d,8da146a..0000000
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@@ -1368,13 -1384,13 +1388,12 @@@ int do_notify_parent(struct task_struc
  	 */
  	rcu_read_lock();
  	info.si_pid = task_pid_nr_ns(tsk, tsk->parent->nsproxy->pid_ns);
+ 	info.si_uid = __task_cred(tsk)->uid;
  	rcu_read_unlock();
  
- 	info.si_uid = tsk->uid;
- 
 -	info.si_utime = cputime_to_clock_t(cputime_add(tsk->utime,
 -						       tsk->signal->utime));
 -	info.si_stime = cputime_to_clock_t(cputime_add(tsk->stime,
 -						       tsk->signal->stime));
 +	thread_group_cputime(tsk, &cputime);
 +	info.si_utime = cputime_to_jiffies(cputime.utime);
 +	info.si_stime = cputime_to_jiffies(cputime.stime);
  
  	info.si_status = tsk->exit_code & 0x7f;
  	if (tsk->exit_code & 0x80)
