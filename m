From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 1/6] nfs41: Ignoring impid in decode_exchange_id is missing a READ_BUF
Date: Thu,  7 May 2009 19:00:25 +0300
Message-ID: <1241712025-30350-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:12793 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755195AbZEGQAb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:00:31 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

READ_BUF is required to adjust the xdr stream pointer.
This does not affect anybody right now since we're only sending
singleton EXCHANGE_IDs, but we must be good citizens and
do our part properly in any case :-)

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index 80af0ae..d682af4 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -4223,7 +4223,7 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 	/* Throw away Implementation id array */
 	READ_BUF(4);
 	READ32(dummy);
-	p += XDR_QUADLEN(dummy);
+	READ_BUF(dummy);
 
 	return 0;
 }
-- 
1.6.2.1
