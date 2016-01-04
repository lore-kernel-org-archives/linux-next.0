From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Mon, 4 Jan 2016 14:36:16 -0500
Message-ID: <20160104193616.GB30315@fieldses.org>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
 <20160104124450.7ba21c87@canb.auug.org.au>
 <5689DEA0.1020803@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fieldses.org ([173.255.197.46]:52907 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751970AbcADTgR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2016 14:36:17 -0500
Content-Disposition: inline
In-Reply-To: <5689DEA0.1020803@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>, chuck.lever@oracle.com

On Sun, Jan 03, 2016 at 09:53:20PM -0500, Doug Ledford wrote:
> On 01/03/2016 08:44 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Thu, 31 Dec 2015 13:30:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Hi Doug,
> >>
> >> Today's linux-next merge of the rdma tree got conflicts in a quite a
> >> few files between (mostly, I think) commit:
> >>
> >>   6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device")
> >>
> >> from the nfsd tree and various commits from the rdma tree.
> >>
> >> It would have taken me considerable time to fix the conflicts up, so I
> >> have dropped teh rdma tree for today (just because it was merged second).
> >> Please have a conversation and figure out how you are going to cooperate
> >> and get these conflicts fixed e.g. set up a stable branch with Christoph's
> >> commit (and any other conflicting commits) in it and merge that into
> >> both trees.
> > 
> > So, on further inspection, it appears that there is a series of commits
> > in the rdma tree that does basically the same as that nfsd tree commit
> > above.  So I have dropped the rdma tree again today.  Please have a
> > conversation guys ...
> > 
> 
> The initial patchset was Christoph's.  It was later replaced with a
> different patchset from Or Gerlitz.  Bruce picked up some changes from
> Chuck Lever that were originally based on Christoph's work but now need
> to be rebased off of the current RDMA tree.

OK.  I'm assuming Chuck will want to do any necessary rebasing and
retesting himself, so for now I've just dropped those patches, and
expect to pick up new versions when Chuck gets back from the holidays.

--b.
