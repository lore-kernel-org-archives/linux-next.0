From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the char-misc tree
Date: Tue, 12 Dec 2017 12:49:56 +0100
Message-ID: <20171212114956.GB23534@kroah.com>
References: <20171212143910.146724d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44295 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751665AbdLLLts (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 06:49:48 -0500
Content-Disposition: inline
In-Reply-To: <20171212143910.146724d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vasyl Gomonovych <gomonovych@gmail.com>

On Tue, Dec 12, 2017 at 02:39:10PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build
> (x86_64_allmodconfig) produced this warning:
> 
> drivers/misc/mic/vop/vop_vringh.c: In function 'vop_ioctl':
> drivers/misc/mic/vop/vop_vringh.c:1001:1: warning: label 'done' defined but not used [-Wunused-label]
>  done:
>  ^
> 
> Introduced by commit
> 
>   30b7a2c19e29 ("misc: mic: Use memdup_user() as a cleanup")

Thanks, Colin sent a patch for this, will queue it up later today.

greg k-h
