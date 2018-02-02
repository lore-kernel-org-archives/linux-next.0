From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the fscrypt tree
Date: Fri, 2 Feb 2018 14:17:36 +1100
Message-ID: <20180202141736.00f13fff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/crypto/hooks.c

between commit:

  0b1dfa4cc6c6 ("fscrypt: fix build with pre-4.6 gcc versions")

from the fscrypt tree and patch:

  "fs/crypto/hooks.c: fix build with gcc-4.4.4"

from the akpm tree.

I fixed it up (I just dropped the akpm tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
