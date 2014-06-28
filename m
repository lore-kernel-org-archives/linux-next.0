From: Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 0/4] DRBG: Fixes for sparse tool reports
Date: Sat, 28 Jun 2014 21:57:49 +0200
Message-ID: <4927386.WYHrRe3NJm@myon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kbuild test robot <fengguang.wu@intel.com>, kbuild@01.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-crypto@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

The following patches cover requested changes based on the sparse tool test
run and suggestions by peer reviewers.

In addition, a patch to make the CTR DRBG more efficient is added.

Stephan Mueller (4):
  DRBG: use of kernel linked list
  DRBG: cleanup of preprocessor macros
  DRBG: Fix format string for debugging statements
  DRBG: Call CTR DRBG DF function only once

 crypto/drbg.c         | 302 ++++++++++++++++++++++++++++----------------------
 include/crypto/drbg.h |   7 +-
 2 files changed, 174 insertions(+), 135 deletions(-)

-- 
1.9.3
