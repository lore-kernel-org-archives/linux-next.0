From: Or Gerlitz <ogerlitz@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 17:52:24 +0200
Message-ID: <568D3838.7010606@mellanox.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
 <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com>
 <20160104193616.GB30315@fieldses.org>
 <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
 <20160106121529.GA21780@lst.de>
 <90E07B04-AAFD-45E9-85EA-44C659191180@oracle.com>
 <568D28D2.4090507@mellanox.com>
 <3B1D726B-5225-40D5-8C94-CA87EF198D89@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-am1on0093.outbound.protection.outlook.com ([157.56.112.93]:61504
	"EHLO emea01-am1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751595AbcAFPwf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 10:52:35 -0500
In-Reply-To: <3B1D726B-5225-40D5-8C94-CA87EF198D89@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>

On 1/6/2016 5:20 PM, Chuck Lever wrote:
>> Chuck,
>> >
>> >Lets be concrete... anything wrong with patch [1]?
> Yes. It is missing Acked-by: lines from the maintainers of
> those files.
>
> All changes to files under net/sunrpc need an Ack from one
> of the maintainers listed in MAINTAINERS for that directory,
> if the changes are going through another maintainer's tree.
>
> I have been personally asked to remind folks that the
> nfs-sunrpc maintainers do not read linux-rdma, so they
> must be contacted directly (and cc: linux-nfs) as part of
> proposing finished patches in that area.

I did that!!

I copied you and Anna on the patch [1].

Again, lets be concrete, this very small cleanup was picked and merged, 
anything there
need to be fixed?

Or.

[1] http://marc.info/?l=linux-rdma&m=145042924110411&w=2


> Unfortunately I have not been able to review every patch
> that has come by on linux-rdma in the past 9 months to
> ensure the eyes are dotted and tees crossed. More than
> a few commits in the tree are missing the proper tags.
>
>
> >[1]  commit e3e45b1 "xprtrdma: Avoid calling ib_query_device"
> >
> >in git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git k.o/for-4.5
> >
> >http://git.kernel.org/cgit/linux/kernel/git/dledford/rdma.git/commit/?h=k.o/for-4.5&id=e3e45b1b43988b99007a9908ca0ba738b3fbd0ff
> >
