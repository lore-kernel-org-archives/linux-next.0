From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: linux-next: net tree build failure
Date: Thu, 20 Nov 2008 20:02:26 -0800
Message-ID: <20081120200226.6dc2b209@extreme>
References: <20081121134457.85e1d384.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:49718 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751687AbYKUEC2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 23:02:28 -0500
In-Reply-To: <20081121134457.85e1d384.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Fri, 21 Nov 2008 13:44:57 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Dave,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/net/acenic.c:461: error: 'ace_vlan_rx_register' undeclared here (not in a function)
> 
> Caused by commit d8b83c57a7e497cba9b5cb156e63176323035785 ("acenic:
> convert to net_device_ops").  This commit should also be looked at
> again as ace_vlan_rx_register() is only defined if ACENIC_DO_VLAN is
> set but it is used in net_device_ops unconditionally.   And it needs to
> be forward declared to get rid of the compiler error above, of course.
> 
> I have dropped the net tree for today.

Fixed by later patch (in second wave)
