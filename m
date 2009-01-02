From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [PATCH -next] 9p: fix RDMA dependency
Date: Fri, 02 Jan 2009 11:59:07 -0800
Message-ID: <adawsddpjhw.fsf@cisco.com>
References: <20090102203303.f314a99a.sfr@canb.auug.org.au>
	<495E5A82.9000603@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-3.cisco.com ([171.71.176.72]:3353 "EHLO
	sj-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757066AbZABT7M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Jan 2009 14:59:12 -0500
In-Reply-To: <495E5A82.9000603@oracle.com> (Randy Dunlap's message of "Fri, 02
	Jan 2009 10:18:42 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Van Hensbergen <ericvh@gmail.com>, Roland Dreier <rolandd@cisco.com>

 >  config NET_9P_RDMA
 > -	depends on INET && INFINIBAND && EXPERIMENTAL
 > +	depends on INET && INFINIBAND_ADDR_TRANS && EXPERIMENTAL
 >  	tristate "9P RDMA Transport (Experimental)"

This actually allows the broken config INFINIBAND=m and NET_9P_RDMA=y.
I think the answer is to add INFINIBAND_ADDR_TRANS but leave INFINIBAND
too.  The SUNRPC_XPRT_RDMA patch would have the same problem, but since
SUNRPC_XPRT_RDMA is a hidden option (with help text ?!) that gets set
automatically, there's no way to create the problem config.

 - R.
