From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the proc tree
Date: Thu, 20 Nov 2008 17:05:30 +1100
Message-ID: <20081120170530.a8cd0472.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37466 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751473AbYKTGFn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 01:05:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>

Hi Alexey,

Today's linux-next merge of the proc tree got a conflict in
fs/proc/base.c between commit c69e8d9c01db2adc503464993c358901c9af9de4
("CRED: Use RCU to access another task's creds and to release a task's
own creds") from the security-testing tree and commit
e19b45ac5884142791216739fa077cebe626e085 ("proc: don't show the
wrong /proc/net after unshare") from the proc tree.

Just a trivial overlap.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/proc/base.c
index cf42c42,250154f..0000000
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@@ -1490,8 -1510,7 +1517,9 @@@ static int pid_revalidate(struct dentr
  {
  	struct inode *inode = dentry->d_inode;
  	struct task_struct *task = get_proc_task(inode);
 +	const struct cred *cred;
+ 	int ret = 0;
 +
  	if (task) {
  		if ((inode->i_mode == (S_IFDIR|S_IRUGO|S_IXUGO)) ||
  		    task_dumpable(task)) {
