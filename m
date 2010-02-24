From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the wireless
	tree
Date: Tue, 23 Feb 2010 18:14:58 -0800
Message-ID: <20100224021458.GA14159@kroah.com>
References: <20100222163134.367353e7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47104 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751660Ab0BXDg6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2010 22:36:58 -0500
Content-Disposition: inline
In-Reply-To: <20100222163134.367353e7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Leroy <fredo@starox.org>, "John W. Linville" <linville@tuxdriver.com>, Joe Perches <joe@perches.com>

On Mon, Feb 22, 2010 at 04:31:34PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c between commit
> e2117cea27c6b27e1a379acac5eb0433eeb7033a ("staging: rtl8192su: fix
> compile error from wireless-testing commit") from the wireless tree and
> commit 7332868b1aea2a5900a70acadf767f7632b1c2c2 ("Staging: rtl8187x: Use %
> pM for mac address output") from the staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix
> as necessary.

Looks good to me, thanks for doing this.

greg k-h
