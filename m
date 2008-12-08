From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree
Date: Mon, 8 Dec 2008 07:17:50 -0800
Message-ID: <20081208151750.GE19711@kroah.com>
References: <20081208203403.320ea0bb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58994 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754646AbYLHP1z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 10:27:55 -0500
Content-Disposition: inline
In-Reply-To: <20081208203403.320ea0bb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Wang Chen <wangchen@cn.fujitsu.com>, "David S. Miller" <davem@davemloft.net>

On Mon, Dec 08, 2008 at 08:34:03PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflicts in
> drivers/staging/wlan-ng/p80211netdev.c and
> drivers/staging/wlan-ng/p80211wext.c between commit
> 979123d5343b4fdcd4c682745b8a0be9b8fac248 ("staging-p80211: Kill directly
> reference of netdev->priv") from the net tree and various commits from
> the staging tree.
> 
> I fixed it up (see below) and can carry the fixes as necessary. (In the
> case of the second file, the latter removed the code that the former
> modified.)

Dave, can you just drop the patch from your queue?  This should already
be fixed up in the -next tree to not use the field you are wanting to
remove, right?  So you shouldn't get any build errors from what I can
tell.

thanks,

greg k-h
