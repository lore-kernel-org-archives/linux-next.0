From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the  tree
Date: Fri, 1 Aug 2014 00:38:00 -0700
Message-ID: <20140801073800.GB31866@kroah.com>
References: <20140801162142.24086152@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48387 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750892AbaHAHic (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2014 03:38:32 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by gateway1.nyi.internal (Postfix) with ESMTP id 2C4D222F42
	for <linux-next@vger.kernel.org>; Fri,  1 Aug 2014 03:38:30 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140801162142.24086152@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@gmail.com>

On Fri, Aug 01, 2014 at 04:21:42PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> MAINTAINERS between commit 7eea35fe3df8 ("[media] MAINTAINERS: Update
> go7007 pattern") from the v4l-dvb tree and commit 0d317b91d6d8
> ("staging: frontier: remove driver") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
