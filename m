From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Tue, 21 Oct 2008 17:07:04 +1100
Message-ID: <20081021170704.e286be37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36785 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753735AbYJUIi4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 04:38:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Brice Goglin <Brice.Goglin@inria.fr>, Andrew Morton <akpm@linux-foundation.org>

Hi David,

Today's linux-next merge of the creds tree got a conflict in mm/migrate.c
between commit sys_move_pages ("mm: extract do_pages_move() out of
sys_move_pages()") from Linus' tree and commits
b76546e8e9ac10969037c4866fcc44716e66eef8 ("CRED: Wrap task credential
accesses in the core kernel"), 12da5768699059a4fe96080df5fa4e6d0e73a9ba
("CRED: Separate task security context from task_struct") and
e3c5b08cf35d6e1913789255e0755dfb46cc0807 ("CRED: Use RCU to access
another task's creds and to release a task's own creds") from the creds
tree.

I think I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/migrate.c
index 13c3019,ad44478..0000000
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@@ -1045,9 -984,13 +1045,10 @@@ asmlinkage long sys_move_pages(pid_t pi
  			const int __user *nodes,
  			int __user *status, int flags)
  {
+ 	const struct cred *cred = current_cred(), *tcred;
 -	int err = 0;
 -	int i;
  	struct task_struct *task;
 -	nodemask_t task_nodes;
  	struct mm_struct *mm;
 -	struct page_to_node *pm = NULL;
 +	int err;
  
  	/* Check flags */
  	if (flags & ~(MPOL_MF_MOVE|MPOL_MF_MOVE_ALL))
@@@ -1075,12 -1018,16 +1076,16 @@@
  	 * capabilities, superuser privileges or the same
  	 * userid as the target process.
  	 */
- 	if ((current->euid != task->suid) && (current->euid != task->uid) &&
- 	    (current->uid != task->suid) && (current->uid != task->uid) &&
+ 	rcu_read_lock();
+ 	tcred = __task_cred(task);
+ 	if (cred->euid != tcred->suid && cred->euid != tcred->uid &&
+ 	    cred->uid  != tcred->suid && cred->uid  != tcred->uid &&
  	    !capable(CAP_SYS_NICE)) {
+ 		rcu_read_unlock();
  		err = -EPERM;
 -		goto out2;
 +		goto out;
  	}
+ 	rcu_read_unlock();
  
   	err = security_task_movememory(task);
   	if (err)
