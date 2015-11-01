From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Sun, 1 Nov 2015 08:44:11 -0500
Message-ID: <20151101134411.GA16936@redhat.com>
References: <20151101214357.058b19de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42834 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752567AbbKANoM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 08:44:12 -0500
Content-Disposition: inline
In-Reply-To: <20151101214357.058b19de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Sun, Nov 01 2015 at  5:43am -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/md/dm-mpath.c: In function 'multipath_prepare_ioctl':
> drivers/md/dm-mpath.c:1570:41: error: 'cmd' undeclared (first use in this function)
>    int err = scsi_verify_blk_ioctl(NULL, cmd);
>                                          ^
> 
> Caused by commit
> 
>   21a2807bc3ff ("dm: refactor ioctl handling")
> 
> I have used the device-mapper tree from next-20151022 for today.

There was a ~3 hour window yesterday where this was broken.  I resolved
it almost 12 hours prior to you having sent this mail.

Do you batch update the trees you pull into linux-next at some point
much earlier in the day?

If/when you do hit a tree that is clearly broken at the time you
pulled: do you attempt to re-pull to get the latest _before_ reverting
to some prior linux-next version of the tree in question?

Anyway, sorry the device-mapper tree was broken for a small window of
time yesterday -- but of course linux-next pulled during that window ;)
