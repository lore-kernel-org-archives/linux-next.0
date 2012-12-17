From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Date: Sun, 16 Dec 2012 19:15:04 -0500
Message-ID: <20121217001504.GA13828@shiny>
References: <20121217100022.7d751dc9075d60a33d636a23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([66.114.96.30]:48100 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751368Ab2LQAPH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Dec 2012 19:15:07 -0500
Content-Disposition: inline
In-Reply-To: <20121217100022.7d751dc9075d60a33d636a23@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Mason <clmason@fusionio.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Behrens <sbehrens@giantdisaster.de>, Josef Bacik <JBacik@fusionio.com>, Linus <torvalds@linux-foundation.org>

On Sun, Dec 16, 2012 at 04:00:22PM -0700, Stephen Rothwell wrote:
> Hi Chris,
> 
> After merging the btrfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/ioctl.c: In function 'btrfs_ioctl':
> fs/btrfs/ioctl.c:3940:7: error: case label does not reduce to an integer constant

Thanks Stephen.  In my sources, this line is:

case BTRFS_IOC_DEV_REPLACE:

And the define is:

#define BTRFS_IOC_DEV_REPLACE _IOWR(BTRFS_IOCTL_MAGIC, 53, \
                                    struct btrfs_ioctl_dev_replace_args)

Is there a way to see what ppc64 is doing with this macro?

> 
> Caused by commit 0aa7cbc7585a ("Btrfs: add support for device replace ioctls").
> 
> I have used the btrfs tree from next-20121214 for today (which was empty).
> 
> I have to say that these btrfs commits have come to linux-next very late
> in the game (i.e. some of them have author dates back in September and
> October and yet they only appeared in linux-next today).

This is true, we've had these in testing for some time.  Especially when
new interfaces come in, we tend to delay them.

> Also, the
> committer of this commits is Josef Bacik <jbacik@fusionio.com> but there
> is not Signed-off-by him.  There are other commits that are committed by
> you, Chris, that also do not have a Signed-off-by you.

Josef and I have sob on all of our commits (at least all the ones not in
3.7, I didn't go back farther).  In this case the Author was Stefan and
it ended up rebased in either Josef's or my tree.  We usually try to
preserve merges on rebase, but this time was a bigger set of changes
than usual and it didn't work out.

-chris
