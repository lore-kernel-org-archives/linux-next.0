From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Date: Wed, 17 Jun 2015 13:21:45 +1000
Message-ID: <1434511305.24642.6.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46811 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752723AbbFQDVq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:21:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  drivers/crypto/vmx/aes.c
  drivers/crypto/vmx/aes_cbc.c
  drivers/crypto/vmx/ghash.c

between commit:

  4beb10604597 "crypto: vmx - Reindent to kernel style"

from the crypto tree and commit:

  5f76eea88dcb "sched/preempt, powerpc: Disable preemption in enable_kernel_altivec() explicitly"

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/crypto/vmx/aes.c
index 023e5f014783,a9064e36e7b5..000000000000
--- a/drivers/crypto/vmx/aes.c
+++ b/drivers/crypto/vmx/aes.c
@@@ -76,47 -73,53 +76,53 @@@ static void p8_aes_exit(struct crypto_t
  }
  
  static int p8_aes_setkey(struct crypto_tfm *tfm, const u8 *key,
 -    unsigned int keylen)
 +			 unsigned int keylen)
  {
 -    int ret;
 -    struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 -
 -    preempt_disable();
 -    pagefault_disable();
 -    enable_kernel_altivec();
 -    ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
 -    ret += aes_p8_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
 -    pagefault_enable();
 -    preempt_enable();
 -
 -    ret += crypto_cipher_setkey(ctx->fallback, key, keylen);
 -    return ret;
 +	int ret;
 +	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 +
++	preempt_disable();
 +	pagefault_disable();
 +	enable_kernel_altivec();
 +	ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
 +	ret += aes_p8_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
 +	pagefault_enable();
++	preempt_enable();
 +
 +	ret += crypto_cipher_setkey(ctx->fallback, key, keylen);
 +	return ret;
  }
  
  static void p8_aes_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
  {
 -    struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 -
 -    if (in_interrupt()) {
 -        crypto_cipher_encrypt_one(ctx->fallback, dst, src);
 -    } else {
 -	preempt_disable();
 -        pagefault_disable();
 -        enable_kernel_altivec();
 -        aes_p8_encrypt(src, dst, &ctx->enc_key);
 -        pagefault_enable();
 -	preempt_enable();
 -    }
 +	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 +
 +	if (in_interrupt()) {
 +		crypto_cipher_encrypt_one(ctx->fallback, dst, src);
 +	} else {
++		preempt_disable();
 +		pagefault_disable();
 +		enable_kernel_altivec();
 +		aes_p8_encrypt(src, dst, &ctx->enc_key);
 +		pagefault_enable();
++		preempt_enable();
 +	}
  }
  
  static void p8_aes_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
  {
 -    struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 -
 -    if (in_interrupt()) {
 -        crypto_cipher_decrypt_one(ctx->fallback, dst, src);
 -    } else {
 -	preempt_disable();
 -        pagefault_disable();
 -        enable_kernel_altivec();
 -        aes_p8_decrypt(src, dst, &ctx->dec_key);
 -        pagefault_enable();
 -	preempt_enable();
 -    }
 +	struct p8_aes_ctx *ctx = crypto_tfm_ctx(tfm);
 +
 +	if (in_interrupt()) {
 +		crypto_cipher_decrypt_one(ctx->fallback, dst, src);
 +	} else {
++		preempt_disable();
 +		pagefault_disable();
 +		enable_kernel_altivec();
 +		aes_p8_decrypt(src, dst, &ctx->dec_key);
 +		pagefault_enable();
++		preempt_enable();
 +	}
  }
  
  struct crypto_alg p8_aes_alg = {
diff --cc drivers/crypto/vmx/aes_cbc.c
index 7120ab24d8c6,477284abdd11..000000000000
--- a/drivers/crypto/vmx/aes_cbc.c
+++ b/drivers/crypto/vmx/aes_cbc.c
@@@ -77,95 -74,95 +77,101 @@@ static void p8_aes_cbc_exit(struct cryp
  }
  
  static int p8_aes_cbc_setkey(struct crypto_tfm *tfm, const u8 *key,
 -    unsigned int keylen)
 +			     unsigned int keylen)
  {
 -    int ret;
 -    struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(tfm);
 -
 -    preempt_disable();
 -    pagefault_disable();
 -    enable_kernel_altivec();
 -    ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
 -    ret += aes_p8_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
 -    pagefault_enable();
 -    preempt_enable();
 -
 -    ret += crypto_blkcipher_setkey(ctx->fallback, key, keylen);
 -    return ret;
 +	int ret;
 +	struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(tfm);
 +
++	preempt_disable();
 +	pagefault_disable();
 +	enable_kernel_altivec();
 +	ret = aes_p8_set_encrypt_key(key, keylen * 8, &ctx->enc_key);
 +	ret += aes_p8_set_decrypt_key(key, keylen * 8, &ctx->dec_key);
 +	pagefault_enable();
++	preempt_enable();
 +
 +	ret += crypto_blkcipher_setkey(ctx->fallback, key, keylen);
 +	return ret;
  }
  
  static int p8_aes_cbc_encrypt(struct blkcipher_desc *desc,
 -    struct scatterlist *dst, struct scatterlist *src,
 -    unsigned int nbytes)
 +			      struct scatterlist *dst,
 +			      struct scatterlist *src, unsigned int nbytes)
  {
 -    int ret;
 -    struct blkcipher_walk walk;
 -    struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(
 -            crypto_blkcipher_tfm(desc->tfm));
 -    struct blkcipher_desc fallback_desc = {
 -        .tfm = ctx->fallback,
 -        .info = desc->info,
 -        .flags = desc->flags
 -    };
 -
 -    if (in_interrupt()) {
 -        ret = crypto_blkcipher_encrypt(&fallback_desc, dst, src, nbytes);
 -    } else {
 -	preempt_disable();
 -        pagefault_disable();
 -        enable_kernel_altivec();
 -
 -	blkcipher_walk_init(&walk, dst, src, nbytes);
 -        ret = blkcipher_walk_virt(desc, &walk);
 -        while ((nbytes = walk.nbytes)) {
 -			aes_p8_cbc_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
 -				nbytes & AES_BLOCK_MASK, &ctx->enc_key, walk.iv, 1);
 +	int ret;
 +	struct blkcipher_walk walk;
 +	struct p8_aes_cbc_ctx *ctx =
 +		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
 +	struct blkcipher_desc fallback_desc = {
 +		.tfm = ctx->fallback,
 +		.info = desc->info,
 +		.flags = desc->flags
 +	};
 +
 +	if (in_interrupt()) {
 +		ret = crypto_blkcipher_encrypt(&fallback_desc, dst, src,
 +					       nbytes);
 +	} else {
++		preempt_disable();
 +		pagefault_disable();
 +		enable_kernel_altivec();
 +
 +		blkcipher_walk_init(&walk, dst, src, nbytes);
 +		ret = blkcipher_walk_virt(desc, &walk);
 +		while ((nbytes = walk.nbytes)) {
 +			aes_p8_cbc_encrypt(walk.src.virt.addr,
 +					   walk.dst.virt.addr,
 +					   nbytes & AES_BLOCK_MASK,
 +					   &ctx->enc_key, walk.iv, 1);
  			nbytes &= AES_BLOCK_SIZE - 1;
  			ret = blkcipher_walk_done(desc, &walk, nbytes);
 -	}
 +		}
  
 -        pagefault_enable();
 -	preempt_enable();
 -    }
 +		pagefault_enable();
++		preempt_enable();
 +	}
  
 -    return ret;
 +	return ret;
  }
  
  static int p8_aes_cbc_decrypt(struct blkcipher_desc *desc,
 -    struct scatterlist *dst, struct scatterlist *src,
 -    unsigned int nbytes)
 +			      struct scatterlist *dst,
 +			      struct scatterlist *src, unsigned int nbytes)
  {
 -    int ret;
 -    struct blkcipher_walk walk;
 -    struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(
 -            crypto_blkcipher_tfm(desc->tfm));
 -    struct blkcipher_desc fallback_desc = {
 -        .tfm = ctx->fallback,
 -        .info = desc->info,
 -        .flags = desc->flags
 -    };
 -
 -    if (in_interrupt()) {
 -        ret = crypto_blkcipher_decrypt(&fallback_desc, dst, src, nbytes);
 -    } else {
 -	preempt_disable();
 -        pagefault_disable();
 -        enable_kernel_altivec();
 -
 -	blkcipher_walk_init(&walk, dst, src, nbytes);
 -        ret = blkcipher_walk_virt(desc, &walk);
 -        while ((nbytes = walk.nbytes)) {
 -			aes_p8_cbc_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
 -				nbytes & AES_BLOCK_MASK, &ctx->dec_key, walk.iv, 0);
 +	int ret;
 +	struct blkcipher_walk walk;
 +	struct p8_aes_cbc_ctx *ctx =
 +		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
 +	struct blkcipher_desc fallback_desc = {
 +		.tfm = ctx->fallback,
 +		.info = desc->info,
 +		.flags = desc->flags
 +	};
 +
 +	if (in_interrupt()) {
 +		ret = crypto_blkcipher_decrypt(&fallback_desc, dst, src,
 +					       nbytes);
 +	} else {
++		preempt_disable();
 +		pagefault_disable();
 +		enable_kernel_altivec();
 +
 +		blkcipher_walk_init(&walk, dst, src, nbytes);
 +		ret = blkcipher_walk_virt(desc, &walk);
 +		while ((nbytes = walk.nbytes)) {
 +			aes_p8_cbc_encrypt(walk.src.virt.addr,
 +					   walk.dst.virt.addr,
 +					   nbytes & AES_BLOCK_MASK,
 +					   &ctx->dec_key, walk.iv, 0);
  			nbytes &= AES_BLOCK_SIZE - 1;
  			ret = blkcipher_walk_done(desc, &walk, nbytes);
  		}
  
 -        pagefault_enable();
 -	preempt_enable();
 -    }
 +		pagefault_enable();
++		preempt_enable();
 +	}
  
 -    return ret;
 +	return ret;
  }
  
  
