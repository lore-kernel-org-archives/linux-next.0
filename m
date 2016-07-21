From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: manual merge of the xfs tree with Linus' tree
Date: Thu, 21 Jul 2016 11:35:58 +1000
Message-ID: <20160721013558.GO16044@dastard>
References: <20160721110756.7a905ee8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl6.internode.on.net ([150.101.137.143]:58674 "EHLO
	ipmail05.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753236AbcGUBgD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 21:36:03 -0400
Content-Disposition: inline
In-Reply-To: <20160721110756.7a905ee8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jann Horn <jann@thejh.net>

On Thu, Jul 21, 2016 at 11:07:56AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in:
> 
>   fs/xfs/xfs_ioctl.c
> 
> between commit:
> 
>   3e0a39654645 ("xfs: fix type confusion in xfs_ioc_swapext")
> 
> from Linus' tree and commit:
> 
>   7f1b62457b58 ("xfs: fix type confusion in xfs_ioc_swapext")
> 
> from the xfs tree.
> 
> These are not quite the same patch :-(

Yeah, I added comments to explain the code, because it's not obvious
why the check was added, and I couldn't find any other examples of
such checks in fs/. So, in five years time when I look at that code
again, the comment will remind me why it's a bad idea to remove what
appears to be an unnecesary check...

> I fixed it up (I used the version in the xfs tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.

Yup, I planned to let Linus know. Patches in private emails that
aren't tagged [PATCH] in the subject line don't get the immediate
attention of my mail filters, so I didn't see it immediately.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
