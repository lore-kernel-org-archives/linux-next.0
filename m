From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Thu, 4 Apr 2013 18:44:50 -0700
Message-ID: <20130405014450.GA26617@kroah.com>
References: <20130404154329.d0c983568da9650d5dcb31bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59553 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932346Ab3DEBox (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 21:44:53 -0400
Content-Disposition: inline
In-Reply-To: <20130404154329.d0c983568da9650d5dcb31bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Apr 04, 2013 at 03:43:29PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/staging/ccg/f_fs.c and drivers/staging/ccg/rndis.c between
> commits 465bced2e3ed ("ccg: don't bother with fops->owner") and
> 4dfac87dca02 ("procfs: new helper - PDE_DATA(inode)") from the vfs tree
> and commit 515e6dd20b3f ("Staging: ccg: delete it from the tree") from
> the staging tree.
> 
> The latter just deletes the files, so I did that and can carry the fix as
> necessary (no action is required).

Sounds correct, thanks.

greg k-h
