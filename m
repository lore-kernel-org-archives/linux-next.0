From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the nfs tree
Date: Mon, 11 Jan 2016 12:16:28 +1100
Message-ID: <20160111121628.1e2597fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35738 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752434AbcAKBQa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jan 2016 20:16:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/nfs/nfs4file.c

between commit:

  926ea40a7ee2 ("NFSv4: Fix a compile warning about no prototype for nfs4_ioctl()")

from the nfs tree and commit:

  04b38d601239 ("vfs: pull btrfs clone API to vfs layer")

from the vfs tree.

I fixed it up (the latter removed the code fixed in the former) and can
carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
