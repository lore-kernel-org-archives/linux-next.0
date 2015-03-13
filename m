From: Guoqing Jiang <jgq516@gmail.com>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Fri, 13 Mar 2015 16:55:50 +0800
Message-ID: <5502A616.9050305@gmail.com>
References: <20150302165057.29087a08@canb.auug.org.au>	<20150302170345.742add96@notabene.brown>	<20150302171149.0a62b072@canb.auug.org.au> <20150303133531.72f10682@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:32907 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbbCMI4r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2015 04:56:47 -0400
In-Reply-To: <20150303133531.72f10682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: NeilBrown <neilb@suse.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Neil,
>
> On Mon, 2 Mar 2015 17:11:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>   
>> On Mon, 2 Mar 2015 17:03:45 +1100 NeilBrown <neilb@suse.de> wrote:
>>     
>>> I think
>>> +               bm_blocks = DIV_ROUND_UP(bm_blocks, 4096);
>>>
>>> needs DIV_ROUND_UP_SECTOR_T()
>>>       
>> I tried that and it was not sufficient.
>>
>>     
>>> The first patch you identified adds that line.  The second relocates it.
>>>       
>> The second also changes this:
>>
>> bm_blocks = sector_div(bitmap->mddev->resync_max_sectors, (chunksize >> 9));
>>
>> (added by the first) to this:
>>
>> bm_blocks = bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitmap_info.chunksize >> 9);
>>
>> where bitmap->mddev->resync_max_sectors is a sector_t ...
>>     
>
> So I applied this patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Mar 2015 13:30:26 +1100
> Subject: [PATCH] md/bitmap: use sector_div for sector_t divisions
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/md/bitmap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> index 23f575f0cd92..d40398404ab6 100644
> --- a/drivers/md/bitmap.c
> +++ b/drivers/md/bitmap.c
> @@ -573,7 +573,8 @@ re_read:
>  	if (bitmap->cluster_slot >= 0) {
>  		long long bm_blocks;
>  
> -		bm_blocks = bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitmap_info.chunksize >> 9);
> +		bm_blocks = sector_div(bitmap->mddev->resync_max_sectors,
> +				       bitmap->mddev->bitmap_info.chunksize >> 9);
>   
One simple question, isn't the sector_div used for change '%' operator?
but the modified line is:

bm_blocks = bitmap->mddev->resync_max_sectors */* (bitmap->mddev->bitmap_info.chunksize >> 9);

But, the modified is:

bm_blocks = sector_div(bitmap->mddev->resync_max_sectors,
		       bitmap->mddev->bitmap_info.chunksize >> 9);

The sector_div returns:

bitmap->mddev->resync_max_sectors % bitmap->mddev->bitmap_info.chunksize >> 9

So it basically means :

bm_blocks = bitmap->mddev->resync_max_sectors % bitmap->mddev->bitmap_info.chunksize >> 9


And maybe the current next tree should add the following change to keep
original semantic.

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index 501f83f..ea9c685 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -571,11 +571,10 @@ static int bitmap_read_sb(struct bitmap *bitmap)
 re_read:
        /* If cluster_slot is set, the cluster is setup */
        if (bitmap->cluster_slot >= 0) {
-               sector_t bm_blocks;
-               sector_t resync_sectors = bitmap->mddev->resync_max_sectors;
+               sector_t bm_blocks = bitmap->mddev->resync_max_sectors;
 
-               bm_blocks = sector_div(resync_sectors,
-                                     
bitmap->mddev->bitmap_info.chunksize >> 9);
+               sector_div(bm_blocks,
+                               bitmap->mddev->bitmap_info.chunksize >> 9);
                bm_blocks = bm_blocks << 3;
                bm_blocks = DIV_ROUND_UP_SECTOR_T(bm_blocks, 4096);
                bitmap->mddev->bitmap_info.offset +=
bitmap->cluster_slot * (bm_blocks << 3);


Thanks,
Guoqing
>  		bm_blocks = bm_blocks << 3;
>  		bm_blocks = DIV_ROUND_UP_SECTOR_T(bm_blocks, 4096);
>  		bitmap->mddev->bitmap_info.offset += bitmap->cluster_slot * (bm_blocks << 3);
>   
