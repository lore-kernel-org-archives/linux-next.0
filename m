From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 4/6] nfs41: fix Xcode_create_session's xdr Xcoding pointer type
Date: Thu,  7 May 2009 19:00:45 +0300
Message-ID: <1241712045-30447-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:8921 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1759657AbZEGQAx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:00:53 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

should point to __be32, not uint32_t.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index d0fa05b..ea16df2 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -1566,7 +1566,7 @@ static void encode_create_session(struct xdr_stream *xdr,
 				  struct nfs41_create_session_args *args,
 				  struct compound_hdr *hdr)
 {
-	uint32_t *p;
+	__be32 *p;
 	char machine_name[NFS4_MAX_MACHINE_NAME_LEN];
 	uint32_t len;
 	struct nfs_client *clp = args->client;
@@ -4229,7 +4229,7 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 static int decode_create_session(struct xdr_stream *xdr,
 				 struct nfs41_create_session_res *res)
 {
-	uint32_t *p;
+	__be32 *p;
 	int status;
 	u32 nr_attrs;
 	struct nfs_client *clp = res->client;
-- 
1.6.2.1
