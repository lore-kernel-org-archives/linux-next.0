From: David Brown <davidb@codeaurora.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Wed, 14 Sep 2011 15:58:25 -0700
Message-ID: <20110914225825.GA13421@huya.qualcomm.com>
References: <20110912120501.764336af05069fa23a371b5e@canb.auug.org.au>
 <4E6D6C0D.60100@codeaurora.org>
 <20110913115533.403d4fe6d961ccc8ba9b58b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:61700 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab1INW61 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Sep 2011 18:58:27 -0400
Content-Disposition: inline
In-Reply-To: <20110913115533.403d4fe6d961ccc8ba9b58b7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stephen Boyd <sboyd@codeaurora.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <davidb@codeaurora.org>, Russell King <rmk@arm.linux.org.uk>

On Tue, Sep 13, 2011 at 11:55:33AM +1000, Stephen Rothwell wrote:
> Hi Stephen,
> 
> On Sun, 11 Sep 2011 19:18:53 -0700 Stephen Boyd <sboyd@codeaurora.org> wrote:
> >
> > The device tree machine description also needs to have the .fixup and
> > .reserve callbacks added to it so that the device tree machines boot
> > properly. Perhaps the soc tree needs to pull in Russell's tree at some
> > point to resolve this subtle logical conflict or when the trees are
> > merged together someone will need to do an evil merge and add the
> > callbacks in the merge commit.
> 
> Ah, right.  I have added this merge fixup for today and can carry it as
> necessary.

Arnd, how do you want to handle this?  It's a simple patch, but only
applies to the merge of Russell's tree and the soc tree.

Thanks,
David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
