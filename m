From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
Date: Tue, 25 Jun 2013 08:18:07 -0700
Message-ID: <20130625151807.GA20244@kroah.com>
References: <20130625165310.161dafbc62ab505ecbfc3cd3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51689 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751256Ab3FYPRY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Jun 2013 11:17:24 -0400
Content-Disposition: inline
In-Reply-To: <20130625165310.161dafbc62ab505ecbfc3cd3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Alexander Shishkin <alexander.shishkin@linux.intel.com>

On Tue, Jun 25, 2013 at 04:53:10PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/chipidea/Makefile between commit 8973ba8b325f ("usb:
> chipidea: depend on CONFIG_OF instead of CONFIG_OF_DEVICE") from the
> devicetree tree and commit 8e22978c5708 ("usb: chipidea: drop "13xxx"
> infix") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks,

greg k-h
