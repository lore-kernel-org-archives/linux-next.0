From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 2 May 2016 02:31:03 +0100
Message-ID: <20160502013103.GL25498@ZenIV.linux.org.uk>
References: <20160502112527.095e2998@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39659 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbcEBBbI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 May 2016 21:31:08 -0400
Content-Disposition: inline
In-Reply-To: <20160502112527.095e2998@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhi Das <adas@redhat.com>

On Mon, May 02, 2016 at 11:25:27AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from include/linux/notifier.h:13:0,
>                  from include/linux/memory_hotplug.h:6,
>                  from include/linux/mmzone.h:744,
>                  from include/linux/gfp.h:5,
>                  from include/linux/slab.h:14,
>                  from fs/gfs2/file.c:10:
> fs/gfs2/file.c: In function 'gfs2_file_splice_read':
> fs/gfs2/file.c:963:19: error: 'struct inode' has no member named 'i_mutex'
>   mutex_lock(&inode->i_mutex);
>                    ^
> include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>                                             ^
> fs/gfs2/file.c:967:22: error: 'struct inode' has no member named 'i_mutex'
>    mutex_unlock(&inode->i_mutex);   
>                       ^
> fs/gfs2/file.c:972:21: error: 'struct inode' has no member named 'i_mutex'
>   mutex_unlock(&inode->i_mutex);
>                      ^
> 
> Caused by commit
> 
>   ad10a307a918 ("parallel lookups: actual switch to rwsem")
> 
> interacting with commit
> 
>   611526756a3d ("gfs2: Use gfs2 wrapper to sync inode before calling generic_file_splice_read()")
> 
> from the gfs2 tree.
> 
> I applied the following merge fix patch for today (thanks Al):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 May 2016 11:17:40 +1000
> Subject: [PATCH] gfs2: fix up for i_mutex -> i_rwsem change

FWIW, that should go into gfs2 tree - inode_lock()/inode_unlock() had been
there since the last cycle and they should've been used instead of direct
access to ->i_mutex.  So this fix will be valid in gfs2 branch.
