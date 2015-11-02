From: Matias Bjorling <m@bjorling.me>
Subject: Re: linux-next: Tree for Nov 1 (lightnvm)
Date: Mon, 2 Nov 2015 23:34:37 +0100
Message-ID: <5637E4FD.403@bjorling.me>
References: <20151102035340.17310681@canb.auug.org.au>
 <5636B979.9010507@infradead.org> <56375A8B.9090006@bjorling.me>
 <56378327.4020500@fb.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000403060404080602020708"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34034 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbbKBWek (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 17:34:40 -0500
Received: by padec8 with SMTP id ec8so51901065pad.1
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2015 14:34:39 -0800 (PST)
In-Reply-To: <56378327.4020500@fb.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@fb.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000403060404080602020708
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/02/2015 04:37 PM, Jens Axboe wrote:
> On 11/02/2015 05:43 AM, Matias Bjorling wrote:
>> On 11/02/2015 02:16 AM, Randy Dunlap wrote:
>>> On 11/01/15 08:53, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> I start again a day early, and this is how you all repay me? ;-)
>>>>
>>>> Changes since 20151022:
>>>>
>>>
>>> on i386:
>>>
>>> ../include/linux/lightnvm.h:143:4: error: width of 'resved' exceeds
>>> its type
>>>
>>> # CONFIG_LBDAF is not set
>>>
>>>
>>
>> Thanks Randy.
>>
>> Jens, how would you like to receive the patch? (I've currently attached
>> it in this mail)
> 
> If it really needs to be 64-bit regardless of LBDAF, just make it a u64
> instead of typedef'ing some new ppa_t that everybody would have to look up.
> 

Sure, patch attached.

--------------000403060404080602020708
Content-Type: text/x-patch;
 name="0001-lightnvm-refactor-phys-addrs-type-to-u64.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0001-lightnvm-refactor-phys-addrs-type-to-u64.patch"

>From a40f984025a73cf4bf3552513504ba60a7cb58a0 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>
Date: Mon, 2 Nov 2015 17:12:27 +0100
Subject: [PATCH] lightnvm: refactor phys addrs type to u64
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For cases where CONFIG_LBDAF is not set. The struct ppa_addr exceeds its
type on 32 bit architectures. ppa_addr requires a 64bit integer to hold
the generic ppa format. We therefore refactor it to u64 and
replaces the sector_t usages with u64 for physical addresses.

Signed-off-by: Matias Bjørling <m@bjorling.me>
---
 drivers/lightnvm/rrpc.c  | 17 ++++++++---------
 drivers/lightnvm/rrpc.h  |  6 +++---
 include/linux/lightnvm.h | 28 ++++++++++++++--------------
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/lightnvm/rrpc.c b/drivers/lightnvm/rrpc.c
index 22fcd62..64a888a 100644
--- a/drivers/lightnvm/rrpc.c
+++ b/drivers/lightnvm/rrpc.c
@@ -116,15 +116,14 @@ static int block_is_full(struct rrpc *rrpc, struct rrpc_block *rblk)
 	return (rblk->next_page == rrpc->dev->pgs_per_blk);
 }
 
-static sector_t block_to_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
+static u64 block_to_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
 {
 	struct nvm_block *blk = rblk->parent;
 
 	return blk->id * rrpc->dev->pgs_per_blk;
 }
 
