From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Date: Mon, 11 Dec 2017 00:24:36 -0500
Message-ID: <20171211052436.GA18104@redhat.com>
References: <20171211130534.6ab6e415@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51298 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdLKFYi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 00:24:38 -0500
Content-Disposition: inline
In-Reply-To: <20171211130534.6ab6e415@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Dec 10 2017 at  9:05pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (powerp
> ppc64_defconfig) produced this warning:
> 
> drivers/md/dm.c: In function '__send_changing_extent_only':
> drivers/md/dm.c:1365:45: warning: 'ti' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   num_bios = get_num_bios ? get_num_bios(ti) : 0;
>                                              ^
> 
> Introduced by commit
> 
>   aecefd4919de ("dm: fix __send_changing_extent_only() to send first bio and chain remainder")
> 
> This looks particularly bad :-(

I worked all weekend on DM code and compiled dm.c probably 30 times,
pretty bizarre that the RHEL7 gcc compiler isn't spewing anything about
this.

Anyway, I just fixed it via rebase (new commit is
6fb0326f0a19dd855bfd748481fd32035770376e).

Thanks,
Mike
