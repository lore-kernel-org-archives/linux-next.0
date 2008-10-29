From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the net tree
Date: Wed, 29 Oct 2008 08:34:41 -0400
Message-ID: <20081029123440.GA24103@tuxdriver.com>
References: <20081029141123.38d83ab7.sfr@canb.auug.org.au> <20081028.215309.157244158.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:51067 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752501AbYJ2Mfh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Oct 2008 08:35:37 -0400
Content-Disposition: inline
In-Reply-To: <20081028.215309.157244158.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, chunkeey@web.de, johannes@sipsolutions.net

On Tue, Oct 28, 2008 at 09:53:09PM -0700, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 29 Oct 2008 14:11:23 +1100
> 
> > Today's linux-next merge of the net tree got a conflict in
> > drivers/net/wireless/p54/p54common.c between commit
> > f2c2e25554991f9c17bcd24028db5e1c50ecb0ad ("p54: fix build warnings") from
> > the net-current tree and commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0
> > ("net: convert print_mac to %pM") from the net tree.
> > 
> > Just context changes.  I fixed it up (see below) and can carry the fix
> > (hopefully only until net-current is merged into Linus' tree).
> 
> Yep, I'll merge after the next time net-current goes to Linus's tree.

BTW, any idea when that will be?  I have stuff that could go to -next
but that will conflict with what has been sent for 2.6.28.

John
-- 
John W. Linville		Linux should be at the core
linville@tuxdriver.com			of your literate lifestyle.
