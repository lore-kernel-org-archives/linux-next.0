From: Michael Ellerman <michael@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the final tree
 (powerpc related)
Date: Fri, 22 Jun 2012 10:39:56 +1000
Message-ID: <1340325596.9531.1.camel@concordia>
References: <20120620175014.a822a766e0f91f7b44f48fa0@canb.auug.org.au>
	 <1340256961.1998.11.camel@concordia> <1340259896.3942.2.camel@pasglop>
	 <1340262473.1998.19.camel@concordia> <1340264307.1998.20.camel@concordia>
	 <20120621104839.GE20973@bubble.grove.modra.org>
	 <20120621114354.GG20973@bubble.grove.modra.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50504 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760772Ab2FVAj4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jun 2012 20:39:56 -0400
In-Reply-To: <20120621114354.GG20973@bubble.grove.modra.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Modra <amodra@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org

On Thu, 2012-06-21 at 21:13 +0930, Alan Modra wrote:
> On Thu, Jun 21, 2012 at 08:18:39PM +0930, Alan Modra wrote:
> > Linker bug.  That's not a sibling call, but a normal function return
> > via an out-of-line register restore function.
> 
> I couldn't see how this might be occurring, then I remembered the
> kernel has this horrible practise of using ld -r to package object
> files.  So linker generated functions might be munged together with
> other functions.  Does this help?  (It won't if the kernel is
> providing its own save/restore functions.)

The kernel does provide its own AIUI.

cheers
