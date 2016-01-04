From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Mon, 4 Jan 2016 12:44:50 +1100
Message-ID: <20160104124450.7ba21c87@canb.auug.org.au>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53923 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752136AbcADBox (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jan 2016 20:44:53 -0500
In-Reply-To: <20151231133022.0b3ecab9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>

Hi all,

On Thu, 31 Dec 2015 13:30:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Doug,
> 
> Today's linux-next merge of the rdma tree got conflicts in a quite a
> few files between (mostly, I think) commit:
> 
>   6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device")
> 
> from the nfsd tree and various commits from the rdma tree.
> 
> It would have taken me considerable time to fix the conflicts up, so I
> have dropped teh rdma tree for today (just because it was merged second).
> Please have a conversation and figure out how you are going to cooperate
> and get these conflicts fixed e.g. set up a stable branch with Christoph's
> commit (and any other conflicting commits) in it and merge that into
> both trees.

So, on further inspection, it appears that there is a series of commits
in the rdma tree that does basically the same as that nfsd tree commit
above.  So I have dropped the rdma tree again today.  Please have a
conversation guys ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
