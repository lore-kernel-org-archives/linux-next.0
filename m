From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 6/6] nfs41: fix encode_destroy_session's xdr Xcoding pointer type
Date: Thu,  7 May 2009 19:01:02 +0300
Message-ID: <1241712062-30521-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:10613 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1759397AbZEGQBK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:01:10 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

should point to __be32, not uint32_t.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index e4c0209..617273e 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -1628,7 +1628,7 @@ static void encode_destroy_session(struct xdr_stream *xdr,
 				   struct nfs4_session *session,
 				   struct compound_hdr *hdr)
 {
-	uint32_t *p;
+	__be32 *p;
 	RESERVE_SPACE(4 + NFS4_MAX_SESSIONID_LEN);
 	WRITE32(OP_DESTROY_SESSION);
 	WRITEMEM(session->sess_id.data, NFS4_MAX_SESSIONID_LEN);
-- 
1.6.2.1
