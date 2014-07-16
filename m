From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next
 tree
Date: Wed, 16 Jul 2014 13:52:20 -0700
Message-ID: <20140716205220.GA14387@kroah.com>
References: <20140716164322.472de7c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37831 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751106AbaGPUwq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2014 16:52:46 -0400
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 136D021A2E
	for <linux-next@vger.kernel.org>; Wed, 16 Jul 2014 16:52:46 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140716164322.472de7c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Gundersen <teg@jklm.no>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@gmail.com>

On Wed, Jul 16, 2014 at 04:43:22PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/cxt1e1/linux.c between commit c835a6773314 ("net: set
> name_assign_type in alloc_netdev()") from the net-next tree and commit
> 14b596c9d80b ("staging: cxt1e1: remove driver") from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary (no action is required).

That is fine, thanks.

greg k-h
