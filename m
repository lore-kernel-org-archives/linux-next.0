From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Wed, 5 Nov 2014 18:19:53 -0800
Message-ID: <20141106021953.GC17253@kroah.com>
References: <20141105152911.69bd1a14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58763 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751299AbaKFCTz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2014 21:19:55 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id F3F01209E9
	for <linux-next@vger.kernel.org>; Wed,  5 Nov 2014 21:19:54 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141105152911.69bd1a14@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amber Thrall <amber.rose.thrall@gmail.com>, Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>

On Wed, Nov 05, 2014 at 03:29:11PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/media/lirc/lirc_imon.c between commit f3a75505ab5f
> ("[media] Staging: media: lirc: cleaned up packet dump in 2 files")
> from the v4l-dvb tree and commit 732ba199ab07 ("staging: media: lirc:
> lirc_imon.c: replace printk by dev_dbg") from the staging tree.
> 
> I fixed it up (the staging tree patch was not complete, so I did the
> below) and can carry the fix as necessary (no action is required).

Thanks for all 3 of these, they look fine.

greg k-h
