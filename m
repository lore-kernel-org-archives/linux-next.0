From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs tree build failures
Date: Mon, 6 Apr 2009 16:29:05 +1000
Message-ID: <20090406162905.7d2d7037.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55439 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753486AbZDFG3L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2009 02:29:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>

Hi Trond,

Today's linux-next build (powerpc ppc44x_config) failed like this:

fs/nfs/client.c: In function 'nfs_match_client':
fs/nfs/client.c:444: error: 'struct nfs_client' has no member named 'cl_minorversion'

Caused by commit 10d5a514705f0687cfbb6a080c3562b857e340fe ("nfs41: Use
mount minorversion option").  The existence of cl_minorversion is
controlled by CONFIG_NFS_V4 but the reference is not.

I added the small patch below for today.

The same build gets this warning as well:

fs/nfs/client.c:554: warning: 'nfs4_session_set_rwsize' defined but not used

and then fails like this:

fs/built-in.o: In function `nfs_readpage_result_full':
read.c:(.text+0x70d24): undefined reference to `nfs4_restart_rpc'
fs/built-in.o: In function `nfs_readpage_result_partial':
read.c:(.text+0x70e3c): undefined reference to `nfs4_restart_rpc'
fs/built-in.o: In function `nfs_async_unlink_done':
unlink.c:(.text+0x71af0): undefined reference to `nfs4_restart_rpc'
fs/built-in.o: In function `nfs_writeback_done':
(.text+0x72c00): undefined reference to `nfs4_restart_rpc'

Caused by commit c105a9f16f11aaa9fcb9f75f8342b89c5d9665cf ("nfs41: use
rpc prepare call state for session reset") which I have reverted for
today.

Trond, is all this NFS v4.1 stuff that turned up yesterday really 2.6.30
material?  If not, it should be removed from linux-next until after
2.6.30-rc1 is released.  (and clearly better tested ...)

Bruce, I guess the same question applies to the nfsd tree as well.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Apr 2009 15:45:06 +1000
Subject: [PATCH] nfs: build fix for client.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/nfs/client.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index 82ddca9..75329d3 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -440,9 +440,11 @@ static struct nfs_client *nfs_match_client(const struct nfs_client_initdata *dat
 
 		if (clp->cl_proto != data->proto)
 			continue;
+#ifdef CONFIG_NFS_V4
 		/* Match nfsv4 minorversion */
 		if (clp->cl_minorversion != data->minorversion)
 			continue;
+#endif
 		/* Match the full socket address */
 		if (!nfs_sockaddr_cmp(sap, clap))
 			continue;
-- 
1.6.2.1
