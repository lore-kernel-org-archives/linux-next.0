From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: suspect commits in the vfs tree
Date: Thu, 12 May 2016 07:31:53 +1000
Message-ID: <20160512073153.4132026e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54012 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751391AbcEKVb5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 May 2016 17:31:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>

Hi Al,

I noticed these commits in today's vfs tree:

38b78a5f1858 ovl: ignore permissions on underlying lookup
3c9fe8cdff1b vfs: add lookup_hash() helper
9409e22acdfc vfs: rename: check backing inode being equal
54d5ca871e72 vfs: add vfs_select_inode() helper

They are all committed by you , but have no Signed-off-by from you.

These commits are also in the overlayfs tree (since that has been rebased
on top of them).

-- 
Cheers,
Stephen Rothwell
