From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Fri, 9 Sep 2016 13:11:05 +0200
Message-ID: <20160909111105.GR16983@suse.cz>
References: <20160907112253.3bd54c49@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160907112253.3bd54c49@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <jbacik@fb.com>, Jan Kara <jack@suse.cz>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 07, 2016 at 11:22:53AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> After merging the btrfs-kdave tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/ntfs/attrib.c: In function 'ntfs_attr_set':
> fs/ntfs/attrib.c:2549:35: error: implicit declaration of function 'inode_to_bdi' [-Werror=implicit-function-declaration]
>    balance_dirty_pages_ratelimited(inode_to_bdi(inode),
>                                    ^
> fs/ntfs/attrib.c:2549:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
> In file included from include/linux/memcontrol.h:30:0,
>                  from include/linux/swap.h:8,
>                  from fs/ntfs/attrib.c:26:
> include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
>  void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
>       ^
> fs/ntfs/attrib.c:2591:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
>    balance_dirty_pages_ratelimited(inode_to_bdi(inode),
>                                    ^
> In file included from include/linux/memcontrol.h:30:0,
>                  from include/linux/swap.h:8,
>                  from fs/ntfs/attrib.c:26:
> include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
>  void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
>       ^
> fs/ntfs/attrib.c:2609:35: warning: passing argument 1 of 'balance_dirty_pages_ratelimited' makes pointer from integer without a cast [-Wint-conversion]
>    balance_dirty_pages_ratelimited(inode_to_bdi(inode),
>                                    ^
> In file included from include/linux/memcontrol.h:30:0,
>                  from include/linux/swap.h:8,
>                  from fs/ntfs/attrib.c:26:
> include/linux/writeback.h:367:6: note: expected 'struct backing_dev_info *' but argument is of type 'int'
>  void balance_dirty_pages_ratelimited(struct backing_dev_info *bdi,
>       ^
> 
> Caused by commit
> 
>   a685fa61566d ("remove mapping from balance_dirty_pages*()")
> 
> I assume some forgotten include(s).

No, I picked a wrong version of the patchset. But the patchset should
not have been in for-next as it's a change to writeback (a prerequisity
for a btrfs patchset). Now removed.
