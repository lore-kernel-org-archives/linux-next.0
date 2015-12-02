From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 2 Dec 2015 14:27:40 -0700
Message-ID: <565F624C.9090301@kernel.dk>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
 <20151202211400.GB31364@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090104070608000009080408"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:33629 "EHLO
	mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561AbbLBV1o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 16:27:44 -0500
Received: by pfnn128 with SMTP id n128so1891422pfn.0
        for <linux-next@vger.kernel.org>; Wed, 02 Dec 2015 13:27:43 -0800 (PST)
In-Reply-To: <20151202211400.GB31364@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Keith Busch <keith.busch@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

This is a multi-part message in MIME format.
--------------090104070608000009080408
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2015 02:14 PM, Keith Busch wrote:
> On Wed, Dec 02, 2015 at 02:07:34PM -0700, Jens Axboe wrote:
>> Christoph, for-4.5/nvme also fails if integrity isn't enabled:
>
> I forgot about this since I've merged this in my repo to fix:
>
> https://lkml.org/lkml/2015/10/26/546
>
> That ok, or should we handle this differently?

I think that should make it compile, but the behavior will be a bit odd. 
If you pass in meta and integrity isn't enabled, you'll get an ENOMEM 
error. That seems a bit nonsensical.

We could make bio_integrity_alloc() return an error pointer. That way we 
could retain the ifdefs in the bip code, and not let it spread to drivers.

-- 
Jens Axboe


--------------090104070608000009080408
Content-Type: text/x-patch;
 name="int-err.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="int-err.patch"

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index f6325d573c10..e6ba501eb746 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -66,7 +66,7 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
 	}
 
 	if (unlikely(!bip))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	memset(bip, 0, sizeof(*bip));
 
@@ -89,7 +89,7 @@ struct bio_integrity_payload *bio_integrity_alloc(struct bio *bio,
 	return bip;
 err:
 	mempool_free(bip, bs->bio_integrity_pool);
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 EXPORT_SYMBOL(bio_integrity_alloc);
 
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c61bde9921d2..f9c4e80c2441 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -190,8 +190,8 @@ int __nvme_submit_user_cmd(struct request_queue *q, struct nvme_command *cmd,
 			}
 
 			bip = bio_integrity_alloc(bio, GFP_KERNEL, 1);
-			if (!bip) {
-				ret = -ENOMEM;
+			if (IS_ERR(bip)) {
+				ret = PTR_ERR(bip);
 				goto out_free_meta;
 			}
 
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index f29c69120054..d5891b6ea737 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -613,9 +613,9 @@ iblock_alloc_bip(struct se_cmd *cmd, struct bio *bio)
 	}
 
 	bip = bio_integrity_alloc(bio, GFP_NOIO, cmd->t_prot_nents);
-	if (!bip) {
+	if (IS_ERR(bip)) {
 		pr_err("Unable to allocate bio_integrity_payload\n");
-		return -ENOMEM;
+		return PTR_ERR(bip);
 	}
 
 	bip->bip_iter.bi_size = (cmd->data_length / dev->dev_attrib.block_size) *
diff --git a/include/linux/bio.h b/include/linux/bio.h
index b9b6e046b52e..5349e6816cbb 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -318,16 +318,6 @@ enum bip_flags {
 	BIP_IP_CHECKSUM		= 1 << 4, /* IP checksum */
 };
 
-#if defined(CONFIG_BLK_DEV_INTEGRITY)
-
-static inline struct bio_integrity_payload *bio_integrity(struct bio *bio)
-{
-	if (bio->bi_rw & REQ_INTEGRITY)
-		return bio->bi_integrity;
-
-	return NULL;
-}
-
 /*
  * bio integrity payload
  */
@@ -349,6 +339,16 @@ struct bio_integrity_payload {
 	struct bio_vec		bip_inline_vecs[0];/* embedded bvec array */
 };
 
+#if defined(CONFIG_BLK_DEV_INTEGRITY)
+
+static inline struct bio_integrity_payload *bio_integrity(struct bio *bio)
+{
+	if (bio->bi_rw & REQ_INTEGRITY)
+		return bio->bi_integrity;
+
+	return NULL;
+}
+
 static inline bool bio_integrity_flagged(struct bio *bio, enum bip_flags flag)
 {
 	struct bio_integrity_payload *bip = bio_integrity(bio);
@@ -795,6 +795,18 @@ static inline bool bio_integrity_flagged(struct bio *bio, enum bip_flags flag)
 	return false;
 }
 
+static inline void *bio_integrity_alloc(struct bio * bio, gfp_t gfp,
+								unsigned int nr)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline int bio_integrity_add_page(struct bio *bio, struct page *page,
+					unsigned int len, unsigned int offset)
+{
+	return 0;
+}
+
 #endif /* CONFIG_BLK_DEV_INTEGRITY */
 
 #endif /* CONFIG_BLOCK */

--------------090104070608000009080408--
