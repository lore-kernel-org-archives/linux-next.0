From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: build warning after merge of the nfsd tree
Date: Sun, 2 Apr 2017 22:39:34 -0400
Message-ID: <20170403023934.GB19658@fieldses.org>
References: <20170403110948.3ca5ab8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:36546 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751280AbdDCCjf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Apr 2017 22:39:35 -0400
Content-Disposition: inline
In-Reply-To: <20170403110948.3ca5ab8b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

On Mon, Apr 03, 2017 at 11:09:48AM +1000, Stephen Rothwell wrote:
> Hi,
> 
> After merging the nfsd tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/nfsd/nfs4state.c: In function 'copy_cred':
> fs/nfsd/nfs4state.c:1917:6: warning: unused variable 'ret' [-Wunused-variable]
>   int ret;
>       ^
> 
> Introduced by commit
> 
>   d39662236bf8 ("nfsd4: remove pointless strdup_if_nonnull")
> 
> Also, that commit has no Signed-off-by from its Author.

Both fixed, thanks.--b.
