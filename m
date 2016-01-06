From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 11:25:17 -0500
Message-ID: <20160106162517.GA13070@fieldses.org>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
 <20160104124450.7ba21c87@canb.auug.org.au>
 <5689DEA0.1020803@redhat.com>
 <20160104193616.GB30315@fieldses.org>
 <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:53947 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbcAFQZS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 11:25:18 -0500
Content-Disposition: inline
In-Reply-To: <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML Kernel <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>

On Wed, Jan 06, 2016 at 07:01:14AM -0500, Chuck Lever wrote:
> Part of the plan was that Doug's tree would be merged before
> Bruce's. But the above problem description looks like the
> maintainer trees were merged into linux-next in the other order.

The order makes no difference.

The problem is that we had conflicting patches: I still had Christoph's
patch, but Doug's tree did something different.

(The only reason to care about merge order is that if I sent my pull
request to Linus first, it would look like "here's the nfsd changes for
4.5.  Oh, plus a bunch of rdma changes from Doug which he can explain
later...".  So it'd be best if the rdma changes were already in before I
sent a pull request based on them.)

> I'd like to make this simpler for everyone. Bruce, may I send
> my for-4.5 NFS/RDMA server patches to Doug with your Acked-by?

Sure, I'm fine with doing it either way.  Feel free to add my Acked-by:
to the patches you sent me before if that would simplify things.

--b.
