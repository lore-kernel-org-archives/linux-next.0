From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Tue, 5 Nov 2013 07:54:56 -0500
Message-ID: <20131105125456.GA25219@redhat.com>
References: <20131105135128.496b8b2f599d11f2d30ad70c@canb.auug.org.au>
 <20131105032054.GA19421@redhat.com>
 <20131105143248.551f68c3cd9fe1902860c1ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131105143248.551f68c3cd9fe1902860c1ff@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kmo@daterainc.com>, Jens Axboe <axboe@kernel.dk>, Joe Thornber <ejt@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 04 2013 at 10:32pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mike,
> 
> On Mon, 4 Nov 2013 22:20:54 -0500 Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Mon, Nov 04 2013 at  9:51pm -0500,
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > After merging the device-mapper tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > drivers/md/dm-cache-target.c: In function 'bio_writes_complete_block':
> > > drivers/md/dm-cache-target.c:1020:7: error: 'struct bio' has no member named 'bi_size'
> > >    (bio->bi_size == (cache->sectors_per_block << SECTOR_SHIFT));
> > >        ^
> > > 
> > > Caused by commit 1bd270d800ec ("dm cache: promotion optimisation for
> > > writes") interacting with commit ed2d2f9a8265 ("block: Abstract out bvec
> > > iterator") from the block tree.
> > > 
> > > I applied this fix up patch and can carry it as necessary:
> > 
> > Yes that is needed, as is this (which begs the question: how should I be
> 
> I will add that tomorrow.
> 
> > handling the fact that post-merge changes are needed?  Especially since
> > Linus will need the changes too):
> 
> Who ever gets their tree in last has to tell Linus about these extra
> merge fix ups as part of their pull request.

OK, that's what I thought, thanks for confirming.

Mike
