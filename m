From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Thu, 4 Apr 2013 18:45:05 -0700
Message-ID: <20130405014505.GB26617@kroah.com>
References: <20130404154017.baa42c6bcef82c4cbc750646@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46073 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932346Ab3DEBpH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 21:45:07 -0400
Content-Disposition: inline
In-Reply-To: <20130404154017.baa42c6bcef82c4cbc750646@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Zimmer <nzimmer@sgi.com>, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Apr 04, 2013 at 03:40:17PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/dgrp/dgrp_specproc.c between commit 464b4fd02caa ("dgrp
> procfs fixes, part 2") and various other commits from the vfs tree and
> commit 433121c6ef51 ("staging: dgrp: cleanup sparse warnings") from the
> staging tree.
> 
> I just used the version from the vfs tree and can carry the fix as
> necessary (no action is required).

That is correct, thanks.

greg k-h
