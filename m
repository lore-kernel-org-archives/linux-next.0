From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the net tree
Date: Fri, 19 Feb 2016 10:49:57 +1100
Message-ID: <20160219104957.0273c75a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Insu Yun <wuninsu@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  net/ipv4/tcp.c

between commit:

  1eea84b74cd2 ("tcp: correctly crypto_alloc_hash return check")

from the net tree and commit:

  cf80e0e47e0e ("tcp: Use ahash")

from the crypto tree.

I fixed it up (the latter removed the code fixed by the former) and can
carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
