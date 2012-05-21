From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the net-next tree
Date: Mon, 21 May 2012 06:08:57 -0700
Message-ID: <20120521130857.GA19103@kroah.com>
References: <20120521161008.c0cc00b91642ed7a3875a686@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50319 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755616Ab2EUNJD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 21 May 2012 09:09:03 -0400
Content-Disposition: inline
In-Reply-To: <20120521161008.c0cc00b91642ed7a3875a686@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>, Kalle Valo <kvalo@qca.qualcomm.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>

On Mon, May 21, 2012 at 04:10:08PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/net/wireless/ath/ath6kl/usb.c between commit 9cbee358687e
> ("ath6kl: add full USB support") from the net-next tree and commit
> e1f12eb6ba6f ("USB: Disable hub-initiated LPM for comms devices") from
> the usb tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good to me, thanks.

greg k-h
