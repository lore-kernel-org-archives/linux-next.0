From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the pm tree
Date: Thu, 27 Jun 2013 08:36:38 -0700
Message-ID: <20130627153638.GB25244@kroah.com>
References: <20130627171418.6293697ff334ecc1a79608da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49194 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752806Ab3F0Pfy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Jun 2013 11:35:54 -0400
Content-Disposition: inline
In-Reply-To: <20130627171418.6293697ff334ecc1a79608da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Opdenacker <michael.opdenacker@free-electrons.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Thu, Jun 27, 2013 at 05:14:18PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> include/linux/device.h between commit 4f3549d72d1b ("Driver core: Add
> offline/online device operations") from the pm tree and commit
> bfd63cd24df6 ("driver core: device.h: fix doc compilation warnings") from
> the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
