From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Thu, 20 Nov 2008 20:13:22 -0800 (PST)
Message-ID: <20081120.201322.239482598.davem@davemloft.net>
References: <20081121134457.85e1d384.sfr@canb.auug.org.au>
	<20081120200226.6dc2b209@extreme>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56493
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755289AbYKUENW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 23:13:22 -0500
In-Reply-To: <20081120200226.6dc2b209@extreme>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: shemminger@vyatta.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

From: Stephen Hemminger <shemminger@vyatta.com>
Date: Thu, 20 Nov 2008 20:02:26 -0800

> On Fri, 21 Nov 2008 13:44:57 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Dave,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/net/acenic.c:461: error: 'ace_vlan_rx_register' undeclared here (not in a function)
> > 
> > Caused by commit d8b83c57a7e497cba9b5cb156e63176323035785 ("acenic:
> > convert to net_device_ops").  This commit should also be looked at
> > again as ace_vlan_rx_register() is only defined if ACENIC_DO_VLAN is
> > set but it is used in net_device_ops unconditionally.   And it needs to
> > be forward declared to get rid of the compiler error above, of course.
> > 
> > I have dropped the net tree for today.
> 
> Fixed by later patch (in second wave)

Yep, I'll take care of this tonight.
