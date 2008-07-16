From: Jaswinder Singh <jaswinder@infradead.org>
Subject: Re: linux-next: manual merge of the usb tree
Date: Wed, 16 Jul 2008 12:50:08 +0530
Message-ID: <1216192808.3394.12.camel@jaswinder.satnam>
References: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
	 <1216191977.3394.5.camel@jaswinder.satnam>
	 <20080716171336.1a470f75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:44430 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751899AbYGPHU7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jul 2008 03:20:59 -0400
In-Reply-To: <20080716171336.1a470f75.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>

Hello Stephen,

On Wed, 2008-07-16 at 17:13 +1000, Stephen Rothwell wrote:

> What needs to happen is that Alan's patch needs to be redone based on
> Linus' tree of today.
> 

My patch is smaller and simpler as compare to Alan patch.

So can we follow this approach for linux-next tree:-

1. Remove my patch from Linus tree
2. Apply Alan patch first
3. Then I will give you firmware patch based upon yesterday tree which I
installed here :-
http://git.infradead.org/users/jaswinder/linux-next.git
4. Then you apply firmware patch

Thank you,

Jaswinder Singh.
