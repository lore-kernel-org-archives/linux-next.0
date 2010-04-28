From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the v9fs tree
Date: Wed, 28 Apr 2010 13:24:13 +1000
Message-ID: <20100428132413.28bc9ff2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43695 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751371Ab0D1DYQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Apr 2010 23:24:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sripathi Kodi <sripathik@in.ibm.com>, Eric Van Hensbergen <ericvh@gmail.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
fs/9p/vfs_super.c between commit 0b2d973241f9bdbc8ed62caec42543e00ae6bd1e
("9p: VFS switches for 9p2000.L: VFS switches") from the v9fs tree and
commit 0ed07ddb56d1348e5ce33f3b8de20d730351983a ("9p: add bdi backing to
mount session") from the block tree.

Just context changes.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/9p/vfs_super.c
index 7c94cb0,806da5d..0000000
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@@ -77,10 -76,8 +77,11 @@@ v9fs_fill_super(struct super_block *sb
  	sb->s_blocksize_bits = fls(v9ses->maxdata - 1);
  	sb->s_blocksize = 1 << sb->s_blocksize_bits;
  	sb->s_magic = V9FS_MAGIC;
 -	sb->s_op = &v9fs_super_ops;
 +	if (v9fs_proto_dotl(v9ses))
 +		sb->s_op = &v9fs_super_ops_dotl;
 +	else
 +		sb->s_op = &v9fs_super_ops;
+ 	sb->s_bdi = &v9ses->bdi;
  
  	sb->s_flags = flags | MS_ACTIVE | MS_SYNCHRONOUS | MS_DIRSYNC |
  	    MS_NOATIME;
