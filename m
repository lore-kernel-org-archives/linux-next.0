From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next
 tree
Date: Wed, 28 May 2014 08:49:42 -0700
Message-ID: <20140528154942.GA12056@kroah.com>
References: <20140528182824.63672ad9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37742 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753724AbaE1PqO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2014 11:46:14 -0400
Content-Disposition: inline
In-Reply-To: <20140528182824.63672ad9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Johannes Berg <johannes.berg@intel.com>, Sachin Kamat <sachin.kamat@linaro.org>

On Wed, May 28, 2014 at 06:28:24PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/rtl8821ae/core.c between commit 77be2c54c5bd
> ("mac80211: add vif to flush call") from the net-next tree and commit
> 0cd05ba54a53 ("staging: rtl8821ae: core.c: Remove version specific
> code") from the staging tree.
> 
> I fixed it up (the former is a suberset of the latter for this
> particular conflict) and can carry the fix as necessary (no action is
> required).

Sounds good, thanks.

greg k-h
