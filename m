From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Tue, 18 May 2010 00:00:01 -0700
Message-ID: <m1wrv13dam.fsf@fess.ebiederm.org>
References: <20100518164520.7e9652b1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:56089 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754833Ab0ERHAN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2010 03:00:13 -0400
In-Reply-To: <20100518164520.7e9652b1.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Tue\, 18 May 2010 16\:45\:20 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Greg,
>
> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/sysfs/mount.c: In function 'sysfs_exit_ns':
> fs/sysfs/mount.c:160: error: 'S_BIAS' undeclared (first use in this function)
>
> Caused by commit c80e63f000aa7cf73a430b2cb57dbbb91554a847 ("sysfs:
> Implement sysfs tagged directory support") from the driver-core tree
> interacting with commit f3ffc7acb6a6ebec0a9e660d9211ed048d7e90f5 ("get
> rid of S_BIAS") from the vfs tree.
>
> I don't know how to fix this, so I just commented the code out for now
> (see below). Please someone supply a correct fix.
>
> [Al, I notice that the "get rid of S_BIAS" patch has an author date of
> March 22 - it would have been nice if it had been in linux-next during
> the last two months so that we could have had a fix for this some time
> ago.]

Stephen what is the easiest way to get a copy of Al's tree so I can take
a look to see what needs to happen?

Eric
