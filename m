From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the dma-mapping tree
Date: Fri, 22 Feb 2019 14:43:41 +1100
Message-ID: <87ef80pjwy.fsf@concordia.ellerman.id.au>
References: <20190222091728.6d3d9877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222091728.6d3d9877@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/kernel/dma-swiotlb.c
>
> between commit:
>
>   cfced786969c ("dma-mapping: remove the default map_resource implementation")
>
> from the dma-mapping tree and commit:
>
>   68005b67d15a ("powerpc/dma: use the generic direct mapping bypass")
>
> from the powerpc tree.
>
> I fixed it up (I just used the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks.

Christoph, I've put the powerpc dma changes in a topic branch if you
want to merge it to reduce the conflicts. Up to you.

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/dma


cheers
