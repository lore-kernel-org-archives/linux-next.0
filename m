From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with the f2fs tree
Date: Thu, 9 Jun 2016 13:34:17 +1000
Message-ID: <20160609133417.75be271b@canb.auug.org.au>
References: <20160609132609.449a7d23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41101 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1423671AbcFIDeT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jun 2016 23:34:19 -0400
In-Reply-To: <20160609132609.449a7d23@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>

Hi all,

On Thu, 9 Jun 2016 13:26:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the block tree got conflicts in:
> 
>   fs/f2fs/data.c
>   fs/f2fs/segment.c
> 
> between commits:
> 
>   0a87f664d1ad ("f2fs: detect congestion of flush command issues")
>   19a5f5e2ef37 ("f2fs: drop any block plugging")
> 
> from the f2fs tree and commits:
> 
>   4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")
>   04d328defd06 ("f2fs: use bio op accessors")
> 
> from the block tree.

Can someone give me a good address for Mike Christie, please - the
address in those block tree commits (Mike Christie
<mchristi@redhat.com>) fails.
-- 
Cheers,
Stephen Rothwell
