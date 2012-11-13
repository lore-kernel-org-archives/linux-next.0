From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Tue, 13 Nov 2012 10:49:11 -0800
Message-ID: <20121113184911.GC24793@kroah.com>
References: <20121113143732.624361eaf8ed2f4d0d64dd7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49185 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755636Ab2KMStN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Nov 2012 13:49:13 -0500
Content-Disposition: inline
In-Reply-To: <20121113143732.624361eaf8ed2f4d0d64dd7d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <weiyj.lk@gmail.com>, Felipe Balbi <balbi@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

On Tue, Nov 13, 2012 at 02:37:32PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/musb/ux500.c between commit 9a65d162e449 ("usb: musb: ux500:
> fix 'musbid' undeclared error in ux500_remove()") from the usb.current
> tree and commit 2f7711642559 ("usb: musb: remove hand-crafted id
> handling") from the usb tree.
> 
> The latter supercedes the former so I used that and can carry the fix as
> necessary (no action is required).

That is fine, thanks for doing this.

greg k-h
