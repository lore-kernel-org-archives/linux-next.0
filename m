From: Ted Ts'o <tytso@mit.edu>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Tue, 8 Feb 2011 11:50:28 -0500
Message-ID: <20110208165028.GA9533@thunk.org>
References: <20110131144246.dfa2abe3.sfr@canb.auug.org.au>
 <1296502339.30654.13.camel@jaguar>
 <alpine.DEB.2.00.1102030919380.6519@router.home>
 <alpine.DEB.2.00.1102080952490.13202@router.home>
 <alpine.DEB.2.00.1102080954330.13649@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1102080954330.13649@router.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Feb 08, 2011 at 09:55:48AM -0600, Christoph Lameter wrote:
> Argh. I accidentally sent an older version of the patch. This one is the
> tested one.
> 
> Subject: ext4: Remove use of kmem_cache_name
> 
> Remove the use of kmem_cache_name from ext4. In order to do that we need to
> strdup the name of the cache passed to kmem_cache_create.

There is a patch for this that Eric Sandeen has done which I've pushed
to Linus already.

Part of the problem is that some of the slab allocators call strdup,
and some don't.  So the only solution is to pass in a const,
statically allocated name.....

							- Ted
