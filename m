From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Sun, 31 Jan 2016 20:01:37 -0800
Message-ID: <20160201040137.GB16865@kroah.com>
References: <20160201144521.0378c6a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59763 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752164AbcBAEBk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 23:01:40 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C8F122D93C
	for <linux-next@vger.kernel.org>; Sun, 31 Jan 2016 23:01:39 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20160201144521.0378c6a6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Ricardo Ruedas <ricardo.ruedas@gmail.com>

On Mon, Feb 01, 2016 at 02:45:21PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/panel/panel.c
> 
> between commit:
> 
>   b64a1cbef6df ("Revert "Staging: panel: usleep_range is preferred over udelay"")
> 
> from the staging.current tree and commit:
> 
>   df44f1504b4d ("staging: panel: remove warnings line over 80 characters")
> 
> from the staging tree.
> 
> I fixed it up (I used the staging.current version) and can carry the fix as necessary (no action
> is required).

Thanks, I'll resolve it as well when I merge 4.5-rc2 into this branch.

thanks,

greg k-h
