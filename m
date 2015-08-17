From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the rdma tree
Date: Mon, 17 Aug 2015 09:03:02 -0700
Message-ID: <20150817160302.GA6311@kroah.com>
References: <20150817181312.4be1a554@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60057 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750799AbbHQQDH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 12:03:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A9FB920ED1
	for <linux-next@vger.kernel.org>; Mon, 17 Aug 2015 12:03:06 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20150817181312.4be1a554@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Gromm <christian.gromm@microchip.com>, Steve Wise <swise@opengridcomputing.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>

On Mon, Aug 17, 2015 at 06:13:12PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/Kconfig
>   drivers/staging/Makefile
> 
> between commit:
> 
>   c2347d1b409d ("RDMA/amso1100: deprecate the amso1100 provider")
>   17465e48756f ("IB/ipath: Move ipath driver to staging.")
>   97748be1d6d0 ("Move hfi1 to staging")
> 
> from the rdma tree and commit:
> 
>   57562a72414c ("Staging: most: add MOST driver's core module")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
