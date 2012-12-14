From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: some merging notes
Date: Fri, 14 Dec 2012 12:29:49 +1030
Message-ID: <87zk1h2y22.fsf@rustcorp.com.au>
References: <20121212091552.02c72c8926f9f9147b080d68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59469 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755708Ab2LNDvq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Dec 2012 22:51:46 -0500
In-Reply-To: <20121212091552.02c72c8926f9f9147b080d68@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> The virtio tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux.git#virtio-next)
> has a conflict with the net-next tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git#master)
> that requires the following extra fix up patch:
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 33d6f6f..8afe32d 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -147,7 +147,7 @@ struct padded_vnet_hdr {
>   */
>  static int vq2txq(struct virtqueue *vq)
>  {
> -	return (virtqueue_get_queue_index(vq) - 1) / 2;
> +	return (vq->index - 1) / 2;
>  }
>  
>  static int txq2vq(int txq)
> @@ -157,7 +157,7 @@ static int txq2vq(int txq)
>  
>  static int vq2rxq(struct virtqueue *vq)
>  {
> -	return virtqueue_get_queue_index(vq) / 2;
> +	return vq->index / 2;
>  }

I had to fold in a fix to another commit, so I also altered the commit
which removed virtqueue_get_queue_index().  I'll remove it next time.

I'll give it a couple of days in -next to be sure.

Thanks,
Rusty.
