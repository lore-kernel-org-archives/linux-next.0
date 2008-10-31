From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 17:06:09 +1100
Message-ID: <20081031170609.a3fcda4e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37018 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752484AbYJaGME (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 02:12:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

Hi David,

Today's linux-next merge of the creds tree got a conflict in
security/selinux/hooks.c between commit
8b6a5a37f87a414ef8636e36ec75accb27bb7508 ("SELinux: check open perms in
dentry_open not inode_permission") from the security-testing tree and
commits 7113316bdf8c9f91df7bd68ab739d9bd0f5e8efc ("CRED: Make
inode_has_perm() and file_has_perm() take a cred pointer") and
a9018998dcc1e3b4401a7f6d2050ffedbd1b64da ("CRED: Inaugurate COW
credentials") from the creds tree.

Overlapping changes.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc security/selinux/hooks.c
index b8ad7ec,b90bbe4..0000000
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@@ -2648,8 -2689,8 +2690,8 @@@ static int selinux_inode_permission(str
  		return 0;
  	}
  
- 	return inode_has_perm(current, inode,
+ 	return inode_has_perm(cred, inode,
 -			      open_file_mask_to_av(inode->i_mode, mask), NULL);
 +			      file_mask_to_av(inode->i_mode, mask), NULL);
  }
  
  static int selinux_inode_setattr(struct dentry *dentry, struct iattr *iattr)
@@@ -3165,7 -3223,7 +3224,7 @@@ static int selinux_dentry_open(struct f
  	 * new inode label or new policy.
  	 * This check is not redundant - do not remove.
  	 */
- 	return inode_has_perm(current, inode, open_file_to_av(file), NULL);
 -	return inode_has_perm(cred, inode, file_to_av(file), NULL);
++	return inode_has_perm(cred, inode, open_file_to_av(file), NULL);
  }
  
  /* task security operations */
