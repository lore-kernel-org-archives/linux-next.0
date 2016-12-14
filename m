From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Date: Wed, 14 Dec 2016 14:42:36 +1100
Message-ID: <20161214144236.5053299e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Holmberg <hans@pixelmunchies.com>, Andreas Platschek <andreas.platschek@opentech.at>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Kconfig.debug

between commit:

  63d0977c0e85 ("lib/Kconfig.debug: correct documentation paths")

from the jc_docs tree and commit:

  2c81218d9f29 ("Kconfig: lib/Kconfig.debug: fix references to Documenation")

from the akpm-current tree.

I fixed it up (I just used the version from the jc_docs tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
