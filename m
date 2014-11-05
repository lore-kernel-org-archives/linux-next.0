From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Tue, 4 Nov 2014 20:30:30 -0800
Message-ID: <20141105043030.GB10613@kroah.com>
References: <20141105151825.26c53948@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49595 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752108AbaKEEbl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Nov 2014 23:31:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 70281207A6
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2014 23:31:41 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20141105151825.26c53948@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Wed, Nov 05, 2014 at 03:18:25PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/host/Kconfig between commit cd6e245a2d06 ("usb: Remove
> references to non-existent PLAT_S5P symbol") from the usb.current tree
> and commit dd3cf17488b1 ("usb: host: Remove optional dependencies on
> PLAT_S5P") from the usb tree.
> 
> I fixed it up (I used the usb tree version) and can carry the fix as
> necessary (no action is required).

That's the correct fix, thanks for doing that.

greg k-h
