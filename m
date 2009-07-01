From: Davide Libenzi <davidel@xmailserver.org>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 1 Jul 2009 00:10:50 -0700 (PDT)
Message-ID: <alpine.DEB.1.10.0907010007020.8745@makko.or.mcafeemobile.com>
References: <20090701145711.1c9c8935.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from x35.xmailserver.org ([64.71.152.41]:49133 "EHLO
	x35.xmailserver.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbZGAHLn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2009 03:11:43 -0400
Received: from makko.or.mcafeemobile.com
	by x35.xmailserver.org with [XMail 1.26 ESMTP Server]
	id <S2F4F45> for <linux-next@vger.kernel.org> from <davidel@xmailserver.org>;
	Wed, 1 Jul 2009 03:11:02 -0400
In-Reply-To: <20090701145711.1c9c8935.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Gregory Haskins <ghaskins@novell.com>

On Wed, 1 Jul 2009, Stephen Rothwell wrote:

> Hi Avi,
> 
> Today's linux-next merge of the kvm tree got a conflict in fs/eventfd.c
> between commit 133890103b9de08904f909995973e4b5c08a780e ("eventfd:
> revised interface and cleanups") from Linus' tree and commit
> 28ddf0aebbf546e56efd1951725d5457ce1ebf98 ("eventfd: Allow waiters to be
> notified about the eventfd file* going away") from the kvm tree.
> 
> Overlapping changes.  I fixed it up (see below), but don't know if this
> is the correct fix.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc fs/eventfd.c
> index 31d12de,72f5f8d..0000000
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@@ -105,8 -63,13 +105,13 @@@ static int eventfd_release(struct inod
>   {
>   	struct eventfd_ctx *ctx = file->private_data;
>   
> - 	wake_up_poll(&ctx->wqh, POLLHUP);
> + 	/*
> + 	 * No need to hold the lock here, since we are on the file cleanup
> + 	 * path and the ones still attached to the wait queue will be
> + 	 * serialized by wake_up_locked_poll().
> + 	 */
> + 	wake_up_locked_poll(&ctx->wqh, POLLHUP);
>  -	kfree(ctx);
>  +	eventfd_ctx_put(ctx);
>   	return 0;
>   }

That's fine.
There are a couple of extra spaces before the last two -+ in that patch 
though ;)


- Davide
