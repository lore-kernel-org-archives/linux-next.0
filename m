Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4E7C001DF
	for <linux-next@archiver.kernel.org>; Thu,  3 Aug 2023 03:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjHCDIE (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 2 Aug 2023 23:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232481AbjHCDID (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 23:08:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAAFED;
        Wed,  2 Aug 2023 20:08:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 341AC61BB3;
        Thu,  3 Aug 2023 03:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1EBC433C8;
        Thu,  3 Aug 2023 03:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691032081;
        bh=tTG+FA9CILiueGgXhaHmfU9jVZoLyJhrIURNGRvYhqs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FrQgqtQVXHCrO2JX5EBqbkNgIfEYfirBcABkhqDJ43iH8cn/4Puk74nwis9a3j+lb
         gCQ8IsjNMJrqALXZhxyErdDHr2nNCYy5K2XNK6vj9klWRr//47/A8RuLV5f8kKJyVk
         WogDtyXJK9+WpEGFuFfr08OSnmQV416r2Hswjfb6kb2+y/PWuBJr8x00+HpBWQBo2O
         dO2c9ADdixH8OPOnyCiKcKovsRVbkQfxU5r3kCigPrIQq1T9u5DUCATqaa7t2b45h8
         SMDnxvbaCay6ndRbfjVFNade7hinDAAAFYlx3pE6j8BNNDmwVAHUQ2aIXqOUqJxgsq
         yCg4sd0uphnJA==
Date:   Wed, 2 Aug 2023 20:08:00 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the djw-vfs tree
Message-ID: <20230803030800.GJ11377@frogsfrogsfrogs>
References: <20230803112830.21c805a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803112830.21c805a7@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 03, 2023 at 11:28:30AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/super.c
> 
> between commit:
> 
>   880b9577855e ("fs: distinguish between user initiated freeze and kernel initiated freeze")
> 
> from the djw-vfs tree and commit:
> 
>   4a8b719f95c0 ("fs: remove emergency_thaw_bdev")
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
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/super.c
> index edc588bca7fc,bc666e7ee1a9..000000000000
> --- a/fs/super.c
> +++ b/fs/super.c
> @@@ -1029,8 -1029,10 +1029,10 @@@ static void do_thaw_all_callback(struc
>   {
>   	down_write(&sb->s_umount);
>   	if (sb->s_root && sb->s_flags & SB_BORN) {
> - 		emergency_thaw_bdev(sb);
> + 		if (IS_ENABLED(CONFIG_BLOCK))
> + 			while (sb->s_bdev && !thaw_bdev(sb->s_bdev))
> + 				pr_warn("Emergency Thaw on %pg\n", sb->s_bdev);
>  -		thaw_super_locked(sb);
>  +		thaw_super_locked(sb, FREEZE_HOLDER_USERSPACE);

Looks correct to me!  Thanks for the heads up.

--D

>   	} else {
>   		up_write(&sb->s_umount);
>   	}


