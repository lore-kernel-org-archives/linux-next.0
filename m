From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 9 Jun 2011 11:41:43 -0700
Message-ID: <20110609184143.GB2760@kroah.com>
References: <20110609165808.8b36f634.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:52674 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754409Ab1FITFQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2011 15:05:16 -0400
Content-Disposition: inline
In-Reply-To: <20110609165808.8b36f634.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roland Vossen <rvossen@broadcom.com>

On Thu, Jun 09, 2011 at 04:58:08PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/brcm80211/brcmfmac/wl_iw.c between commit e1c78de9a462
> ("staging: brcm80211: fix for 'multiple definition of wl_msg_level' build
> err") from the staging.current tree and commit 8817f75429a1 ("staging:
> brcm80211: removed wl_ (vendor specific acronym)") from the staging tree.
> 
> I fixed it up (using the latter change) and can carry the fix as
> necessary.

Thanks for the fix, it sounds correct.

greg k-h
