From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Wed, 16 Nov 2016 19:49:29 -0700
Message-ID: <5d5a631b-e18e-aa2b-67bb-e2df6d8bef15@kernel.dk>
References: <20161117130134.682bb6b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:35284 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753335AbcKQCtf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Nov 2016 21:49:35 -0500
Received: by mail-pf0-f180.google.com with SMTP id i88so46107630pfk.2
        for <linux-next@vger.kernel.org>; Wed, 16 Nov 2016 18:49:35 -0800 (PST)
In-Reply-To: <20161117130134.682bb6b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On 11/16/2016 07:01 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got conflicts in:
>
>   fs/btrfs/extent_io.c
>   fs/btrfs/inode.c
>
> between commit:
>
>   01a1400f8545 ("btrfs: only check bio size to see if a repair bio should have the failfast flag")
>
> from the btrfs-kdave tree and commit:
>
>   70fd76140a6c ("block,fs: use REQ_* flags directly")
>
> from the block tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

I don't have the full context here, but this:

diff --cc fs/btrfs/extent_io.c
index 5694d60adad9,1e67723c27a1..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2403,10 -2403,8 +2403,8 @@@ static int bio_readpage_error(struct bi
   		return -EIO;
   	}

  -	if (failed_bio->bi_vcnt > 1)
  +	if (failed_bio->bi_iter.bi_size > BTRFS_I(inode)->root->sectorsize)
- 		read_mode = READ_SYNC | REQ_FAILFAST_DEV;
- 	else
- 		read_mode = READ_SYNC;
+ 		read_mode |= REQ_FAILFAST_DEV;

   	phy_offset >>= inode->i_sb->s_blocksize_bits;
   	bio = btrfs_create_repair_bio(inode, failed_bio, failrec, page,

doesn't look correct, if bio_readpage_error() is called from the 
->bi_end_io() handler. bi_size is generally zeroed at that time.

-- 
Jens Axboe
