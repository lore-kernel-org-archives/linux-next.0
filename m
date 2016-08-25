From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Thu, 25 Aug 2016 11:38:24 +1000
Message-ID: <20160825113824.61ca7364@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

After merging the crypto tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

crypto/xor.c: In function 'calibrate_xor_blocks':
crypto/xor.c:156:1: warning: label 'out' defined but not used [-Wunused-label]
 out:
 ^

Introduced by commit

  39457acda913 ("crypto: xor - skip speed test if the xor function is selected automatically")

This build does not have XOR_SELECT_TEMPLATE set.

-- 
Cheers,
Stephen Rothwell
