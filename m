From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: origin tree build failure
Date: Sun, 28 Dec 2008 19:44:52 -0800
Message-ID: <ada4p0nve4r.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-6.cisco.com ([171.71.176.117]:43543 "EHLO
	sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849AbYL2Dox (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Dec 2008 22:44:53 -0500
In-Reply-To: <20081229114321.4b6baea5.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 29 Dec 2008 11:43:21 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: general@lists.openfabrics.org, Aleksey Senin <alekseys@voltaire.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

 > ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
 > ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefined!
 > 
 > Caused by commit 38617c64bf9a10bf20e41d95b69bb81e8560fe9d ("RDMA/addr:
 > Add support for translating IPv6 addresses").  This requires a dependency
 > on IPV6.

So how do we want to fix this?  (This question is mostly directed to the
IB guys)  One possibility is to make all this depend on IPV6 in Kconfig,
but I think we want the RDMA CM to be buildable/usable even if IPv6
isn't enabled.  A better option is to just put all the IPv6 related
stuff into

#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)

and add a Kconfig dependency on (IPV6 || IPV6=n) as we did for IPoIB.

But then this leads to the behavior that loading the RDMA CM will cause
the ipv6 module to be loaded if IPV6=m in the kernel config, even if the
administrator doesn't want to enable IPv6, just as with IPoIB today.
And people already complain about that.

Anyone see a better solution (which we could use for IPoIB even)?

 - R.
