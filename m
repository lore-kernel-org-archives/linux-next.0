From: Matias Bjorling <m@bjorling.me>
Subject: Re: linux-next: Tree for Nov 1 (lightnvm)
Date: Mon, 2 Nov 2015 13:43:55 +0100
Message-ID: <56375A8B.9090006@bjorling.me>
References: <20151102035340.17310681@canb.auug.org.au>
 <5636B979.9010507@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010905040500030508050006"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:35700 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbKBMn6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 07:43:58 -0500
Received: by pasz6 with SMTP id z6so148396470pas.2
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2015 04:43:57 -0800 (PST)
In-Reply-To: <5636B979.9010507@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@fb.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------010905040500030508050006
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/02/2015 02:16 AM, Randy Dunlap wrote:
> On 11/01/15 08:53, Stephen Rothwell wrote:
>> Hi all,
>>
>> I start again a day early, and this is how you all repay me? ;-)
>>
>> Changes since 20151022:
>>
> 
> on i386:
> 
> ../include/linux/lightnvm.h:143:4: error: width of 'resved' exceeds its type
> 
> # CONFIG_LBDAF is not set
> 
> 

Thanks Randy.

Jens, how would you like to receive the patch? (I've currently attached
it in this mail)

--------------010905040500030508050006
Content-Type: text/x-patch;
 name="0001-lightnvm-refactor-phys-addrs-type-to-ppa_t.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-lightnvm-refactor-phys-addrs-type-to-ppa_t.patch"

>From bc2462b86467be52711f74ab1cb6c5f75819e58d Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>
Date: Mon, 2 Nov 2015 05:42:38 +0100
Subject: [PATCH] lightnvm: refactor phys addrs type to ppa_t
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For cases where CONFIG_LBDAF is not set. The ppa_addr exceeds its type
on 32 bit architectures. ppa_addr requires a 64bit integer to hold the
generic ppa format. We therefore typedef ppa_t to u64 and replaces
the sector_t usages with ppa_t for physical addresses.

Signed-off-by: Matias Bjørling <m@bjorling.me>
---
 drivers/lightnvm/rrpc.c  | 17 ++++++++---------
 drivers/lightnvm/rrpc.h  |  6 +++---
 include/linux/lightnvm.h | 30 ++++++++++++++++--------------
 3 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/lightnvm/rrpc.c b/drivers/lightnvm/rrpc.c
index 22fcd62..66368c3 100644
--- a/drivers/lightnvm/rrpc.c
+++ b/drivers/lightnvm/rrpc.c
@@ -116,15 +116,14 @@ static int block_is_full(struct rrpc *rrpc, struct rrpc_block *rblk)
 	return (rblk->next_page == rrpc->dev->pgs_per_blk);
 }
 
-static sector_t block_to_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
+static ppa_t block_to_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
 {
 	struct nvm_block *blk = rblk->parent;
 
 	return blk->id * rrpc->dev->pgs_per_blk;
 }
 
