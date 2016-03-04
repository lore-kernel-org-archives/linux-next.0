From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Fri, 4 Mar 2016 08:58:41 -0800
Message-ID: <20160304165841.GA29748@kroah.com>
References: <20160304162444.7f043991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41587 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756881AbcCDQ6p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Mar 2016 11:58:45 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B4ED22A109
	for <linux-next@vger.kernel.org>; Fri,  4 Mar 2016 11:58:44 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20160304162444.7f043991@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Janani Ravichandran <janani.rvchndrn@gmail.com>, Antti Palosaari <crope@iki.fi>

On Fri, Mar 04, 2016 at 04:24:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/media/dvb-frontends/mn88473.c
> 
> between commit:
> 
>   7908fad99a6c ("[media] mn88473: finalize driver")
> 
> from the v4l-dvb tree and commit:
> 
>   3a35be2a1443 ("staging: media: Remove unneeded parentheses")
> 
> from the staging tree.
> 
> I fixed it up (I just used the v4l-dvb tree version) and can carry the
> fix as necessary (no action is required).

Thanks for this, that sounds fine.

greg k-h
