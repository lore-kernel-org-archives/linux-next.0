From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: infiniband tree build failure
Date: Thu, 19 Nov 2009 16:19:29 -0800
Message-ID: <ada1vju6oa6.fsf@roland-alpha.cisco.com>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-3.cisco.com ([171.71.176.72]:14072 "EHLO
	sj-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757772AbZKTATY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2009 19:19:24 -0500
In-Reply-To: <20091120110342.5128b8f8.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Fri, 20 Nov 2009 11:03:42 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, sean.hefty@intel.com
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


 > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
 > 
 > ERROR: ".__ipv6_addr_type" [drivers/infiniband/core/rdma_cm.ko] undefined!
 > 
 > I have used the version of the infiniband tree from next-20091119 for
 > today.

Sorry, will track it down.  Sean this probably came from your patches,
any idea off the top of your head?
