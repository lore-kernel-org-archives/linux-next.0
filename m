From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs tree
Date: Mon, 27 Jun 2016 10:58:39 +1000
Message-ID: <20160627105839.763d6d22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51350 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751556AbcF0A6n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Jun 2016 20:58:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Trond,

After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

fs/nfs/pnfs_nfs.c: In function 'pnfs_nfs_generic_sync':
fs/nfs/pnfs_nfs.c:947:8: error: too few arguments to function 'nfs_commit_inode'
  ret = nfs_commit_inode(inode);
        ^
In file included from fs/nfs/pnfs_nfs.c:10:0:
include/linux/nfs_fs.h:509:13: note: declared here
 extern int  nfs_commit_inode(struct inode *, int);
             ^

Caused by commit

  292cc573fce6 ("pNFS: Files and flexfiles always need to commit before layoutcommit")

I have used the nsf tree from next-20160624 for today

-- 
Cheers,
Stephen Rothwell