-static struct ppa_addr rrpc_ppa_to_gaddr(struct nvm_dev *dev,
-								sector_t addr)
+static struct ppa_addr rrpc_ppa_to_gaddr(struct nvm_dev *dev, ppa_t addr)
 {
 	struct ppa_addr paddr;
 
@@ -231,7 +230,7 @@ static int rrpc_move_valid_pages(struct rrpc *rrpc, struct rrpc_block *rblk)
 	struct page *page;
 	int slot;
 	int nr_pgs_per_blk = rrpc->dev->pgs_per_blk;
-	sector_t phys_addr;
+	ppa_t phys_addr;
 	DECLARE_COMPLETION_ONSTACK(wait);
 
 	if (bitmap_full(rblk->invalid_pages, nr_pgs_per_blk))
@@ -464,7 +463,7 @@ static struct rrpc_lun *rrpc_get_lun_rr(struct rrpc *rrpc, int is_gc)
 }
 
 static struct rrpc_addr *rrpc_update_map(struct rrpc *rrpc, sector_t laddr,
-					struct rrpc_block *rblk, sector_t paddr)
+					struct rrpc_block *rblk, ppa_t paddr)
 {
 	struct rrpc_addr *gp;
 	struct rrpc_rev_addr *rev;
@@ -486,9 +485,9 @@ static struct rrpc_addr *rrpc_update_map(struct rrpc *rrpc, sector_t laddr,
 	return gp;
 }
 
-static sector_t rrpc_alloc_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
+static ppa_t rrpc_alloc_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
 {
-	sector_t addr = ADDR_EMPTY;
+	ppa_t addr = ADDR_EMPTY;
 
 	spin_lock(&rblk->lock);
 	if (block_is_full(rrpc, rblk))
@@ -516,7 +515,7 @@ static struct rrpc_addr *rrpc_map_page(struct rrpc *rrpc, sector_t laddr,
 	struct rrpc_lun *rlun;
 	struct rrpc_block *rblk;
 	struct nvm_lun *lun;
-	sector_t paddr;
+	ppa_t paddr;
 
 	rlun = rrpc_get_lun_rr(rrpc, is_gc);
 	lun = rlun->parent;
@@ -1144,7 +1143,7 @@ static void rrpc_block_map_update(struct rrpc *rrpc, struct rrpc_block *rblk)
 	struct nvm_dev *dev = rrpc->dev;
 	int offset;
 	struct rrpc_addr *laddr;
-	sector_t paddr, pladdr;
+	ppa_t paddr, pladdr;
 
 	for (offset = 0; offset < dev->pgs_per_blk; offset++) {
 		paddr = block_to_addr(rrpc, rblk) + offset;
diff --git a/drivers/lightnvm/rrpc.h b/drivers/lightnvm/rrpc.h
index b5df08d..c6f7c01 100644
--- a/drivers/lightnvm/rrpc.h
+++ b/drivers/lightnvm/rrpc.h
@@ -86,7 +86,7 @@ struct rrpc {
 	struct nvm_dev *dev;
 	struct gendisk *disk;
 
-	sector_t poffset; /* physical page offset */
+	ppa_t poffset; /* physical page offset */
 	int lun_offset;
 
 	int nr_luns;
@@ -136,13 +136,13 @@ struct rrpc_block_gc {
 
 /* Logical to physical mapping */
 struct rrpc_addr {
-	sector_t addr;
+	ppa_t addr;
 	struct rrpc_block *rblk;
 };
 
 /* Physical to logical mapping */
 struct rrpc_rev_addr {
-	sector_t addr;
+	ppa_t addr;
 };
 
 static inline sector_t rrpc_get_laddr(struct bio *bio)
diff --git a/include/linux/lightnvm.h b/include/linux/lightnvm.h
index 122b176..eac230d 100644
--- a/include/linux/lightnvm.h
+++ b/include/linux/lightnvm.h
@@ -117,6 +117,8 @@ struct nvm_tgt_instance {
 	struct nvm_tgt_type *tt;
 };
 
+typedef u64 ppa_t;
+
 #define ADDR_EMPTY (~0ULL)
 
 #define NVM_VERSION_MAJOR 1
@@ -134,26 +136,26 @@ struct ppa_addr {
 	union {
 		/* Channel-based PPA format in nand 4x2x2x2x8x10 */
 		struct {
-			sector_t ch		: 4;
-			sector_t sec		: 2; /* 4 sectors per page */
-			sector_t pl		: 2; /* 4 planes per LUN */
-			sector_t lun		: 2; /* 4 LUNs per channel */
-			sector_t pg		: 8; /* 256 pages per block */
-			sector_t blk		: 10;/* 1024 blocks per plane */
-			sector_t resved		: 36;
+			ppa_t ch		: 4;
+			ppa_t sec		: 2; /* 4 sectors per page */
+			ppa_t pl		: 2; /* 4 planes per LUN */
+			ppa_t lun		: 2; /* 4 LUNs per channel */
+			ppa_t pg		: 8; /* 256 pages per block */
+			ppa_t blk		: 10;/* 1024 blocks per plane */
+			ppa_t resved		: 36;
 		} chnl;
 
 		/* Generic structure for all addresses */
 		struct {
-			sector_t sec		: NVM_SEC_BITS;
-			sector_t pl		: NVM_PL_BITS;
-			sector_t pg		: NVM_PG_BITS;
-			sector_t blk		: NVM_BLK_BITS;
-			sector_t lun		: NVM_LUN_BITS;
-			sector_t ch		: NVM_CH_BITS;
+			ppa_t sec		: NVM_SEC_BITS;
+			ppa_t pl		: NVM_PL_BITS;
+			ppa_t pg		: NVM_PG_BITS;
+			ppa_t blk		: NVM_BLK_BITS;
+			ppa_t lun		: NVM_LUN_BITS;
+			ppa_t ch		: NVM_CH_BITS;
 		} g;
 
-		sector_t ppa;
+		ppa_t ppa;
 	};
 } __packed;
 
-- 
2.1.4


--------------010905040500030508050006--
