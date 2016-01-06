From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 11:33:52 -0500
Message-ID: <2118F38A-846F-4690-A6E8-0BA7A437D567@oracle.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au> <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com> <20160104193616.GB30315@fieldses.org> <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com> <20160106121529.GA21780@lst.de> <90E07B04-AAFD-45E9-85EA-44C659191180@oracle.com> <568D28D2.4090507@mellanox.com> <3B1D726B-5225-40D5-8C94-CA87EF198D89@oracle.com> <568D3838.7010606@mellanox.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:46199 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751582AbcAFQeL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2016 11:34:11 -0500
In-Reply-To: <568D3838.7010606@mellanox.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Or Gerlitz <ogerlitz@mellanox.com>
Cc: Christoph Hellwig <hch@lst.de>, "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>


> On Jan 6, 2016, at 10:52 AM, Or Gerlitz <ogerlitz@mellanox.com> wrote:
> 
> On 1/6/2016 5:20 PM, Chuck Lever wrote:
>>> Chuck,
>>> >
>>> >Lets be concrete... anything wrong with patch [1]?
>> Yes. It is missing Acked-by: lines from the maintainers of
>> those files.
>> 
>> All changes to files under net/sunrpc need an Ack from one
>> of the maintainers listed in MAINTAINERS for that directory,
>> if the changes are going through another maintainer's tree.
>> 
>> I have been personally asked to remind folks that the
>> nfs-sunrpc maintainers do not read linux-rdma, so they
>> must be contacted directly (and cc: linux-nfs) as part of
>> proposing finished patches in that area.
> 
> I did that!!
> 
> I copied you and Anna on the patch [1].

The marc.info archive does not preserve To: or Cc:
fields on e-mail. I had to look in my own inbox to
confirm who the recipients were.

Anna was the only NFS maintainer listed, and
linux-nfs was not included on that e-mail at all.
Did Anna ever reply with an Acked-by ? I don't see
that in either the archive or my own inbox.

Bruce needs to Ack the svc_rdma_transport.c hunks.


> Again, lets be concrete, this very small cleanup was picked and merged, anything there
> need to be fixed?

I have rebased on Doug's current for-4.5, and will
be testing today before submitting my for-4.5 patches
again. Your changes are mechanical, so I don't expect
to encounter a technical problem.

However, I would be more comfortable if the missing
Acks were fixed in Doug's tree (with Anna and Bruce's
permission, of course) before Linus pulls.


> Or.
> 
> [1] http://marc.info/?l=linux-rdma&m=145042924110411&w=2
> 
> 
>> Unfortunately I have not been able to review every patch
>> that has come by on linux-rdma in the past 9 months to
>> ensure the eyes are dotted and tees crossed. More than
>> a few commits in the tree are missing the proper tags.
>> 
>> 
>> >[1]  commit e3e45b1 "xprtrdma: Avoid calling ib_query_device"
>> >
>> >in git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git k.o/for-4.5
>> >
>> >http://git.kernel.org/cgit/linux/kernel/git/dledford/rdma.git/commit/?h=k.o/for-4.5&id=e3e45b1b43988b99007a9908ca0ba738b3fbd0ff
>> >
> 

--
Chuck Lever
