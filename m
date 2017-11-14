From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the f2fs tree
Date: Mon, 13 Nov 2017 18:29:47 -0800
Message-ID: <20171114022947.GA81139@jaegeuk-macbookpro.roam.corp.google.com>
References: <20171113073958.6e63ed70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751561AbdKNC3s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 21:29:48 -0500
Content-Disposition: inline
In-Reply-To: <20171113073958.6e63ed70@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yunlei He <heyunlei@huawei.com>, Chao Yu <yuchao0@huawei.com>

On 11/13, Stephen Rothwell wrote:
> Hi Jaegeuk,
> 
> Commit
> 
>   c79d88f915ed ("f2fs: separate nat entry mem alloc from nat_tree_lock")
> 
> is missing a Signed-off-by from its author.

Thank you so much to point this out.
I fixed it.

Thanks,

> 
> -- 
> Cheers,
> Stephen Rothwell
