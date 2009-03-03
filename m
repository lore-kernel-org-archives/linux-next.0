From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the ext4 tree with the  tree
Date: Tue, 3 Mar 2009 20:09:36 +0100
Message-ID: <20090303190936.GB432@duck.suse.cz>
References: <20090227130340.ad238eb8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:33192 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171AbZCCTJn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2009 14:09:43 -0500
Content-Disposition: inline
In-Reply-To: <20090227130340.ad238eb8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Theodore Tso <tytso@MIT.EDU>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Mingming Cao <cmm@us.ibm.com>

  Hi,

On Fri 27-02-09 13:03:40, Stephen Rothwell wrote:
> Today's linux-next merge of the ext4 tree got a conflict in
> fs/ext4/inode.c between commit ext4_da_update_reserve_space ("ext4: quota
> reservation for delayed allocation") from the quota tree and commit
> ext4_da_update_reserve_space ("ext4: Fix discard of inode prealloc space
> with delayed allocation") from the ext4 tree.
> 
> I think this is just overlapping additions.  I fixed it up by taking both
> changes (see below) but it is worth a look.
  Yes, they're just overlapping additions. Thanks for fixing this up.

									Honza

> diff --cc fs/ext4/inode.c
> index a2845b5,8815b9c..0000000
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@@ -1050,11 -1054,13 +1065,19 @@@ static void ext4_da_update_reserve_spac
>   	spin_unlock(&EXT4_I(inode)->i_block_reservation_lock);
>   
>   	/*
>  +	 * free those over-booking quota for metadata blocks
>  +	 */
>  +
>  +	if (mdb_free)
>  +		vfs_dq_release_reservation_block(inode, mdb_free);
> ++
> ++	/*
> + 	 * If have done all the pending block allocation and if the we
> + 	 * don't have any writer on the inode, we can discard the
> + 	 * inode's preallocations.
> + 	 */
> + 	if (!total && (atomic_read(&inode->i_writecount) == 0))
> + 		ext4_discard_preallocations(inode);
>   }
>   
>   /*
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
