From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 28 Oct 2008 21:53:09 -0700 (PDT)
Message-ID: <20081028.215309.157244158.davem@davemloft.net>
References: <20081029141123.38d83ab7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40256
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751223AbYJ2Exc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 00:53:32 -0400
In-Reply-To: <20081029141123.38d83ab7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, chunkeey@web.de, linville@tuxdriver.com, johannes@sipsolutions.net

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Oct 2008 14:11:23 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/net/wireless/p54/p54common.c between commit
> f2c2e25554991f9c17bcd24028db5e1c50ecb0ad ("p54: fix build warnings") from
> the net-current tree and commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0
> ("net: convert print_mac to %pM") from the net tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix
> (hopefully only until net-current is merged into Linus' tree).

Yep, I'll merge after the next time net-current goes to Linus's tree.
