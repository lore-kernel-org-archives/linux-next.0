From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: linux-next: manual merge of the block tree with the vfs tree
Date: Tue, 18 May 2010 10:37:05 -0500
Message-ID: <0D753D10438DA54287A00B0270842697636F14E7ED@AUSP01VMBX24.collaborationhost.net>
References: <20100518130401.f6286112.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100518130401.f6286112.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <jens.axboe@oracle.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Monday, May 17, 2010 8:04 PM, Stephen Rothwell wrote:
> Hi Jens,
>
> Today's linux-next merge of the block tree got a conflict in
> fs/fs-writeback.c between commit 1c9539ad0dd1c3c3964ea35d5a355a0ed19c39c7
> ("fs-writeback.c: bitfields should be unsigned") from the vfs tree and
> commit e913fc825dc685a444cb4c1d0f9d32f372f59861 ("writeback: fix
> WB_SYNC_NONE writeback from umount") from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc fs/fs-writeback.c
> index 24e85ce,0f62957..0000000
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@@ -42,9 -42,10 +42,10 @@@ struct wb_writeback_args 
>   	long nr_pages;
>   	struct super_block *sb;
>   	enum writeback_sync_modes sync_mode;
>  -	int for_kupdate:1;
>  -	int range_cyclic:1;
>  -	int for_background:1;
>  -	int sb_pinned:1;
>  +	unsigned int for_kupdate:1;
>  +	unsigned int range_cyclic:1;
>  +	unsigned int for_background:1;
> ++	unsigned int sb_pinned:1;
>   };
>   
>   /*

Stephen,

Your fix looks good to me.

Regards,
Hartley