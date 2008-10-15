From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 20:48:49 +1100
Message-ID: <20081015204849.a404162b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44975 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751851AbYJOKnz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 06:43:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Frank Mayhar <fmayhar@google.com>, Ingo Molnar <mingo@elte.hu>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
include/linux/sched.h between commit
f06febc96ba8e0af80bcc3eaec0a109e88275fac ("timers: fix itimer/many thread
hang") from the timers tree and commit
3ef958261a38aaf9a7baab6565def2680e5743ed ("CRED: Separate per-task-group
keyrings from signal_struct") from the creds tree.

Just context changes. I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/sched.h
index b7b4dcc,0812cfd..0000000
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@@ -563,12 -527,8 +563,6 @@@ struct signal_struct 
  	 */
  	struct rlimit rlim[RLIM_NLIMITS];
  
- 	/* keep the process-shared keyrings here so that they do the right
- 	 * thing in threads created with CLONE_THREAD */
- #ifdef CONFIG_KEYS
- 	struct key *session_keyring;	/* keyring inherited over fork */
- 	struct key *process_keyring;	/* keyring private to this process */
- #endif
 -	struct list_head cpu_timers[3];
 -
  #ifdef CONFIG_BSD_PROCESS_ACCT
  	struct pacct_struct pacct;	/* per-process accounting information */
  #endif
