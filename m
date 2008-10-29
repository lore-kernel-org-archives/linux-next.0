From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 29 Oct 2008 13:20:50 -0700 (PDT)
Message-ID: <20081029.132050.176478819.davem@davemloft.net>
References: <20081029141123.38d83ab7.sfr@canb.auug.org.au>
	<20081028.215309.157244158.davem@davemloft.net>
	<20081029123440.GA24103@tuxdriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57680
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753962AbYJ2UVP (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 16:21:15 -0400
In-Reply-To: <20081029123440.GA24103@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linville@tuxdriver.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, chunkeey@web.de, johannes@sipsolutions.net

From: "John W. Linville" <linville@tuxdriver.com>
Date: Wed, 29 Oct 2008 08:34:41 -0400

> On Tue, Oct 28, 2008 at 09:53:09PM -0700, David Miller wrote:
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 29 Oct 2008 14:11:23 +1100
> > 
> > > Today's linux-next merge of the net tree got a conflict in
> > > drivers/net/wireless/p54/p54common.c between commit
> > > f2c2e25554991f9c17bcd24028db5e1c50ecb0ad ("p54: fix build warnings") from
> > > the net-current tree and commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0
> > > ("net: convert print_mac to %pM") from the net tree.
> > > 
> > > Just context changes.  I fixed it up (see below) and can carry the fix
> > > (hopefully only until net-current is merged into Linus' tree).
> > 
> > Yep, I'll merge after the next time net-current goes to Linus's tree.
> 
> BTW, any idea when that will be?  I have stuff that could go to -next
> but that will conflict with what has been sent for 2.6.28.

I just sent a pull request out to Linus, when he grabs that I'll
merge everything into net-next-2.6 and send a note to netdev.
