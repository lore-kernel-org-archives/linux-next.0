From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Wed, 12 Nov 2008 16:22:14 +1100
Message-ID: <20081112162214.56872ba7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52452 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750778AbYKLFW0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 00:22:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
fs/devpts/inode.c between commit 2f6b28889414a43b570123886d1fc38abbdd363e
("pty-per-mount-config") from the ttydev tree and commit
533a45d7003203b147c4861ff45353387b4b05db ("CRED: Wrap task credential
accesses in the devpts filesystem") from the creds tree.

Overlapping changes. I fixed it up (see below) and will carry it for a
while.  You should send the creds tree patch above to Alan now that the
APIs are available in mainline.

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
  
