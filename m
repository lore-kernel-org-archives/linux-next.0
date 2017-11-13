From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ext4 tree with the fscrypt tree
Date: Mon, 13 Nov 2017 16:56:21 +1100
Message-ID: <20171113165621.2ac80941@canb.auug.org.au>
References: <20171030144804.dkjusjfvl4cvlzoh@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751377AbdKMF4X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 00:56:23 -0500
In-Reply-To: <20171030144804.dkjusjfvl4cvlzoh@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@google.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 30 Oct 2017 14:48:04 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the ext4 tree got a conflict in:
> 
>   fs/ext4/inode.c
> 
> between commit:
> 
>   2ee6a576be564272 ("fs, fscrypt: add an S_ENCRYPTED inode flag")
> 
> from the fscrypt tree and commit:
> 
>   d4e50e6d43b2620f ("ext4: add ext4_should_use_dax()")
> 
> from the ext4 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc fs/ext4/inode.c
> index 617c7feced24,9f836e2ec18c..000000000000
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@@ -4572,6 -4610,21 +4610,23 @@@ int ext4_get_inode_loc(struct inode *in
>   		!ext4_test_inode_state(inode, EXT4_STATE_XATTR));
>   }
>   
> + static bool ext4_should_use_dax(struct inode *inode)
> + {
> ++	unsigned int flags = EXT4_I(inode)->i_flags;
> ++
> + 	if (!test_opt(inode->i_sb, DAX))
> + 		return false;
> + 	if (!S_ISREG(inode->i_mode))
> + 		return false;
> + 	if (ext4_should_journal_data(inode))
> + 		return false;
> + 	if (ext4_has_inline_data(inode))
> + 		return false;
>  -	if (ext4_encrypted_inode(inode))
> ++	if (flags & EXT4_ENCRYPT_FL)
> + 		return false;
> + 	return true;
> + }
> + 
>   void ext4_set_inode_flags(struct inode *inode)
>   {
>   	unsigned int flags = EXT4_I(inode)->i_flags;
> @@@ -4587,15 -4640,10 +4642,13 @@@
>   		new_fl |= S_NOATIME;
>   	if (flags & EXT4_DIRSYNC_FL)
>   		new_fl |= S_DIRSYNC;
> - 	if (test_opt(inode->i_sb, DAX) && S_ISREG(inode->i_mode) &&
> - 	    !ext4_should_journal_data(inode) && !ext4_has_inline_data(inode) &&
> - 	    !(flags & EXT4_ENCRYPT_FL))
> + 	if (ext4_should_use_dax(inode))
>   		new_fl |= S_DAX;
>  +	if (flags & EXT4_ENCRYPT_FL)
>  +		new_fl |= S_ENCRYPTED;
>   	inode_set_flags(inode, new_fl,
>  -			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX);
>  +			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX|
>  +			S_ENCRYPTED);
>   }
>   
>   static blkcnt_t ext4_inode_blocks(struct ext4_inode *raw_inode,

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
