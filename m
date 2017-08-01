From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the wberr tree
Date: Tue, 1 Aug 2017 15:46:34 +1000
Message-ID: <20170801154634.0a01acdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750914AbdHAFqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 01:46:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/fs.h

between commit:

  9dcc0577f2a4 ("mm: remove optimizations based on i_size in mapping writeback waits")

from the wberr tree and patch:

  "mm: remove optimizations based on i_size in mapping writeback waits"

from the akpm tree.

I fixed it up (I just dropped the akpm tree patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
