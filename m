From: Alan Modra <amodra@gmail.com>
Subject: Re: linux-next: build failure after merge of the final tree (powerpc
 related)
Date: Thu, 21 Jun 2012 20:18:39 +0930
Message-ID: <20120621104839.GE20973@bubble.grove.modra.org>
References: <20120620175014.a822a766e0f91f7b44f48fa0@canb.auug.org.au>
 <1340256961.1998.11.camel@concordia>
 <1340259896.3942.2.camel@pasglop>
 <1340262473.1998.19.camel@concordia>
 <1340264307.1998.20.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:55230 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755817Ab2FUKsr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 06:48:47 -0400
Content-Disposition: inline
In-Reply-To: <1340264307.1998.20.camel@concordia>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org

On Thu, Jun 21, 2012 at 05:38:27PM +1000, Michael Ellerman wrote:
> On Thu, 2012-06-21 at 17:07 +1000, Michael Ellerman wrote:
> > On Thu, 2012-06-21 at 16:24 +1000, Benjamin Herrenschmidt wrote:
> > > On Thu, 2012-06-21 at 15:36 +1000, Michael Ellerman wrote:
> > > > 
> > > > powerpc64-linux-ld: /src/next/net/openvswitch/vport-netdev.c:189:(.text+0x89b990): 
> > > >         sibling call optimization to `_restgpr0_28' does not allow automatic multiple TOCs;
> > > >         recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `_restgpr0_28' extern
> > > > 

Linker bug.  That's not a sibling call, but a normal function return
via an out-of-line register restore function.  Will fix.  I'm a bit
surprised to see this with gcc-4.6 though.  Or does this gcc-4.6 have
some of my recent mainline gcc patches enabling out-of-line
save/restore functions for -Os?

-- 
Alan Modra
Australia Development Lab, IBM
