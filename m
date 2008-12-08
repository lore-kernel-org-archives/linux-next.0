From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the staging tree
Date: Mon, 08 Dec 2008 12:35:57 -0800 (PST)
Message-ID: <20081208.123557.22263181.davem@davemloft.net>
References: <20081208203403.320ea0bb.sfr@canb.auug.org.au>
	<20081208151750.GE19711@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57589
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751949AbYLHUf4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 15:35:56 -0500
In-Reply-To: <20081208151750.GE19711@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com

From: Greg KH <greg@kroah.com>
Date: Mon, 8 Dec 2008 07:17:50 -0800

> On Mon, Dec 08, 2008 at 08:34:03PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > Today's linux-next merge of the staging tree got a conflicts in
> > drivers/staging/wlan-ng/p80211netdev.c and
> > drivers/staging/wlan-ng/p80211wext.c between commit
> > 979123d5343b4fdcd4c682745b8a0be9b8fac248 ("staging-p80211: Kill directly
> > reference of netdev->priv") from the net tree and various commits from
> > the staging tree.
> > 
> > I fixed it up (see below) and can carry the fixes as necessary. (In the
> > case of the second file, the latter removed the code that the former
> > modified.)
> 
> Dave, can you just drop the patch from your queue?  This should already
> be fixed up in the -next tree to not use the field you are wanting to
> remove, right?  So you shouldn't get any build errors from what I can
> tell.

I'd have to revert, which is ugly, because I tend to never
rebase my tree as too many people depend upon it.

Do you _really_ want me to do that?

Because I have to do allmodconfig test builds _too_, and the build
will fail for me if I do these reverts which really would suck.
