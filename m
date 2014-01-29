From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the imx-mxs tree with the arm tree
Date: Wed, 29 Jan 2014 09:18:06 +0800
Message-ID: <20140129011803.GA13518@S2101-09.ap.freescale.net>
References: <20140129113514.86275e22015dea313d78d5e1@canb.auug.org.au>
 <20140129011310.GT15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:30675 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754026AbaA2BSG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jan 2014 20:18:06 -0500
Content-Disposition: inline
In-Reply-To: <20140129011310.GT15937@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 29, 2014 at 01:13:10AM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 29, 2014 at 11:35:14AM +1100, Stephen Rothwell wrote:
> > Hi Shawn,
> > 
> > Today's linux-next merge of the imx-mxs tree got a conflict in
> > arch/arm/boot/dts/Makefile between commits 208d7baf8085 ("ARM: imx:
> > initial SolidRun HummingBoard support") and 971488f1149f ("ARM: imx:
> > initial SolidRun Cubox-i support") from the arm tree and various commits
> > from the imx-mxs tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Nice easy add/add which Linus won't complain about.  Thanks Stephen.
> 
> This should move to between Linus' and Shawn's tree over the next
> couple of days since I've now sent my final pull request for this
> window.

I will rebase my branch on v3.14-rc1 once it's out.

Shawn
