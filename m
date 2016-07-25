From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Mon, 25 Jul 2016 01:30:28 +0100
Message-ID: <20160725003028.GQ2356@ZenIV.linux.org.uk>
References: <20160725102453.7fbe3ddd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:55064 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752732AbcGYAac (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 24 Jul 2016 20:30:32 -0400
Content-Disposition: inline
In-Reply-To: <20160725102453.7fbe3ddd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miklos Szeredi <mszeredi@redhat.com>

On Mon, Jul 25, 2016 at 10:24:53AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/overlayfs/super.c
> 
> between commit:
> 
>   e2475b7276d0 ("ovl: check mounter creds on underlying lookup")
> 
> from the overlayfs tree and commit:
> 
>   b3ac9a85b31c ("qstr: constify instances in overlayfs")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

FWIW, if Miklos could pick that one-liner into overlayfs tree, I'd be only
happy to drop it from that queue.
