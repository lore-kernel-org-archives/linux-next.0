From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 23 Dec 2008 08:41:35 +1100
Message-ID: <1229982095.4360.19.camel@pasglop>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
	 <1229981967.7181.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:41759 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754741AbYLVVls (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 16:41:48 -0500
In-Reply-To: <1229981967.7181.5.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

On Mon, 2008-12-22 at 15:39 -0600, Hollis Blanchard wrote:
> On Mon, 2008-12-22 at 16:13 +1100, Benjamin Herrenschmidt wrote:
> > On Mon, 2008-12-22 at 14:52 +1100, Stephen Rothwell wrote:
> > > 
> > > The former patch changes the _tlbia() to _tlbil_all() in
> > > kvm_arch_vcpu_put().  The latter restructures this code.
> > > 
> > > I don't know enough to fix this up, so for today I have merely used the
> > > kvm tree version.  Please come up with something better (if needed) and I
> > > can use that as a merge resolution.
> > 
> > Hollis, can you have a look ? I suspect whatever is in the kvm tree is
> > ok, provided it doesn't use the old names such as _tlbia() or _tlbie()
> > which don't exist anymore for nohash...
> 
> I've stopped calling _tlbia() in KVM, so I think the easiest solution
> would be to drop the KVM part of your patch, Ben.

Patch is in Paulus -next already so we'll have to do a manual resolve.
Also, you'll need to include ../mm/mmu_decl.h to get to _tlbil_* ..
sorry about that.

Cheers,
Ben.
