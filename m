From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs build failure
Date: Tue, 17 Jun 2008 16:19:15 -0400
Message-ID: <1213733955.7288.24.camel@localhost>
References: <20080617192622.e448a37e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:42935 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754030AbYFQUiK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 16:38:10 -0400
In-Reply-To: <20080617192622.e448a37e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

On Tue, 2008-06-17 at 19:26 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
> 
> fs/nfs/super.c: In function 'nfs_remount':
> fs/nfs/super.c:1440: error: 'nfs4_fs_type' undeclared (first use in this function)
> 
> Caused by commit 68a2efd9008ee81e72a4d1dcdf228414f5dfa6ff ("NFS:
> implement option checking when remounting NFS filesystems (resend)").
> 
> I applied the following patch (which may not be correct).

Thanks Stephen! The patch looks correct, but I think I'd still prefer
the following to avoid the #ifdef.

Cheers
  Trond
----------------------------------------------------------------
From: Trond Myklebust <Trond.Myklebust@netapp.com>
Date: Tue, 17 Jun 2008 16:12:00 -0400
NFS: Fix a dependency on CONFIG_NFS_V4 in nfs_remount

Fix the 'nfs4_fs_type' undeclared error in nfs_remount when compiling sans
NFSv4...

Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Jeff Layton <jlayton@redhat.com>
---

 fs/nfs/super.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 39c028e..c8f29ac 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1426,6 +1426,7 @@ nfs_remount(struct super_block *sb, int *flags, char *raw_data)
 	struct nfs_parsed_mount_data *data;
 	struct nfs_mount_data *options = (struct nfs_mount_data *)raw_data;
 	struct nfs4_mount_data *options4 = (struct nfs4_mount_data *)raw_data;
+	u32 nfsvers = nfss->nfs_client->rpc_ops->version;
 
 	/*
 	 * Userspace mount programs that send binary options generally send
@@ -1433,8 +1434,8 @@ nfs_remount(struct super_block *sb, int *flags, char *raw_data)
 	 * ones were explicitly specified. Fall back to legacy behavior and
 	 * just return success.
 	 */
-	if ((sb->s_type == &nfs4_fs_type && options4->version == 1) ||
-	    (sb->s_type == &nfs_fs_type && options->version >= 1 &&
+	if ((nfsvers == 4 && options4->version == 1) ||
+	    (nfsvers <= 3 && options->version >= 1 &&
 	     options->version <= 6))
 		return 0;
 


