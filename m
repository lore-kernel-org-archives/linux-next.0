From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ceph tree with Linus' tree
Date: Fri, 14 May 2010 10:07:52 +1000
Message-ID: <20100514100752.4ea815a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cheng Renquan <crquan@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Sage,

Today's linux-next merge of the ceph tree got a conflict in
fs/ceph/caps.c between commit f818a73674c5d197f66b636a46d7d578d7258129
("ceph: fix cap removal races") from Linus' tree and commit
9f2a2a1faa0fd990d4930605583a67d7dff28bff ("ceph: use ceph_sb_to_client
instead of ceph_client") from the ceph tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ceph/caps.c
index d940053,1747db0..0000000
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@@ -867,8 -864,8 +867,9 @@@ void __ceph_remove_cap(struct ceph_cap 
  {
  	struct ceph_mds_session *session = cap->session;
  	struct ceph_inode_info *ci = cap->ci;
- 	struct ceph_mds_client *mdsc = &ceph_client(ci->vfs_inode.i_sb)->mdsc;
+ 	struct ceph_mds_client *mdsc =
+ 		&ceph_sb_to_client(ci->vfs_inode.i_sb)->mdsc;
 +	int removed = 0;
  
  	dout("__ceph_remove_cap %p from %p\n", cap, &ci->vfs_inode);
  
