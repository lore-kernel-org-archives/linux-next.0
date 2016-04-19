From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the livepatching tree with the
 powerpc tree
Date: Tue, 19 Apr 2016 11:56:19 +1000
Message-ID: <1461030979.25103.4.camel@ellerman.id.au>
References: <20160418142749.3a5910c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52627 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbcDSB4W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 21:56:22 -0400
In-Reply-To: <20160418142749.3a5910c6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jikos@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>

On Mon, 2016-04-18 at 14:27 +1000, Stephen Rothwell wrote:
> Hi Jiri,
> 
> Today's linux-next merge of the livepatching tree got a conflict in:
> 
>   arch/powerpc/kernel/process.c
> 
> between commit:
> 
>   7f92bc569455 ("powerpc: sparse: Include headers for __weak symbols")
> 
> from the powerpc tree and commit:
> 
>   5d31a96e6c01 ("powerpc/livepatch: Add livepatch stack to struct thread_info")
> 
> from the livepatching tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

This should go away tomorrow because then my next will have the topic branch
merged.

cheers
