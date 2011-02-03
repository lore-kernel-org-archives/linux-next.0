From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Thu, 3 Feb 2011 09:19:54 -0600 (CST)
Message-ID: <alpine.DEB.2.00.1102030919380.6519@router.home>
References: <20110131144246.dfa2abe3.sfr@canb.auug.org.au> <1296502339.30654.13.camel@jaguar>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1296502339.30654.13.camel@jaguar>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Tso <tytso@MIT.EDU>
List-Id: linux-next.vger.kernel.org

On Mon, 31 Jan 2011, Pekka Enberg wrote:

> On Mon, 2011-01-31 at 14:42 +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the slab tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > fs/ext4/mballoc.c: In function 'ext4_exit_mballoc':
> > fs/ext4/mballoc.c:2750: error: implicit declaration of function 'kmem_cache_name'
> > fs/ext4/mballoc.c:2750: warning: cast to pointer from integer of different size
> >
> > Caused by commit 63310467a3d1ed6a0460ec1f4268126cd1ceec2e ("mm: Remove
> > support for kmem_cache_name()").  Clearly the last user has not gone, yet.
> >
> > I have used the version of the slab tree from next-20110121 for today.
>
> Christoph, Ted? Should I revert the patch from slab.git?

Maybe the ext4 patch is not in -next yet?
