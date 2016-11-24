From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the powerpc tree with the powerpc-fixes tree
Date: Thu, 24 Nov 2016 13:40:28 +1100
Message-ID: <87fumhtxb7.fsf@concordia.ellerman.id.au>
References: <20161124103606.0333e388@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753917AbcKXCke (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Nov 2016 21:40:34 -0500
In-Reply-To: <20161124103606.0333e388@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/include/asm/asm-prototypes.h
>
> between commit:
>
>   9e5f68842276 ("powerpc: Fix missing CRCs, add more asm-prototypes.h declarations")
>
> from the powerpc-fixes tree and commit:
>
>   82de5797a260 ("powerpc: Remove extraneous header from asm-prototypes.h")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks. I'm planning to merge fixes into next RSN ... as soon as people
stop finding bugs.

cheers
