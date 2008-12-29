From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: origin tree build failure
Date: Sun, 28 Dec 2008 19:36:12 -0800
Message-ID: <ada8wpzvej7.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-3.cisco.com ([171.71.176.72]:51636 "EHLO
	sj-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbYL2Dhw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Dec 2008 22:37:52 -0500
In-Reply-To: <20081229114321.4b6baea5.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 29 Dec 2008 11:43:21 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Aleksey Senin <alekseys@voltaire.com>

 > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
 > 
 > ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
 > ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefined!
 > 
 > Caused by commit 38617c64bf9a10bf20e41d95b69bb81e8560fe9d ("RDMA/addr:
 > Add support for translating IPv6 addresses").  This requires a dependency
 > on IPV6.

Thanks, I'll get a fix queued up.  Sorry about that.

 - R.
