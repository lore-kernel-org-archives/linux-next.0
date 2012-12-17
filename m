From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Date: Sun, 16 Dec 2012 21:01:49 -0500
Message-ID: <20121217020149.GB13828@shiny>
References: <20121217100022.7d751dc9075d60a33d636a23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([66.114.96.30]:34152 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750915Ab2LQCBw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Dec 2012 21:01:52 -0500
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

Many thanks Stephen for helping debug this.

It turned out to be the size of the ioctl arg was just too big.  Stefan,
I lowered this by using BTRFS_DEVICE_PATH_NAME_MAX instead, and I also
put the char arrays after the u64s.

It works here with the progs patch you sent (and matching struct
changes), including cancel and the btrfs replace -r mode.  I've pushed
the result out to my next branch and my for-linus branch, please take a
look and make sure I didn't miss anything.

-chris
