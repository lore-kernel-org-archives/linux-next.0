From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH -next] ext4: get rid of compile warning
Date: Mon, 20 Feb 2012 13:56:55 +0100
Message-ID: <20120220125655.GA2651@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:36666 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab2BTM5A (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2012 07:57:00 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Mon, 20 Feb 2012 12:56:58 -0000
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com [9.149.37.251])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q1KCuuNi2236568
	for <linux-next@vger.kernel.org>; Mon, 20 Feb 2012 12:56:56 GMT
Received: from d06av10.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q1JMqgLE010144
	for <linux-next@vger.kernel.org>; Sun, 19 Feb 2012 17:52:43 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org

Get rid of this one:

fs/ext4/balloc.c: In function 'ext4_wait_block_bitmap':
fs/ext4/balloc.c:405:3: warning: format '%llu' expects argument of
  type 'long long unsigned int', but argument 6 has type 'sector_t' [-Wformat]

Happens because sector_t is u64 (unsigned long long) or unsigned long
dependent on CONFIG_64BIT.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 fs/ext4/balloc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
index 95c87ab..c355890 100644
--- a/fs/ext4/balloc.c
+++ b/fs/ext4/balloc.c
@@ -404,7 +404,7 @@ int ext4_wait_block_bitmap(struct super_block *sb, ext4_group_t block_group,
 	if (!buffer_uptodate(bh)) {
 		ext4_error(sb, "Cannot read block bitmap - "
 			   "block_group = %u, block_bitmap = %llu",
-			   block_group, bh->b_blocknr);
+			   block_group, (unsigned long long) bh->b_blocknr);
 		return 1;
 	}
 	/* Panic or remount fs read-only if block bitmap is invalid */
-- 
1.7.9.1
