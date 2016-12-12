From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 12 Dec 2016 16:49:51 +1100
Message-ID: <20161212164951.703f26d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49359 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750780AbcLLFty (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Dec 2016 00:49:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox <mawilcox@microsoft.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  lib/radix-tree.c

between commit:

  2b41226b39b6 ("Revert "radix tree test suite: fix compilation"")

from Linus' tree and patch:

  "reimplement IDR and IDA using the radix tree"

from the akpm tree.

I fixed it up (I added back the include of notifier.h) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
