From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the crypto tree
Date: Mon, 22 Feb 2016 14:55:25 +1100
Message-ID: <20160222145525.3d32f803@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34677 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752526AbcBVDz0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Feb 2016 22:55:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Drokin <green@linuxhacker.ru>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c

between commit:

  6dae10001e84 ("staging: lustre: Use ahash")

from the crypto tree and commit:

  15d9f5201fc3 ("staging/lustre/libcfs: Adjust NULL comparison codestyle")
  3e1f3db1b29b ("staging/lustre: Remove space after cast in cfs_crypto_hash_final()")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
index 94c01aad844b,ec758019bad6..000000000000
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-crypto.c
@@@ -76,10 -69,10 +76,10 @@@ static int cfs_crypto_hash_alloc(unsign
  	 * Skip this function for digest, because we use shash logic at
  	 * cfs_crypto_hash_alloc.
  	 */
- 	if (key != NULL)
+ 	if (key)
 -		err = crypto_hash_setkey(desc->tfm, key, key_len);
 +		err = crypto_ahash_setkey(tfm, key, key_len);
  	else if ((*type)->cht_key != 0)
 -		err = crypto_hash_setkey(desc->tfm,
 +		err = crypto_ahash_setkey(tfm,
  					 (unsigned char *)&((*type)->cht_key),
  					 (*type)->cht_size);
  
@@@ -110,17 -99,16 +110,17 @@@ int cfs_crypto_hash_digest(unsigned cha
  	int			err;
  	const struct cfs_crypto_hash_type	*type;
  
- 	if (buf == NULL || buf_len == 0 || hash_len == NULL)
+ 	if (!buf || buf_len == 0 || !hash_len)
  		return -EINVAL;
  
 -	err = cfs_crypto_hash_alloc(alg_id, &type, &hdesc, key, key_len);
 +	err = cfs_crypto_hash_alloc(alg_id, &type, &req, key, key_len);
  	if (err != 0)
  		return err;
  
- 	if (hash == NULL || *hash_len < type->cht_size) {
+ 	if (!hash || *hash_len < type->cht_size) {
  		*hash_len = type->cht_size;
 -		crypto_free_hash(hdesc.tfm);
 +		crypto_free_ahash(crypto_ahash_reqtfm(req));
 +		ahash_request_free(req);
  		return -ENOSPC;
  	}
  	sg_init_one(&sl, buf, buf_len);
@@@ -183,15 -172,14 +183,15 @@@ int cfs_crypto_hash_final(struct cfs_cr
  			  unsigned char *hash, unsigned int *hash_len)
  {
  	int     err;
 -	int     size = crypto_hash_digestsize(((struct hash_desc *)hdesc)->tfm);
 +	struct ahash_request *req = (void *)hdesc;
 +	int size = crypto_ahash_digestsize(crypto_ahash_reqtfm(req));
  
- 	if (hash_len == NULL) {
+ 	if (!hash_len) {
 -		crypto_free_hash(((struct hash_desc *)hdesc)->tfm);
 -		kfree(hdesc);
 +		crypto_free_ahash(crypto_ahash_reqtfm(req));
 +		ahash_request_free(req);
  		return 0;
  	}
- 	if (hash == NULL || *hash_len < size) {
+ 	if (!hash || *hash_len < size) {
  		*hash_len = size;
  		return -ENOSPC;
  	}