-static struct ppa_addr rrpc_ppa_to_gaddr(struct nvm_dev *dev,
-								sector_t addr)
+static struct ppa_addr rrpc_ppa_to_gaddr(struct nvm_dev *dev, u64 addr)
 {
 	struct ppa_addr paddr;
 
@@ -231,7 +230,7 @@ static int rrpc_move_valid_pages(struct rrpc *rrpc, struct rrpc_block *rblk)
 	struct page *page;
 	int slot;
 	int nr_pgs_per_blk = rrpc->dev->pgs_per_blk;
-	sector_t phys_addr;
+	u64 phys_addr;
 	DECLARE_COMPLETION_ONSTACK(wait);
 
 	if (bitmap_full(rblk->invalid_pages, nr_pgs_per_blk))
@@ -464,7 +463,7 @@ static struct rrpc_lun *rrpc_get_lun_rr(struct rrpc *rrpc, int is_gc)
 }
 
 static struct rrpc_addr *rrpc_update_map(struct rrpc *rrpc, sector_t laddr,
-					struct rrpc_block *rblk, sector_t paddr)
+					struct rrpc_block *rblk, u64 paddr)
 {
 	struct rrpc_addr *gp;
 	struct rrpc_rev_addr *rev;
@@ -486,9 +485,9 @@ static struct rrpc_addr *rrpc_update_map(struct rrpc *rrpc, sector_t laddr,
 	return gp;
 }
 
-static sector_t rrpc_alloc_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
+static u64 rrpc_alloc_addr(struct rrpc *rrpc, struct rrpc_block *rblk)
 {
-	sector_t addr = ADDR_EMPTY;
+	u64 addr = ADDR_EMPTY;
 
 	spin_lock(&rblk->lock);
 	if (block_is_full(rrpc, rblk))
@@ -516,7 +515,7 @@ static struct rrpc_addr *rrpc_map_page(struct rrpc *rrpc, sector_t laddr,
 	struct rrpc_lun *rlun;
 	struct rrpc_block *rblk;
 	struct nvm_lun *lun;
-	sector_t paddr;
+	u64 paddr;
 
 	rlun = rrpc_get_lun_rr(rrpc, is_gc);
 	lun = rlun->parent;
@@ -1144,7 +1143,7 @@ static void rrpc_block_map_update(struct rrpc *rrpc, struct rrpc_block *rblk)
 	struct nvm_dev *dev = rrpc->dev;
 	int offset;
 	struct rrpc_addr *laddr;
-	sector_t paddr, pladdr;
+	u64 paddr, pladdr;
 
 	for (offset = 0; offset < dev->pgs_per_blk; offset++) {
 		paddr = block_to_addr(rrpc, rblk) + offset;
diff --git a/drivers/lightnvm/rrpc.h b/drivers/lightnvm/rrpc.h
index b5df08d..a9696a0 100644
--- a/drivers/lightnvm/rrpc.h
+++ b/drivers/lightnvm/rrpc.h
@@ -86,7 +86,7 @@ struct rrpc {
 	struct nvm_dev *dev;
 	struct gendisk *disk;
 
-	sector_t poffset; /* physical page offset */
+	u64 poffset; /* physical page offset */
 	int lun_offset;
 
 	int nr_luns;
@@ -136,13 +136,13 @@ struct rrpc_block_gc {
 
 /* Logical to physical mapping */
 struct rrpc_addr {
-	sector_t addr;
+	u64 addr;
 	struct rrpc_block *rblk;
 };
 
 /* Physical to logical mapping */
 struct rrpc_rev_addr {
-	sector_t addr;
+	u64 addr;
 };
 
 static inline sector_t rrpc_get_laddr(struct bio *bio)
diff --git a/include/linux/lightnvm.h b/include/linux/lightnvm.h
index 122b176..5ebd70d 100644
--- a/include/linux/lightnvm.h
+++ b/include/linux/lightnvm.h
@@ -134,26 +134,26 @@ struct ppa_addr {
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
+			u64 ch		: 4;
+			u64 sec		: 2; /* 4 sectors per page */
+			u64 pl		: 2; /* 4 planes per LUN */
+			u64 lun		: 2; /* 4 LUNs per channel */
+			u64 pg		: 8; /* 256 pages per block */
+			u64 blk		: 10;/* 1024 blocks per plane */
+			u64 resved		: 36;
 		} chnl;
 
 		/* Generic structure for all addresses */
 		struct {
-			sector_t sec		: NVM_SEC_BITS;
-			sector_t pl		: NVM_PL_BITS;
-			sector_t pg		: NVM_PG_BITS;
-			sector_t blk		: NVM_BLK_BITS;
-			sector_t lun		: NVM_LUN_BITS;
-			sector_t ch		: NVM_CH_BITS;
+			u64 sec		: NVM_SEC_BITS;
+			u64 pl		: NVM_PL_BITS;
+			u64 pg		: NVM_PG_BITS;
+			u64 blk		: NVM_BLK_BITS;
+			u64 lun		: NVM_LUN_BITS;
+			u64 ch		: NVM_CH_BITS;
 		} g;
 
-		sector_t ppa;
+		u64 ppa;
 	};
 } __packed;
 
-- 
2.1.4


--------------000403060404080602020708--
