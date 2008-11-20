From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the proc tree
Date: Thu, 20 Nov 2008 17:12:12 +1100
Message-ID: <20081120171212.7380ea43.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53837 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752453AbYKTGM1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 01:12:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>

Hi Alexey,

Today's linux-next merge of the proc tree got a conflict in kernel/exit.c
between commit c69e8d9c01db2adc503464993c358901c9af9de4 ("CRED: Use RCU
to access another task's creds and to release a task's own creds") from
the security-testing tree and commit
214ce93109bdec6fa474c8f742d56911180a8d4a ("proc: implement support for
automounts in task directories") from the proc tree.

I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/exit.c
index 048065d,abd5bd4..0000000
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@@ -166,10 -164,8 +166,11 @@@ void release_task(struct task_struct * 
  	int zap_leader;
  repeat:
  	tracehook_prepare_release_task(p);
 -	atomic_dec(&p->user->processes);
 +	/* don't need to get the RCU readlock here - the process is dead and
 +	 * can't be modifying its own credentials */
 +	atomic_dec(&__task_cred(p)->user->processes);
 +
+ 	proc_shrink_automounts();
  	proc_flush_task(p);
  	write_lock_irq(&tasklist_lock);
  	tracehook_finish_release_task(p);
