From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the crypto tree
Date: Tue, 18 Aug 2015 13:14:23 +1000
Message-ID: <20150818131423.7728ecc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  crypto/ccm.c

between commit:

  81c4c35eb61a ("crypto: ccm - Convert to new AEAD interface")

from the crypto tree and commit:

  c56f6d1270b9 ("crypto: replace scatterwalk_sg_chain with sg_chain")

from the block tree.

I fixed it up (the former removed all the calls to scatterwalk_sg_chain)
and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
