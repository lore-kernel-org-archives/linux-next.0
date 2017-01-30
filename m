From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc-fixes tree
Date: Mon, 30 Jan 2017 15:00:02 +1100
Message-ID: <87y3xtw62l.fsf@concordia.ellerman.id.au>
References: <20170130134645.5464272d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751281AbdA3EAi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Jan 2017 23:00:38 -0500
In-Reply-To: <20170130134645.5464272d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Paul,
>
> Today's linux-next merge of the rcu tree got a conflict in:
>
>   arch/powerpc/Kconfig
>
> between commit:
>
>   f2574030b0e3 ("powerpc: Revert the initial stack protector support")
>
> from the powerpc-fixes tree and commit:
>
>   c7327406b3c3 ("rcu: Make arch select smp_mb__after_unlock_lock() strength")
>
> from the rcu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

One of these years I'm totally going to sort the selects under config
PPC :/

cheers
