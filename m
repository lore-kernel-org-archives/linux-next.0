From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the creds tree
Date: Thu, 30 Oct 2008 15:47:41 +1100
Message-ID: <20081030154741.2651e779.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47373 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751888AbYJ3FM5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 01:12:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>

Hi David,

Today's linux-next merge of the creds tree got conflicts in
fs/xfs/linux-2.6/xfs_cred.h, fs/xfs/linux-2.6/xfs_globals.h and
fs/xfs/xfs_vnodeops.h between commit
959f0f5b48d25a478694e04d024cd1ca681ea4bf ("[XFS] kill sys_cred") from the
xfs tree and commit 3634a8a33b2cd7296e265d01d606b58c22b6a557 ("CRED:
Separate task security context from task_struct") from the creds tree.

The former mostly removed what the latter changed.  I fixed it up (see
below - I just removed the "extern cred_t *sys_cred;" from xfs_globals.h
and the cred_t arguments to xfs_setattr and xfs_change_file_space in
xfs_vnodeops.h) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/xfs/linux-2.6/xfs_cred.h
index 98da219,8c022cd..0000000
--- a/fs/xfs/linux-2.6/xfs_cred.h
+++ b/fs/xfs/linux-2.6/xfs_cred.h
@@@ -23,8 -23,14 +23,6 @@@
  /*
   * Credentials
   */
- typedef struct cred {
- 	/* EMPTY */
- } cred_t;
+ typedef const struct cred cred_t;
  
 -extern cred_t *sys_cred;
 -
 -/* this is a hack.. (assumes sys_cred is the only cred_t in the system) */
 -static inline int capable_cred(cred_t *cr, int cid)
 -{
 -	return (cr == sys_cred) ? 1 : capable(cid);
 -}
 -
  #endif  /* __XFS_CRED_H__ */
