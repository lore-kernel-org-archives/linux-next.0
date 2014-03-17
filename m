From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Mon, 17 Mar 2014 11:29:15 -0700
Message-ID: <20140317182915.GA4116@kroah.com>
References: <20140306160649.9564c40b8deaaf3b1e261a5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44069 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755568AbaCQS1P (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Mar 2014 14:27:15 -0400
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 0E44820AB6
	for <linux-next@vger.kernel.org>; Mon, 17 Mar 2014 14:27:15 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140306160649.9564c40b8deaaf3b1e261a5b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?=22Salva_Peir=F3=22?= <speiro@ai2.upv.es>, Daeseok Youn <daeseok.youn@gmail.com>

On Thu, Mar 06, 2014 at 04:06:49PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/cxt1e1/linux.c between commit 084b6e7765b9
> ("staging/cxt1e1/linux.c: Correct arbitrary memory write in c4_ioctl()")
> from the staging.current tree and commit 922b81b835c4 ("staging: cxt1e1:
> remove space between function name and parenthesis") and a couple of
> others from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Now fixed in my tree, thanks.

greg k-h
