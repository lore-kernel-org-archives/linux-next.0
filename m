From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 14 Jan 2016 15:15:41 +1100
Message-ID: <20160114151541.17e76d23@canb.auug.org.au>
References: <20151231232210.7ab890f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45246 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752119AbcANEPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jan 2016 23:15:43 -0500
In-Reply-To: <20151231232210.7ab890f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

On Thu, 31 Dec 2015 23:22:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> sound/core/compress_offload.c: In function 'snd_compr_ioctl':
> /home/sfr/next/next/sound/core/compress_offload.c:804:2: error: case label does not reduce to an integer constant
>   case _IOC_NR(SNDRV_COMPRESS_GET_CODEC_CAPS):
>   ^
> 
> I have no idea what caused that and have just left it broken for now.

I am still getting this.  Something in mmotm is causing or exposing this.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
