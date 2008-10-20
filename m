From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Mon, 20 Oct 2008 19:18:04 +1100
Message-ID: <20081020191804.fe73c82a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37710 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbYJTISJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 04:18:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/devpts/inode.c between commit c7d2a0f75f034faef7e6504f6f8ea3ec87b324c2
("pty-per-mount-config") from ttydev tree and commit
955472187492d73580a4c4c65d5d6b1f8a603f58 ("CRED: Wrap task credential
accesses in the devpts filesystem") from the creds tree.

Just overlapping changes.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/devpts/inode.c
index 5006485,5d61b7c..0000000
--- a/fs/devpts/inode.c
+++ b/fs/devpts/inode.c
@@@ -594,11 -221,11 +594,11 @@@ int devpts_pty_new(struct inode *ptmx_i
  	if (!inode)
  		return -ENOMEM;
  
 -	inode->i_ino = number+2;
 -	inode->i_uid = config.setuid ? config.uid : current_fsuid();
 -	inode->i_gid = config.setgid ? config.gid : current_fsgid();
 +	inode->i_ino = number+3;
- 	inode->i_uid = opts->setuid ? opts->uid : current->fsuid;
- 	inode->i_gid = opts->setgid ? opts->gid : current->fsgid;
++	inode->i_uid = opts->setuid ? opts->uid : current_fsuid();
++	inode->i_gid = opts->setgid ? opts->gid : current_fsgid();
  	inode->i_mtime = inode->i_atime = inode->i_ctime = CURRENT_TIME;
 -	init_special_inode(inode, S_IFCHR|config.mode, device);
 +	init_special_inode(inode, S_IFCHR|opts->mode, device);
  	inode->i_private = tty;
  	tty->driver_data = inode;
  
