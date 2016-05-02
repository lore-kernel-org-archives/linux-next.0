From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 2 May 2016 02:08:39 +0100
Message-ID: <20160502010838.GJ25498@ZenIV.linux.org.uk>
References: <20160502105943.72202e80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39602 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752151AbcEBBIl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 1 May 2016 21:08:41 -0400
Content-Disposition: inline
In-Reply-To: <20160502105943.72202e80@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 02, 2016 at 10:59:43AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/overlayfs/super.c
> 
> between commit:
> 
>   d478d6a8b8b7 ("ovl: ignore permissions on underlying lookup")
> 
> from the overlayfs tree and commit:
> 
>   5cf3e7fecb43 ("ovl_lookup_real(): use lookup_one_len_unlocked()")
> 
> from the vfs tree.
> 
> I fixed it up (I used the overlayfs version, since I don't know the
> locking consequences of teh change from lookup_one_len() to lookup_hash())
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Should use lookup_one_len_unlocked(), actually.  lookup_hash() is
a microoptimization, losing a lot more on excessive i_mutex contention.
Either variant works, though.
