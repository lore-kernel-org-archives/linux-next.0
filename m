From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 23 Dec 2008 09:11:05 +1100
Message-ID: <1229983865.4360.23.camel@pasglop>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
	 <1229981967.7181.5.camel@localhost.localdomain>
	 <1229982095.4360.19.camel@pasglop>
	 <1229983422.7181.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:59383 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758850AbYLVWLU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 17:11:20 -0500
In-Reply-To: <1229983422.7181.7.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>

On Mon, 2008-12-22 at 16:03 -0600, Hollis Blanchard wrote:
> > Patch is in Paulus -next already so we'll have to do a manual
> resolve.
> 
> Who has to do it? My code should "win".

I don't understand. There is no "win" or "lose" here, just somebody who
has to fixup the merge conflict :-) In any case I don't see why any code
should "win" here.

Shouldn't be hard, we just need to sync with paulus who pulls what tree
in what tree to solve it. Maybe we can pull kvm into powerpc and solve
it there or something like that ?

The other solution is to rebase powerpc and change the patch but that's
evil, we always avoid rebasing, it hurts too many people.

> > Also, you'll need to include ../mm/mmu_decl.h to get to _tlbil_* ..
> > sorry about that.
> 
> I don't want _tlb anything; I was only using _tlbia(), and I'm not any
> more.

Ok. I got confused by another mail about undefined _tlbil_all() which
was probably another fix for that same stuff.

Cheers,
Ben.
