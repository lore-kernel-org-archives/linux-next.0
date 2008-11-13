From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 13 Nov 2008 16:19:17 +1100
Message-ID: <20081113161917.9fb40489.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39176 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750740AbYKMFT0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 00:19:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
kernel/capability.c between commit
e68b75a027bb94066576139ee33676264f867b87 ("When the capset syscall is
used it is not possible for audit to record the") from the
security-testing tree and commit 2ea2fe20bdef1300ea07a9c38dbfea5d0c042898
("CRED: Neuter sys_capset()") from the creds tree.

Context changes. I fixed it up (see below) and can carry the fix for now
(though I am not sure of this fix).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/capability.c
index adb262f,6465ab7..0000000
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@@ -469,36 -259,18 +271,22 @@@ asmlinkage long sys_capset(cap_user_hea
  		i++;
  	}
  
 +	ret = audit_log_capset(pid, &effective, &inheritable, &permitted);
 +	if (ret)
 +		return ret;
 +
- 	if (pid && (pid != task_pid_vnr(current)))
- 		ret = do_sys_capset_other_tasks(pid, &effective, &inheritable,
- 						&permitted);
- 	else {
- 		/*
- 		 * This lock is required even when filesystem
- 		 * capability support is configured - it protects the
- 		 * sys_capget() call from returning incorrect data in
- 		 * the case that the targeted process is not the
- 		 * current one.
- 		 */
- 		spin_lock(&task_capability_lock);
- 
- 		ret = security_capset_check(current, &effective, &inheritable,
- 					    &permitted);
- 		/*
- 		 * Having verified that the proposed changes are
- 		 * legal, we now put them into effect.
- 		 */
- 		if (!ret)
- 			security_capset_set(current, &effective, &inheritable,
- 					    &permitted);
- 		spin_unlock(&task_capability_lock);
- 	}
+ 	new = prepare_creds();
+ 	if (!new)
+ 		return -ENOMEM;
  
+ 	ret = security_capset(new, current_cred(),
+ 			      &effective, &inheritable, &permitted);
+ 	if (ret < 0)
+ 		goto error;
+ 	return commit_creds(new);
  
+ error:
+ 	abort_creds(new);
  	return ret;
  }
  
