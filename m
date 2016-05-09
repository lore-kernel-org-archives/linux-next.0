From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: manual merge of the f2fs tree with the ext4 tree
Date: Mon, 9 May 2016 10:15:03 -0700
Message-ID: <20160509171503.GA810@jaegeuk.gateway>
References: <20160509093646.68d7cf57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:47571 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751079AbcEIRPG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 May 2016 13:15:06 -0400
Content-Disposition: inline
In-Reply-To: <20160509093646.68d7cf57@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daeho Jeong <daeho.jeong@samsung.com>

Hi Stephen,

Thank you for the notice.
I've been waiting for a comment about the below patch targeted to v4.7 from Ted.
Meanwhile, I intended to prepare -next for that patch in advance.
Surely, once I get a sense that I need to consider v4.8, I'll drop this patch
for -next right away.

Thanks,

On Mon, May 09, 2016 at 09:36:46AM +1000, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> Today's linux-next merge of the f2fs tree got a conflict in:
> 
>   fs/ext4/ext4.h
> 
> between commit:
> 
>   c8585c6fcaf2 ("ext4: fix races between changing inode journal mode and ext4_writepages")
> 
> from the ext4 tree and commit:
> 
>   a618a2a1dda4 ("ext4 crypto: migrate into vfs's crypto engine")
> 
> from the f2fs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> P.S. I would expect to see a Reviewed-by or Acked-by from the ext4
> maintainer on that f2fs tree commit ...
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/ext4/ext4.h
> index ba5aecc07fbc,91b62e54ef51..000000000000
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@@ -32,8 -32,8 +32,9 @@@
>   #include <linux/percpu_counter.h>
>   #include <linux/ratelimit.h>
>   #include <crypto/hash.h>
> + #include <linux/fscrypto.h>
>   #include <linux/falloc.h>
>  +#include <linux/percpu-rwsem.h>
>   #ifdef __KERNEL__
>   #include <linux/compat.h>
>   #endif
> @@@ -1509,9 -1498,10 +1502,13 @@@ struct ext4_sb_info 
>   	struct ratelimit_state s_err_ratelimit_state;
>   	struct ratelimit_state s_warning_ratelimit_state;
>   	struct ratelimit_state s_msg_ratelimit_state;
>  +
>  +	/* Barrier between changing inodes' journal flags and writepages ops. */
>  +	struct percpu_rw_semaphore s_journal_flag_rwsem;
> + #ifdef CONFIG_EXT4_FS_ENCRYPTION
> + 	u8 key_prefix[EXT4_KEY_DESC_PREFIX_SIZE];
> + 	u8 key_prefix_size;
> + #endif
>   };
>   
>   static inline struct ext4_sb_info *EXT4_SB(struct super_block *sb)
