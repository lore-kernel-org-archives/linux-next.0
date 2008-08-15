From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: [PATCH] Fix allocation sizes of knfsd raparm hash
Date: Fri, 15 Aug 2008 15:02:21 -0400
Message-ID: <20080815190221.GB26563@fieldses.org>
References: <20080815184032.3acd8032.sfr@canb.auug.org.au> <s5hr68q5rm8.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:51970 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756461AbYHOTC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 15:02:27 -0400
Content-Disposition: inline
In-Reply-To: <s5hr68q5rm8.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeff Layton <jlayton@redhat.com>

On Fri, Aug 15, 2008 at 03:34:39PM +0200, Takashi Iwai wrote:
> The raparm was allocated in a wrong size in the commit
> 
>    ca80290ebda9009aedc4bd93ede5d397cb1853dc
>    nfsd: permit unauthenticated stat of export root
> 
> and thus it resulted in memory corruption, eventually Oopsing.
> This patch fixes the allocation size.

Whoops, my fault, now fixed; thanks!

(Out of curiosity--how did you find this?)

--b.

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 
> ---
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index bfa5453..30d606f 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -2093,7 +2093,7 @@ nfsd_racache_init(int cache_size)
>  
>  		raparm = &raparm_hash[i].pb_head;
>  		for (j = 0; j < nperbucket; j++) {
> -			*raparm = kzalloc(sizeof(*raparm), GFP_KERNEL);
> +			*raparm = kzalloc(sizeof(**raparm), GFP_KERNEL);
>  			if (!*raparm)
>  				goto out_nomem;
>  			raparm = &(*raparm)->p_next;
