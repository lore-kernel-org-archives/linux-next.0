From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Date: Wed, 30 Jan 2019 10:43:38 +1100
Message-ID: <20190129234338.GF4205@dastard>
References: <20190130075647.53e86078@canb.auug.org.au>
 <20190129220802.GC4205@dastard>
 <20190130100640.5c2512a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190130100640.5c2512a4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 30, 2019 at 10:06:40AM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Wed, 30 Jan 2019 09:08:02 +1100 Dave Chinner <david@fromorbit.com> wrote:
> >
> > Might be worth adding this to the boiler plate code:
> > 
> > 	This can be fixed by adding the following to your ~/.gitconfig file:
> > 
> > 	[core]
> > 		abbrev = 12
> 
> Actually, since git v2.11 (released Nov 29, 2016), abbrev = auto (which
> is the default) means that the default scales with the size of the
> repository.  For Linus' tree, that currently produces 12 digit commit
> SHA1 abbreviations, but will probably soon become 13.  So the best
> currently, is to *not* set core.abbrev (or set it to something above 12
> (for future robustness).
> 
> See
> https://lore.kernel.org/lkml/20181220000112.24891-1-avarab@gmail.com/

.... and in replying to correct me demonstrates the exact point I
was making - that documenting what configuration should be used to
avoid the warning acheives far more than just reporting an error.

i.e. all those people who /don't follow git development/ and have
working configs that pre-date the "auto mode" or it being made
the default now know the correct way to configure their repository.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
