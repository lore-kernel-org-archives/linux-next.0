From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the vfs tree
Date: Tue, 2 Jan 2018 17:46:08 +1100
Message-ID: <20180102174608.373e58df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750837AbeABGqK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jan 2018 01:46:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Giuseppe Scrivano <gscrivan@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  ipc/mqueue.c

between commits:

  3ec41d6c2257 ("tidy do_mq_open() up a bit")
  946086abeddf ("mqueue: switch to on-demand creation of internal mount")

from the vfs tree and patch:

  "ipc, mqueue: lazy call kern_mount_data in new namespaces"

from the akpm tree.

I fixed it up (I could not see how to fix this obviously, so I just
dropped the akpm tree patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
