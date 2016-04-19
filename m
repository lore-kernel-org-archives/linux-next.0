From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the livepatching tree with Linus'
 tree
Date: Tue, 19 Apr 2016 11:57:34 +1000
Message-ID: <1461031054.25103.6.camel@ellerman.id.au>
References: <20160418142323.26fa9ae1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160418142323.26fa9ae1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Li Zhang <zhlcindy@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2016-04-18 at 14:23 +1000, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the livepatching tree got a conflict in:
> 
>   arch/powerpc/Kconfig
> 
> between commit:
> 
>   7f2bd0063342 ("powerpc/mm: enable page parallel initialisation")
> 
> from Linus' tree and commit:
> 
>   85baa095497f ("powerpc/livepatch: Add live patching support on ppc64le")
> 
> from the livepatching tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> Maybe the selects under config PPC should be sorted ...

Hmm maybe. I guess it reduces the likelyhood of two new additions clashing
slightly.

cheers
