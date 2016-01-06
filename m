From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 09:24:13 -0500
Message-ID: <90E07B04-AAFD-45E9-85EA-44C659191180@oracle.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au> <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com> <20160104193616.GB30315@fieldses.org> <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com> <20160106121529.GA21780@lst.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:26107 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892AbcAFOYb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2016 09:24:31 -0500
In-Reply-To: <20160106121529.GA21780@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>


> On Jan 6, 2016, at 7:15 AM, Christoph Hellwig <hch@lst.de> wrote:
> 
> On Wed, Jan 06, 2016 at 07:01:14AM -0500, Chuck Lever wrote:
>> Part of the plan was that Doug's tree would be merged before
>> Bruce's. But the above problem description looks like the
>> maintainer trees were merged into linux-next in the other order.
>> 
>> I'd like to make this simpler for everyone. Bruce, may I send
>> my for-4.5 NFS/RDMA server patches to Doug with your Acked-by?
>> That way, merge order won't matter.
>> 
>> Doug, what is the URL for the branch I should rebase on?
> 
> I'm not Doug, but all the recent for 4.5 work is in Dougs tree
> at
> 
> 	https://github.com/dledford/linux rdma/k.o/for-4.5
> 
> Bruce, can you ACK me local_dma_lkey patch as well which needs
> the same treatment as Chuck's patches?  I have some RDMA work
> in that area planned for the nxt merge window, so it would be
> really helpful to get it in for 4.5.

Actually, one of Or's for-4.5 devattr patches doesn't
appear to have the proper Ack's for the changes under
net/sunrpc/xprtrdma either.


--
Chuck Lever
