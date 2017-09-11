From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the aio tree with the vfs tree
Date: Mon, 11 Sep 2017 11:29:13 +1000
Message-ID: <20170911112913.4b24f40f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59331 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751894AbdIKB3P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Sep 2017 21:29:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>

Hi Benjamin,

Today's linux-next merge of the aio tree got a conflict in:

  fs/aio.c

between commit:

  32ec9f249d65 ("io_getevents: Use timespec64 to represent timeouts")

from the vfs tree and commit:

  eb5263749f68 ("aio: handle integer overflow in io_getevents() timespec usage")

from the aio tree.

I fixed it up (I just dropped the change in the latter commit) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
