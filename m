From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 14 Mar 2016 10:24:17 +1100
Message-ID: <20160314102417.78e7f319@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58481 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752357AbcCMXYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 13 Mar 2016 19:24:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>, Trond Myklebust <trond.myklebust@primarydata.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/nfs/nfs4proc.c

between commit:

  d9dfd8d74168 ("NFSv4: Fix a dentry leak on alias use")

from Linus' tree and commit:

  7635e19a39f6 ("replace d_add_unique() with saner primitive")

from the vfs tree.

I fixed it up (I just used the vfs tree version - thanks for the heads
up) and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
