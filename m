From: Aleksey Senin <alekseys@voltaire.com>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 11:58:57 +0200
Message-ID: <1230544737.4261.33.camel@alst60>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	 <ada4p0nve4r.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fwil.voltaire.com ([193.47.165.2]:24318 "EHLO exil.voltaire.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753827AbYL2J75 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 04:59:57 -0500
In-Reply-To: <ada4p0nve4r.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "general@lists.openfabrics.org" <general@lists.openfabrics.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Roland Dreier <rdreier@cisco.com>

After another investigation of this problem, I think that proposed
solution is #ifdef as good for a first stage. IPv6 support is mandatory
when we are talking about running linux in some organization. But, of
course, the way how it implemented in IB stack should be changed. So on
the second stage, I'd like drop out these "defines" and at the time of
module initialization obtain addresses of IPv6 functions and in the case
if they are present at the runtime, call them. It should be nice
solution for RMDA_CM and IPoIB modules.
On Sun, 2008-12-28 at 19:44 -0800, Roland Dreier wrote:
> > ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
>  > ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefined!
>  > 
>  > Caused by commit 38617c64bf9a10bf20e41d95b69bb81e8560fe9d ("RDMA/addr:
>  > Add support for translating IPv6 addresses").  This requires a dependency
>  > on IPV6.
> 
> So how do we want to fix this?  (This question is mostly directed to the
> IB guys)  One possibility is to make all this depend on IPV6 in Kconfig,
> but I think we want the RDMA CM to be buildable/usable even if IPv6
> isn't enabled.  A better option is to just put all the IPv6 related
> stuff into
> 
> #if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
> 
> and add a Kconfig dependency on (IPV6 || IPV6=n) as we did for IPoIB.
> 
> But then this leads to the behavior that loading the RDMA CM will cause
> the ipv6 module to be loaded if IPV6=m in the kernel config, even if the
> administrator doesn't want to enable IPv6, just as with IPoIB today.
> And people already complain about that.
> 
> Anyone see a better solution (which we could use for IPoIB even)?
> 
>  - R.
