From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the f2fs tree
Date: Mon, 22 Feb 2016 11:25:47 +1100
Message-ID: <20160222112547.0725e0d4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33723 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752417AbcBVAZt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Feb 2016 19:25:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  fs/crypto/fname.c
  fs/f2fs/crypto.c
  fs/f2fs/crypto_fname.c
  fs/f2fs/crypto_key.c
  fs/f2fs/f2fs_crypto.h

between commits:

  a72fe9cddb78 ("fs crypto: add fname.c to support filename encryption")
  ace7045bd954 ("f2fs crypto: migrate into vfs's crypto engine")

from the f2fs tree and commit:

  2731a944f651 ("f2fs: Use skcipher")

from the crypto tree.

I fixed it up (the f2fs tree deleted all the f2fs files and created
fs/crypto/fname.c so I did the same) and can carry the fix as necessary.

Someone should have a good look at these changes and try to come up with
a better solution.

-- 
Cheers,
Stephen Rothwell
