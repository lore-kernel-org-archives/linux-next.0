From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs tree
Date: Fri, 8 Jan 2016 11:14:27 +1100
Message-ID: <20160108111427.0b435d4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51256 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753000AbcAHAO3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jan 2016 19:14:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>

Hi Trond,

After merging the nfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

write.c:(.text+0xa60): multiple definition of `nfs_wait_atomic_killable'
fs/nfs/inode.o:inode.c:(.text+0x20a4): first defined here

Caused by commit

  fa5cca9f3334 ("NFS: Use wait_on_atomic_t() for unlock after readahead")

I have used the nfs tree from next-20160107 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
