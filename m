From: Florian Fainelli <florian@openwrt.org>
Subject: Re: linux-next: manual merge of the mips tree with the net-current tree
Date: Tue, 24 Nov 2009 12:30:22 +0100
Message-ID: <200911241230.22370.florian@openwrt.org>
References: <20091124113717.c5d86d41.sfr@canb.auug.org.au> <20091124011958.GA8105@linux-mips.org> <20091123.194343.232255103.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:25097 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757628AbZKXLbU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2009 06:31:20 -0500
In-Reply-To: <20091123.194343.232255103.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: ralf@linux-mips.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, a.beregalov@gmail.com, linux-mips@linux-mips.org, manuel.lauss@googlemail.com

On Tuesday 24 November 2009 04:43:43 David Miller wrote:
> From: Ralf Baechle <ralf@linux-mips.org>
> Date: Tue, 24 Nov 2009 01:19:58 +0000
> 
> > On Tue, Nov 24, 2009 at 11:37:17AM +1100, Stephen Rothwell wrote:
> >> Hi Ralf,
> >>
> >> Today's linux-next merge of the mips tree got a conflict in
> >> drivers/net/au1000_eth.c between commit
> >> 63edaf647607795a065e6956a79c47f500dc8447 ("Au1x00: fix crash when trying
> >> register_netdev()") from the net-current tree and commit
> >> 6cdbc95856e7f4ab4e7b2f2bdab5c3844537ad83 ("NET: au1000-eth: convert to
> >> platform_driver model") from the mips tree.
> >>
> >> It looks to me that the mips tree change supercedes the net-current one
> >> (since it moves the register_netdev() call much later), so I just used
> >> this file from the mips tree.
> >
> > I agree.  David, can you just drop the net-current patch then?  This fix
> > is still needed for -stable however.
> 
> Why would I do that?  The bug fix is necessary for 2.6.32 too.

Ok, it is, but the platform_driver conversion patch is heavier, so the bugfix 
is way easier to apply on thom of the conversion.
--
WBR, Florian
