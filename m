From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the vfs tree
Date: Fri, 16 Dec 2016 13:09:08 +1100
Message-ID: <20161216130908.0b9a9b8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36233 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751710AbcLPCLP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Dec 2016 21:11:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in:

  fs/logfs/logfs.h

between commit:

  6b4fbde3b979 ("logfs: remove from tree")

from the vfs tree and commit:

  378d5a40fa2c ("fs/logfs: drop __CHECK_ENDIAN__")

from the vhost tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
