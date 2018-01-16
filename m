From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Date: Tue, 16 Jan 2018 06:59:01 +0100
Message-ID: <20180116055901.GA20154@kroah.com>
References: <20180116134544.5f999209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35737 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750798AbeAPF7B (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jan 2018 00:59:01 -0500
Content-Disposition: inline
In-Reply-To: <20180116134544.5f999209@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

On Tue, Jan 16, 2018 at 01:45:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/staging/lustre/lnet/selftest/module.c: In function 'lnet_selftest_init':
> drivers/staging/lustre/lnet/selftest/module.c:98:10: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    return rc;
>           ^~
> 
> Introduced by commit
> 
>   6106c0f82481 ("staging: lustre: lnet: convert selftest to use workqueues")

Yeah, I told Neil about this, hopefully he sends me a fix soon :)

thanks,

greg k-h
