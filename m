From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] ext4: get rid of compile warning
Date: Mon, 20 Feb 2012 08:00:05 -0800
Message-ID: <4F426E05.1000600@xenotime.net>
References: <20120220125655.GA2651@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:40913 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751301Ab2BTQAL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2012 11:00:11 -0500
In-Reply-To: <20120220125655.GA2651@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org

On 02/20/2012 04:56 AM, Heiko Carstens wrote:
> Get rid of this one:
>
> fs/ext4/balloc.c: In function 'ext4_wait_block_bitmap':
> fs/ext4/balloc.c:405:3: warning: format '%llu' expects argument of
>    type 'long long unsigned int', but argument 6 has type 'sector_t' [-Wformat]
>
> Happens because sector_t is u64 (unsigned long long) or unsigned long
> dependent on CONFIG_64BIT.
>
> Signed-off-by: Heiko Carstens<heiko.carstens@de.ibm.com>

I sent the same patch on Jan. 30.  I wonder what happened to it?

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>   fs/ext4/balloc.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
> index 95c87ab..c355890 100644
> --- a/fs/ext4/balloc.c
> +++ b/fs/ext4/balloc.c
> @@ -404,7 +404,7 @@ int ext4_wait_block_bitmap(struct super_block *sb, ext4_group_t block_group,
>   	if (!buffer_uptodate(bh)) {
>   		ext4_error(sb, "Cannot read block bitmap - "
>   			   "block_group = %u, block_bitmap = %llu",
> -			   block_group, bh->b_blocknr);
> +			   block_group, (unsigned long long) bh->b_blocknr);
>   		return 1;
>   	}
>   	/* Panic or remount fs read-only if block bitmap is invalid */


-- 
~Randy
