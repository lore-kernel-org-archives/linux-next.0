From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Wed, 17 Feb 2016 12:26:44 +1100
Message-ID: <20160217122644.6fce2c73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Mueller <smueller@chronox.de>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/crypto/aesbs-glue.c: In function 'aesbs_xts_set_key':
arch/arm/crypto/aesbs-glue.c:94:8: error: implicit declaration of function 'xts_check_key' [-Werror=implicit-function-declaration]
  err = xts_check_key(tfm, in_key, key_len);
        ^
arch/arm/crypto/aes-ce-glue.c: In function 'xts_set_key':
arch/arm/crypto/aes-ce-glue.c:155:8: error: implicit declaration of function 'xts_check_key' [-Werror=implicit-function-declaration]
  ret = xts_check_key(tfm, in_key, key_len);
        ^

Caused by commit

  28856a9e52c7 ("crypto: xts - consolidate sanity check for keys")

Presumably a missing include.

I have used the crypto tree from next-20160216 for today.

-- 
Cheers,
Stephen Rothwell
