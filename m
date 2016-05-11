From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: suspect commits in the vfs tree
Date: Wed, 11 May 2016 23:23:31 +0100
Message-ID: <20160511222331.GQ2694@ZenIV.linux.org.uk>
References: <20160512073153.4132026e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:33478 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751617AbcEKWXg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 May 2016 18:23:36 -0400
Content-Disposition: inline
In-Reply-To: <20160512073153.4132026e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>

On Thu, May 12, 2016 at 07:31:53AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> I noticed these commits in today's vfs tree:
> 
> 38b78a5f1858 ovl: ignore permissions on underlying lookup
> 3c9fe8cdff1b vfs: add lookup_hash() helper
> 9409e22acdfc vfs: rename: check backing inode being equal
> 54d5ca871e72 vfs: add vfs_select_inode() helper
> 
> They are all committed by you , but have no Signed-off-by from you.
> 
> These commits are also in the overlayfs tree (since that has been rebased
> on top of them).

That's a branch from Miklos with a fixup folded into the first of four;
I didn't want to bother with extra roundtrip and folded the fixup in-place.
Hadn't noticed the lack of S-o-b until after I'd pushed, TBH...
