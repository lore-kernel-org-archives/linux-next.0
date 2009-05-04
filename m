From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 4 May 2009 13:13:03 +1000
Message-ID: <20090504131303.11a57799.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54536 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751251AbZEDDNG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 May 2009 23:13:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Ian Kent <raven@themaw.net>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/autofs4/expire.c between commit
a8985f3ac503b51c5abf8883fc4fb912e13b955c ("autofs4: fix incorrect return
in autofs4_mount_busy()") from Linus' tree and commit
552b170bd50157881fc65d1a58ec73b225a2e9bf ("switch follow_down()") from
the vfs tree.

Just contextual changes.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/autofs4/expire.c
index 3077d8f,f82e42e..0000000
--- a/fs/autofs4/expire.c
+++ b/fs/autofs4/expire.c
@@@ -70,10 -70,8 +70,10 @@@ static int autofs4_mount_busy(struct vf
  		 * Otherwise it's an offset mount and we need to check
  		 * if we can umount its mount, if there is one.
  		 */
- 		if (!d_mountpoint(dentry)) {
 -		if (!d_mountpoint(path.dentry))
++		if (!d_mountpoint(path.dentry)) {
 +			status = 0;
  			goto done;
 +		}
  	}
  
  	/* Update the expiry counter if fs is busy */
