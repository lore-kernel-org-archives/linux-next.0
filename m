From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 13:15:29 +0100
Message-ID: <20160106121529.GA21780@lst.de>
References: <20151231133022.0b3ecab9@canb.auug.org.au> <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com> <20160104193616.GB30315@fieldses.org> <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuck Lever <chuck.lever@oracle.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 06, 2016 at 07:01:14AM -0500, Chuck Lever wrote:
> Part of the plan was that Doug's tree would be merged before
> Bruce's. But the above problem description looks like the
> maintainer trees were merged into linux-next in the other order.
> 
> I'd like to make this simpler for everyone. Bruce, may I send
> my for-4.5 NFS/RDMA server patches to Doug with your Acked-by?
> That way, merge order won't matter.
> 
> Doug, what is the URL for the branch I should rebase on?

I'm not Doug, but all the recent for 4.5 work is in Dougs tree
at

	https://github.com/dledford/linux rdma/k.o/for-4.5

Bruce, can you ACK me local_dma_lkey patch as well which needs
the same treatment as Chuck's patches?  I have some RDMA work
in that area planned for the nxt merge window, so it would be
really helpful to get it in for 4.5.
