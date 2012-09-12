From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Wed, 12 Sep 2012 09:14:12 -0700
Message-ID: <20120912161412.GE7273@kroah.com>
References: <20120912153756.1483e19457d053914f82ce28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47060 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759809Ab2ILQOO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Sep 2012 12:14:14 -0400
Content-Disposition: inline
In-Reply-To: <20120912153756.1483e19457d053914f82ce28@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pratyush Anand <pratyush.anand@st.com>, Felipe Balbi <balbi@ti.com>, Moiz Sonasath <m-sonasath@ti.com>

On Wed, Sep 12, 2012 at 03:37:56PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/dwc3/gadget.c between commit f4a53c55117b ("usb: dwc3:
> gadget: fix pending isoc handling") from the usb.current tree and commit
> 348e026fafe2 ("usb: dwc3: gadget: Fix sparse warnings") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the warning, I'll resolve this when Linus pulls from this
tree later this week.

greg k-h
