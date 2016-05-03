From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 3 May 2016 11:19:54 -0700
Message-ID: <20160503181954.GC7819@kroah.com>
References: <20160503164422.78369452@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47830 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934429AbcECST5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2016 14:19:57 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D97D420A3D
	for <linux-next@vger.kernel.org>; Tue,  3 May 2016 14:19:55 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20160503164422.78369452@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "John L. Hammond" <john.hammond@intel.com>

On Tue, May 03, 2016 at 04:44:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/lustre/lustre/llite/rw26.c
> 
> between commit:
> 
>   c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")
> 
> from the vfs tree and commit:
> 
>   8c7b0e1a6747 ("staging/lustre/llite: rename ccc_object to vvp_object")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good, thanks.

greg k-h