diff --cc drivers/crypto/vmx/ghash.c
index 4c3a8f7e5059,f255ec4a04d4..000000000000
--- a/drivers/crypto/vmx/ghash.c
+++ b/drivers/crypto/vmx/ghash.c
@@@ -109,92 -107,98 +109,100 @@@ static int p8_ghash_init(struct shash_d
  }
  
  static int p8_ghash_setkey(struct crypto_shash *tfm, const u8 *key,
 -    unsigned int keylen)
 +			   unsigned int keylen)
  {
 -    struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(tfm));
 -
 -    if (keylen != GHASH_KEY_LEN)
 -        return -EINVAL;
 -
 -    preempt_disable();
 -    pagefault_disable();
 -    enable_kernel_altivec();
 -    enable_kernel_fp();
 -    gcm_init_p8(ctx->htable, (const u64 *) key);
 -    pagefault_enable();
 -    preempt_enable();
 -    return crypto_shash_setkey(ctx->fallback, key, keylen);
 +	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(tfm));
 +
 +	if (keylen != GHASH_KEY_LEN)
 +		return -EINVAL;
 +
++	preempt_disable();
 +	pagefault_disable();
 +	enable_kernel_altivec();
 +	enable_kernel_fp();
 +	gcm_init_p8(ctx->htable, (const u64 *) key);
 +	pagefault_enable();
