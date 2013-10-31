From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the usb tree with the  tree
Date: Thu, 31 Oct 2013 15:16:28 -0700
Message-ID: <20131031221628.GA3595@kroah.com>
References: <20131028230152.46d44ec81ac368fa00191225@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50899 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751761Ab3JaWO0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Oct 2013 18:14:26 -0400
Content-Disposition: inline
In-Reply-To: <20131028230152.46d44ec81ac368fa00191225@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kishon Vijay Abraham I <kishon@ti.com>

On Mon, Oct 28, 2013 at 11:01:52PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/Kconfig between commit 12cc4b3827f8 ("PowerCap: Add to drivers
> Kconfig and Makefile") from the pm tree and commit ff764963479a
> ("drivers: phy: add generic PHY framework") from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks fine to me, thanks.

greg k-h
