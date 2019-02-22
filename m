From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the swiotlb tree with the powerpc tree
Date: Fri, 22 Feb 2019 14:17:58 +1100
Message-ID: <87h8cwpl3t.fsf@concordia.ellerman.id.au>
References: <20190222113624.2499244a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222113624.2499244a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Dongli Zhang <dongli.zhang@oracle.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the swiotlb tree got a conflict in:
>
>   kernel/dma/swiotlb.c
>
> between commit:
>
>   feee96440c9c ("swiotlb: remove swiotlb_dma_supported")
>
> from the powerpc tree and commit:
>
>   71602fe6d4e9 ("swiotlb: add debugfs to track swiotlb buffer usage")
>
> from the swiotlb tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

OK thanks. That looks pretty harmless as far as conflicts go.

cheers
