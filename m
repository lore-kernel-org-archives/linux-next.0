From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the  tree
Date: Thu, 14 Feb 2013 21:24:21 -0800
Message-ID: <20130215052421.GA3789@kroah.com>
References: <20130215160124.52d9bfb269ad1ffd390d4851@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36205 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751083Ab3BOFYM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Feb 2013 00:24:12 -0500
Content-Disposition: inline
In-Reply-To: <20130215160124.52d9bfb269ad1ffd390d4851@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Larry Finger <Larry.Finger@lwfinger.net>, "John W. Linville" <linville@tuxdriver.com>

On Fri, Feb 15, 2013 at 04:01:24PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/net/wireless/rtlwifi/Kconfig between commit 06e7cda3ce30
> ("rtlwifi: Rework Kconfig") from the wireless-next tree and commit
> 6cba014857f4 ("drivers/net/wireless/rtlwifi: remove depends on
> CONFIG_EXPERIMENTAL") from the driver-core tree.
> 
> I fixed it up (the former is a superset of the latter, so I used that)
> and can carry the fix as necessary (no action is required).

That sounds fine, thanks.

greg k-h