++	preempt_enable();
 +	return crypto_shash_setkey(ctx->fallback, key, keylen);
  }
  
  static int p8_ghash_update(struct shash_desc *desc,
 -        const u8 *src, unsigned int srclen)
 +			   const u8 *src, unsigned int srclen)
  {
 -    unsigned int len;
 -    struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 -    struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 -
 -    if (IN_INTERRUPT) {
 -        return crypto_shash_update(&dctx->fallback_desc, src, srclen);
 -    } else {
 -        if (dctx->bytes) {
 -            if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
 -                memcpy(dctx->buffer + dctx->bytes, src, srclen);
 -                dctx->bytes += srclen;
 -                return 0;
 -            }
 -            memcpy(dctx->buffer + dctx->bytes, src,
 -                    GHASH_DIGEST_SIZE - dctx->bytes);
 -	    preempt_disable();
 -            pagefault_disable();
 -            enable_kernel_altivec();
 -            enable_kernel_fp();
 -            gcm_ghash_p8(dctx->shash, ctx->htable, dctx->buffer,
 -                    GHASH_DIGEST_SIZE);
 -            pagefault_enable();
 -	    preempt_enable();
 -            src += GHASH_DIGEST_SIZE - dctx->bytes;
 -            srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
 -            dctx->bytes = 0;
 -        }
 -        len = srclen & ~(GHASH_DIGEST_SIZE - 1);
 -        if (len) {
 -	    preempt_disable();
 -            pagefault_disable();
 -            enable_kernel_altivec();
 -            enable_kernel_fp();
 -            gcm_ghash_p8(dctx->shash, ctx->htable, src, len);
 -            pagefault_enable();
 -	    preempt_enable();
 -            src += len;
 -            srclen -= len;
 -        }
 -        if (srclen) {
 -            memcpy(dctx->buffer, src, srclen);
 -            dctx->bytes = srclen;
 -        }
 -        return 0;
 -    }
 +	unsigned int len;
 +	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 +	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 +
 +	if (IN_INTERRUPT) {
 +		return crypto_shash_update(&dctx->fallback_desc, src,
 +					   srclen);
 +	} else {
 +		if (dctx->bytes) {
 +			if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
 +				memcpy(dctx->buffer + dctx->bytes, src,
 +				       srclen);
 +				dctx->bytes += srclen;
 +				return 0;
 +			}
 +			memcpy(dctx->buffer + dctx->bytes, src,
 +			       GHASH_DIGEST_SIZE - dctx->bytes);
++			preempt_disable();
 +			pagefault_disable();
 +			enable_kernel_altivec();
 +			enable_kernel_fp();
 +			gcm_ghash_p8(dctx->shash, ctx->htable,
 +				     dctx->buffer, GHASH_DIGEST_SIZE);
 +			pagefault_enable();
++			preempt_enable();
 +			src += GHASH_DIGEST_SIZE - dctx->bytes;
 +			srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
 +			dctx->bytes = 0;
 +		}
 +		len = srclen & ~(GHASH_DIGEST_SIZE - 1);
 +		if (len) {
++			preempt_disable();
 +			pagefault_disable();
 +			enable_kernel_altivec();
 +			enable_kernel_fp();
 +			gcm_ghash_p8(dctx->shash, ctx->htable, src, len);
 +			pagefault_enable();
++			preempt_enable();
 +			src += len;
 +			srclen -= len;
 +		}
 +		if (srclen) {
 +			memcpy(dctx->buffer, src, srclen);
 +			dctx->bytes = srclen;
 +		}
 +		return 0;
 +	}
  }
  
  static int p8_ghash_final(struct shash_desc *desc, u8 *out)
  {
 -    int i;
 -    struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 -    struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 -
 -    if (IN_INTERRUPT) {
 -        return crypto_shash_final(&dctx->fallback_desc, out);
 -    } else {
 -        if (dctx->bytes) {
 -            for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
 -                dctx->buffer[i] = 0;
 -	    preempt_disable();
 -            pagefault_disable();
 -            enable_kernel_altivec();
 -            enable_kernel_fp();
 -            gcm_ghash_p8(dctx->shash, ctx->htable, dctx->buffer,
 -                    GHASH_DIGEST_SIZE);
 -            pagefault_enable();
 -	    preempt_enable();
 -            dctx->bytes = 0;
 -        }
 -        memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
 -        return 0;
 -    }
 +	int i;
 +	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
 +	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
 +
 +	if (IN_INTERRUPT) {
 +		return crypto_shash_final(&dctx->fallback_desc, out);
 +	} else {
 +		if (dctx->bytes) {
 +			for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
 +				dctx->buffer[i] = 0;
++			preempt_disable();
 +			pagefault_disable();
 +			enable_kernel_altivec();
 +			enable_kernel_fp();
 +			gcm_ghash_p8(dctx->shash, ctx->htable,
 +				     dctx->buffer, GHASH_DIGEST_SIZE);
 +			pagefault_enable();
++			preempt_enable();
 +			dctx->bytes = 0;
 +		}
 +		memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
 +		return 0;
 +	}
  }
  
  struct shash_alg p8_ghash_alg = {
