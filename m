From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 9 Jun 2011 11:42:06 -0700
Message-ID: <20110609184206.GC2760@kroah.com>
References: <20110609165804.2e96bb77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:46346 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754696Ab1FITFS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2011 15:05:18 -0400
Content-Disposition: inline
In-Reply-To: <20110609165804.2e96bb77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arjan Mels <arjan.mels@gmx.net>, matt mooney <mfm@muteddisk.com>

On Thu, Jun 09, 2011 at 04:58:04PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/usbip/stub_dev.c between commit d3ac07788017 ("staging:
> usbip: bugfix prevent driver unbind") from the staging.current tree and
> commit d012c2a5aca1 ("staging: usbip: stub_dev.c: move stub_driver
> definition and update driver name") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks correct, thanks for doing this.

greg k-h
