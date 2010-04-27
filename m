From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-ioctl tree with the bkl-procfs
 tree
Date: Tue, 27 Apr 2010 15:06:36 +1000
Message-ID: <20100427150636.241eb65b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35680 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750994Ab0D0FGi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Apr 2010 01:06:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the bkl-ioctl tree got a conflict in
fs/proc/inode.c between commit 3ab8dfb0802f33741cc4afa6adf7cb30b1cd1761
("procfs: Kill the bkl in ioctl") from the bkl-procfs tree and commit
1dd97d3d546aa14db7efa5366b21d1336b91379e ("Rename 'struct
file_operations' 'ioctl' fn pointer to 'bkl_ioctl'") from the bkl-ioctl
tree.

I fixed it up (see below - probably not optimal) and can carry the fix =
as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/proc/inode.c
index aea8502,8e8f813..0000000
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@@ -231,10 -231,10 +231,10 @@@ static long proc_reg_unlocked_ioctl(str
  		rv =3D unlocked_ioctl(file, cmd, arg);
  		if (rv =3D=3D -ENOIOCTLCMD)
  			rv =3D -EINVAL;
- 	} else if (ioctl) {
+ 	} else if (bkl_ioctl) {
 -		lock_kernel();
 +		WARN_ONCE(1, "Procfs ioctl handlers must use unlocked_ioctl, "
 +			  "%pf will be called without the Bkl held\n", bkl_ioctl);
- 		rv =3D ioctl(file->f_path.dentry->d_inode, file, cmd, arg);
+ 		rv =3D bkl_ioctl(file->f_path.dentry->d_inode, file, cmd, arg);
 -		unlock_kernel();
  	}
 =20
  	pde_users_dec(pde);
