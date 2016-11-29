From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Tue, 29 Nov 2016 11:55:29 +1100
Message-ID: <20161129115529.41f9f0b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: "simd_skcipher_free" [arch/arm/crypto/aes-arm-ce.ko] undefined!
ERROR: "simd_skcipher_create_compat" [arch/arm/crypto/aes-arm-ce.ko] undefined!
ERROR: "simd_skcipher_free" [arch/arm/crypto/aes-arm-bs.ko] undefined!
ERROR: "simd_skcipher_create_compat" [arch/arm/crypto/aes-arm-bs.ko] undefined!

Caused by commits

  da40e7a4ba4d ("crypto: aes-ce - Convert to skcipher")
  211f41af534a ("crypto: aesbs - Convert to skcipher")

Missing dependencies?

I have used the crypto tree from next-20161128 for today.

-- 
Cheers,
Stephen Rothwell
