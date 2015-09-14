From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the kdbus tree with Linus' tree
Date: Sun, 13 Sep 2015 21:25:34 -0700
Message-ID: <20150914042534.GA27042@kroah.com>
References: <20150914105356.02aef8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49907 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750979AbbINEZg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Sep 2015 00:25:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 242ED20614
	for <linux-next@vger.kernel.org>; Mon, 14 Sep 2015 00:25:36 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150914105356.02aef8f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Pranith Kumar <bobby.prani@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, David Herrmann <dh.herrmann@gmail.com>, Djalal Harouni <tixxdz@opendz.org>

On Mon, Sep 14, 2015 at 10:53:56AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the kdbus tree got a conflict in:
> 
>   tools/testing/selftests/Makefile
> 
> between commit:
> 
>   b6d973441675 ("selftests: add membarrier syscall test")
> 
> from Linus' tree and commit:
> 
>   b7270dd9f7d4 ("kdbus: add selftests")
> 
> from the kdbus tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc tools/testing/selftests/Makefile
> index 89b05e2222c9,b57100cefb74..000000000000
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@@ -4,9 -4,8 +4,10 @@@ TARGETS += efivarf
>   TARGETS += exec
>   TARGETS += firmware
>   TARGETS += ftrace
>  +TARGETS += futex
>   TARGETS += kcmp
> + TARGETS += kdbus
>  +TARGETS += membarrier
>   TARGETS += memfd
>   TARGETS += memory-hotplug
>   TARGETS += mount

Looks good to me, thanks.

greg k-h
