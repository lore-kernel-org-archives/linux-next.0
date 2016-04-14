From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the leds tree with the nand tree
Date: Thu, 14 Apr 2016 12:41:07 +1000
Message-ID: <20160414124107.2eb8766e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: linux-next.vger.kernel.org

Hi Jacek,

Today's linux-next merge of the leds tree got a conflict in:

  drivers/mtd/mtdcore.c

between commit:

  a0cd7a2db851 ("mtd: add mtd_ooblayout_xxx() helper functions")

from the nand tree and commit:

  0c034fe37718 ("mtd: Uninline mtd_write_oob and move it to mtdcore.c")

from the leds tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/mtd/mtdcore.c
index cbfa5ad6e912,bee180bd11e7..000000000000
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@@ -997,366 -1003,19 +1003,379 @@@ int mtd_read_oob(struct mtd_info *mtd, 
  }
  EXPORT_SYMBOL_GPL(mtd_read_oob);
  
+ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
+ 				struct mtd_oob_ops *ops)
+ {
+ 	ops->retlen = ops->oobretlen = 0;
+ 	if (!mtd->_write_oob)
+ 		return -EOPNOTSUPP;
+ 	if (!(mtd->flags & MTD_WRITEABLE))
+ 		return -EROFS;
+ 	ledtrig_mtd_activity();
+ 	return mtd->_write_oob(mtd, to, ops);
+ }
+ EXPORT_SYMBOL_GPL(mtd_write_oob);
+ 
 +/**
 + * mtd_ooblayout_ecc - Get the OOB region definition of a specific ECC section
 + * @mtd: MTD device structure
 + * @section: ECC section. Depending on the layout you may have all the ECC
 + *	     bytes stored in a single contiguous section, or one section
 + *	     per ECC chunk (and sometime several sections for a single ECC
 + *	     ECC chunk)
 + * @oobecc: OOB region struct filled with the appropriate ECC position
 + *	    information
 + *
 + * This functions return ECC section information in the OOB area. I you want
 + * to get all the ECC bytes information, then you should call
 + * mtd_ooblayout_ecc(mtd, section++, oobecc) until it returns -ERANGE.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
 +		      struct mtd_oob_region *oobecc)
 +{
 +	memset(oobecc, 0, sizeof(*oobecc));
 +
 +	if (!mtd || section < 0)
 +		return -EINVAL;
 +
 +	if (!mtd->ooblayout || !mtd->ooblayout->ecc)
 +		return -ENOTSUPP;
 +
 +	return mtd->ooblayout->ecc(mtd, section, oobecc);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_ecc);
 +
 +/**
 + * mtd_ooblayout_free - Get the OOB region definition of a specific free
 + *			section
 + * @mtd: MTD device structure
 + * @section: Free section you are interested in. Depending on the layout
 + *	     you may have all the free bytes stored in a single contiguous
 + *	     section, or one section per ECC chunk plus an extra section
 + *	     for the remaining bytes (or other funky layout).
 + * @oobfree: OOB region struct filled with the appropriate free position
 + *	     information
 + *
 + * This functions return free bytes position in the OOB area. I you want
 + * to get all the free bytes information, then you should call
 + * mtd_ooblayout_free(mtd, section++, oobfree) until it returns -ERANGE.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_free(struct mtd_info *mtd, int section,
 +		       struct mtd_oob_region *oobfree)
 +{
 +	memset(oobfree, 0, sizeof(*oobfree));
 +
 +	if (!mtd || section < 0)
 +		return -EINVAL;
 +
 +	if (!mtd->ooblayout || !mtd->ooblayout->free)
 +		return -ENOTSUPP;
 +
 +	return mtd->ooblayout->free(mtd, section, oobfree);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_free);
 +
 +/**
 + * mtd_ooblayout_find_region - Find the region attached to a specific byte
 + * @mtd: mtd info structure
 + * @byte: the byte we are searching for
 + * @sectionp: pointer where the section id will be stored
 + * @oobregion: used to retrieve the ECC position
 + * @iter: iterator function. Should be either mtd_ooblayout_free or
 + *	  mtd_ooblayout_ecc depending on the region type you're searching for
 + *
 + * This functions returns the section id and oobregion information of a
 + * specific byte. For example, say you want to know where the 4th ECC byte is
 + * stored, you'll use:
 + *
 + * mtd_ooblayout_find_region(mtd, 3, &section, &oobregion, mtd_ooblayout_ecc);
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +static int mtd_ooblayout_find_region(struct mtd_info *mtd, int byte,
 +				int *sectionp, struct mtd_oob_region *oobregion,
 +				int (*iter)(struct mtd_info *,
 +					    int section,
 +					    struct mtd_oob_region *oobregion))
 +{
 +	int pos = 0, ret, section = 0;
 +
 +	memset(oobregion, 0, sizeof(*oobregion));
 +
 +	while (1) {
 +		ret = iter(mtd, section, oobregion);
 +		if (ret)
 +			return ret;
 +
 +		if (pos + oobregion->length > byte)
 +			break;
 +
 +		pos += oobregion->length;
 +		section++;
 +	}
 +
 +	/*
 +	 * Adjust region info to make it start at the beginning at the
 +	 * 'start' ECC byte.
 +	 */
 +	oobregion->offset += byte - pos;
 +	oobregion->length -= byte - pos;
 +	*sectionp = section;
 +
 +	return 0;
 +}
 +
 +/**
 + * mtd_ooblayout_find_eccregion - Find the ECC region attached to a specific
 + *				  ECC byte
 + * @mtd: mtd info structure
 + * @eccbyte: the byte we are searching for
 + * @sectionp: pointer where the section id will be stored
 + * @oobregion: OOB region information
 + *
 + * Works like mtd_ooblayout_find_region() except it searches for a specific ECC
 + * byte.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_find_eccregion(struct mtd_info *mtd, int eccbyte,
 +				 int *section,
 +				 struct mtd_oob_region *oobregion)
 +{
 +	return mtd_ooblayout_find_region(mtd, eccbyte, section, oobregion,
 +					 mtd_ooblayout_ecc);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_find_eccregion);
 +
 +/**
 + * mtd_ooblayout_get_bytes - Extract OOB bytes from the oob buffer
 + * @mtd: mtd info structure
 + * @buf: destination buffer to store OOB bytes
 + * @oobbuf: OOB buffer
 + * @start: first byte to retrieve
 + * @nbytes: number of bytes to retrieve
 + * @iter: section iterator
 + *
 + * Extract bytes attached to a specific category (ECC or free)
 + * from the OOB buffer and copy them into buf.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +static int mtd_ooblayout_get_bytes(struct mtd_info *mtd, u8 *buf,
 +				const u8 *oobbuf, int start, int nbytes,
 +				int (*iter)(struct mtd_info *,
 +					    int section,
 +					    struct mtd_oob_region *oobregion))
 +{
 +	struct mtd_oob_region oobregion = { };
 +	int section = 0, ret;
 +
 +	ret = mtd_ooblayout_find_region(mtd, start, &section,
 +					&oobregion, iter);
 +
 +	while (!ret) {
 +		int cnt;
 +
 +		cnt = oobregion.length > nbytes ? nbytes : oobregion.length;
 +		memcpy(buf, oobbuf + oobregion.offset, cnt);
 +		buf += cnt;
 +		nbytes -= cnt;
 +
 +		if (!nbytes)
 +			break;
 +
 +		ret = iter(mtd, ++section, &oobregion);
 +	}
 +
 +	return ret;
 +}
 +
 +/**
 + * mtd_ooblayout_set_bytes - put OOB bytes into the oob buffer
 + * @mtd: mtd info structure
 + * @buf: source buffer to get OOB bytes from
 + * @oobbuf: OOB buffer
 + * @start: first OOB byte to set
 + * @nbytes: number of OOB bytes to set
 + * @iter: section iterator
 + *
 + * Fill the OOB buffer with data provided in buf. The category (ECC or free)
 + * is selected by passing the appropriate iterator.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +static int mtd_ooblayout_set_bytes(struct mtd_info *mtd, const u8 *buf,
 +				u8 *oobbuf, int start, int nbytes,
 +				int (*iter)(struct mtd_info *,
 +					    int section,
 +					    struct mtd_oob_region *oobregion))
 +{
 +	struct mtd_oob_region oobregion = { };
 +	int section = 0, ret;
 +
 +	ret = mtd_ooblayout_find_region(mtd, start, &section,
 +					&oobregion, iter);
 +
 +	while (!ret) {
 +		int cnt;
 +
 +		cnt = oobregion.length > nbytes ? nbytes : oobregion.length;
 +		memcpy(oobbuf + oobregion.offset, buf, cnt);
 +		buf += cnt;
 +		nbytes -= cnt;
 +
 +		if (!nbytes)
 +			break;
 +
 +		ret = iter(mtd, ++section, &oobregion);
 +	}
 +
 +	return ret;
 +}
 +
 +/**
 + * mtd_ooblayout_count_bytes - count the number of bytes in a OOB category
 + * @mtd: mtd info structure
 + * @iter: category iterator
 + *
 + * Count the number of bytes in a given category.
 + *
 + * Returns a positive value on success, a negative error code otherwise.
 + */
 +static int mtd_ooblayout_count_bytes(struct mtd_info *mtd,
 +				int (*iter)(struct mtd_info *,
 +					    int section,
 +					    struct mtd_oob_region *oobregion))
 +{
 +	struct mtd_oob_region oobregion = { };
 +	int section = 0, ret, nbytes = 0;
 +
 +	while (1) {
 +		ret = iter(mtd, section++, &oobregion);
 +		if (ret) {
 +			if (ret == -ERANGE)
 +				ret = nbytes;
 +			break;
 +		}
 +
 +		nbytes += oobregion.length;
 +	}
 +
 +	return ret;
 +}
 +
 +/**
 + * mtd_ooblayout_get_eccbytes - extract ECC bytes from the oob buffer
 + * @mtd: mtd info structure
 + * @eccbuf: destination buffer to store ECC bytes
 + * @oobbuf: OOB buffer
 + * @start: first ECC byte to retrieve
 + * @nbytes: number of ECC bytes to retrieve
 + *
 + * Works like mtd_ooblayout_get_bytes(), except it acts on ECC bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_get_eccbytes(struct mtd_info *mtd, u8 *eccbuf,
 +			       const u8 *oobbuf, int start, int nbytes)
 +{
 +	return mtd_ooblayout_get_bytes(mtd, eccbuf, oobbuf, start, nbytes,
 +				       mtd_ooblayout_ecc);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_get_eccbytes);
 +
 +/**
 + * mtd_ooblayout_set_eccbytes - set ECC bytes into the oob buffer
 + * @mtd: mtd info structure
 + * @eccbuf: source buffer to get ECC bytes from
 + * @oobbuf: OOB buffer
 + * @start: first ECC byte to set
 + * @nbytes: number of ECC bytes to set
 + *
 + * Works like mtd_ooblayout_set_bytes(), except it acts on ECC bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_set_eccbytes(struct mtd_info *mtd, const u8 *eccbuf,
 +			       u8 *oobbuf, int start, int nbytes)
 +{
 +	return mtd_ooblayout_set_bytes(mtd, eccbuf, oobbuf, start, nbytes,
 +				       mtd_ooblayout_ecc);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_set_eccbytes);
 +
 +/**
 + * mtd_ooblayout_get_databytes - extract data bytes from the oob buffer
 + * @mtd: mtd info structure
 + * @databuf: destination buffer to store ECC bytes
 + * @oobbuf: OOB buffer
 + * @start: first ECC byte to retrieve
 + * @nbytes: number of ECC bytes to retrieve
 + *
 + * Works like mtd_ooblayout_get_bytes(), except it acts on free bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_get_databytes(struct mtd_info *mtd, u8 *databuf,
 +				const u8 *oobbuf, int start, int nbytes)
 +{
 +	return mtd_ooblayout_get_bytes(mtd, databuf, oobbuf, start, nbytes,
 +				       mtd_ooblayout_free);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_get_databytes);
 +
 +/**
 + * mtd_ooblayout_get_eccbytes - set data bytes into the oob buffer
 + * @mtd: mtd info structure
 + * @eccbuf: source buffer to get data bytes from
 + * @oobbuf: OOB buffer
 + * @start: first ECC byte to set
 + * @nbytes: number of ECC bytes to set
 + *
 + * Works like mtd_ooblayout_get_bytes(), except it acts on free bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_set_databytes(struct mtd_info *mtd, const u8 *databuf,
 +				u8 *oobbuf, int start, int nbytes)
 +{
 +	return mtd_ooblayout_set_bytes(mtd, databuf, oobbuf, start, nbytes,
 +				       mtd_ooblayout_free);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_set_databytes);
 +
 +/**
 + * mtd_ooblayout_count_freebytes - count the number of free bytes in OOB
 + * @mtd: mtd info structure
 + *
 + * Works like mtd_ooblayout_count_bytes(), except it count free bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_count_freebytes(struct mtd_info *mtd)
 +{
 +	return mtd_ooblayout_count_bytes(mtd, mtd_ooblayout_free);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_count_freebytes);
 +
 +/**
 + * mtd_ooblayout_count_freebytes - count the number of ECC bytes in OOB
 + * @mtd: mtd info structure
 + *
 + * Works like mtd_ooblayout_count_bytes(), except it count ECC bytes.
 + *
 + * Returns zero on success, a negative error code otherwise.
 + */
 +int mtd_ooblayout_count_eccbytes(struct mtd_info *mtd)
 +{
 +	return mtd_ooblayout_count_bytes(mtd, mtd_ooblayout_ecc);
 +}
 +EXPORT_SYMBOL_GPL(mtd_ooblayout_count_eccbytes);
 +
  /*
   * Method to access the protection register area, present in some flash
   * devices. The user data is one time programmable but the factory data is read
