From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cifs tree
Date: Mon, 17 Nov 2008 13:42:43 +1100
Message-ID: <20081117134243.0d729c7a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51303 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754356AbYKQCmt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 21:42:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Jeff Layton <jlayton@redhat.com>

Hi Steve,

Today's linux-next merge of the cifs tree got a conflict in
fs/cifs/connect.c between commit be859405487324ed548f1ba11dc949b8230ab991
("fs: replace NIPQUAD()") from the net tree and commit
14fbf50d695207754daeb96270b3027a3821121f ("cifs: reinstate sharing of SMB
sessions sans races") from the cifs tree.

I have fixed it up (see below) and can carry it as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/cifs/connect.c
index 2df8e6d,a3dc0d7..0000000
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@@ -2078,43 -2176,44 +2176,44 @@@ cifs_mount(struct super_block *sb, stru
  	} else if (!rc) {
  		cFYI(1, ("Existing smb sess not found"));
  		pSesInfo = sesInfoAlloc();
- 		if (pSesInfo == NULL)
+ 		if (pSesInfo == NULL) {
  			rc = -ENOMEM;
- 		else {
- 			pSesInfo->server = srvTcp;
- 			sprintf(pSesInfo->serverName, "%pI4",
- 				&sin_server.sin_addr.s_addr);
- 		}
+ 			goto mount_fail_check;
+ 		}
+ 
+ 		/* new SMB session uses our srvTcp ref */
+ 		pSesInfo->server = srvTcp;
 -		sprintf(pSesInfo->serverName, "%u.%u.%u.%u",
 -			NIPQUAD(sin_server->sin_addr.s_addr));
++		sprintf(pSesInfo->serverName, "%pI4",
++			&sin_server->sin_addr.s_addr);
+ 
+ 		write_lock(&cifs_tcp_ses_lock);
+ 		list_add(&pSesInfo->smb_ses_list, &srvTcp->smb_ses_list);
+ 		write_unlock(&cifs_tcp_ses_lock);
+ 
+ 		/* volume_info.password freed at unmount */
+ 		if (volume_info.password) {
+ 			pSesInfo->password = volume_info.password;
+ 			/* set to NULL to prevent freeing on exit */
+ 			volume_info.password = NULL;
+ 		}
+ 		if (volume_info.username)
+ 			strncpy(pSesInfo->userName, volume_info.username,
+ 				MAX_USERNAME_SIZE);
+ 		if (volume_info.domainname) {
+ 			int len = strlen(volume_info.domainname);
+ 			pSesInfo->domainName = kmalloc(len + 1, GFP_KERNEL);
+ 			if (pSesInfo->domainName)
+ 				strcpy(pSesInfo->domainName,
+ 					volume_info.domainname);
+ 		}
+ 		pSesInfo->linux_uid = volume_info.linux_uid;
+ 		pSesInfo->overrideSecFlg = volume_info.secFlg;
+ 		down(&pSesInfo->sesSem);
  
- 		if (!rc) {
- 			/* volume_info.password freed at unmount */
- 			if (volume_info.password) {
- 				pSesInfo->password = volume_info.password;
- 				/* set to NULL to prevent freeing on exit */
- 				volume_info.password = NULL;
- 			}
- 			if (volume_info.username)
- 				strncpy(pSesInfo->userName,
- 					volume_info.username,
- 					MAX_USERNAME_SIZE);
- 			if (volume_info.domainname) {
- 				int len = strlen(volume_info.domainname);
- 				pSesInfo->domainName =
- 					kmalloc(len + 1, GFP_KERNEL);
- 				if (pSesInfo->domainName)
- 					strcpy(pSesInfo->domainName,
- 						volume_info.domainname);
- 			}
- 			pSesInfo->linux_uid = volume_info.linux_uid;
- 			pSesInfo->overrideSecFlg = volume_info.secFlg;
- 			down(&pSesInfo->sesSem);
- 			/* BB FIXME need to pass vol->secFlgs BB */
- 			rc = cifs_setup_session(xid, pSesInfo,
- 						cifs_sb->local_nls);
- 			up(&pSesInfo->sesSem);
- 			if (!rc)
- 				atomic_inc(&srvTcp->socketUseCount);
- 		}
+ 		/* BB FIXME need to pass vol->secFlgs BB */
+ 		rc = cifs_setup_session(xid, pSesInfo,
+ 					cifs_sb->local_nls);
+ 		up(&pSesInfo->sesSem);
  	}
  
  	/* search for existing tcon to this server share */
