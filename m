From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Date: Mon, 10 Dec 2018 00:13:39 -0500
Message-ID: <20181210051338.GA2737@redhat.com>
References: <20181210144322.11a94d25@canb.auug.org.au>
 <1993882e-8af3-9e64-da82-195d0089d5e3@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1993882e-8af3-9e64-da82-195d0089d5e3@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 09 2018 at 10:55pm -0500,
Jens Axboe <axboe@kernel.dk> wrote:

> On 12/9/18 8:43 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > It appears that there are a series of shared patches between the block
> > and device-mapper trees that are not the same commits.  I assume that the
> > block tree has been rebased, while the device mapper tree that was based
> > (or includes) part of the block tree has not bee rebased (yet).
> 
> Yep that's my fault, due to a stupid mistake I had to rebase the
> block tree. Didn't realize that Mike's tree was based on it. Mike,
> would it be a big issue for you to rebase the dm tree?

No problem, just did it and pushed to linux-dm.git's for-next.
(I was already anticipating rebasing dm's for-next again once the
bio-based percpu in_flight was merged into linux-block, hopefully we can
get that to land)
