From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Tue, 23 Dec 2008 11:07:22 +1100
Message-ID: <18768.11194.175787.360371@cargo.ozlabs.ibm.com>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	<1229922804.13001.84.camel@pasglop>
	<1229981967.7181.5.camel@localhost.localdomain>
	<1229982095.4360.19.camel@pasglop>
	<1229983422.7181.7.camel@localhost.localdomain>
	<18768.5298.173232.227168@cargo.ozlabs.ibm.com>
	<1229985853.7181.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:51214 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755279AbYLWAHg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 19:07:36 -0500
In-Reply-To: <1229985853.7181.10.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Josh Boyer <jwboyer@linux.vnet.ibm.com>

Hollis Blanchard writes:

> On Tue, 2008-12-23 at 09:29 +1100, Paul Mackerras wrote:
> > Hollis Blanchard writes:
> > 
> > > > Patch is in Paulus -next already so we'll have to do a manual resolve.
> > > 
> > > Who has to do it? My code should "win".
> > 
> > Do you have your own tree or is all your stuff in the main kvm tree?
> > 
> > If there is a powerpc KVM tree, I could pull that and resolve the
> > conflict, but I don't want to pull all the queued up KVM stuff.
> 
> It's just the main KVM tree.
> 
> > Worst case is Linus gets to resolve the conflict in the merge window.
> > If that's just a matter of him taking your version of the file, it
> > should be within his powers to manage. :)
> 
> Yeah, that's what I meant by "win"... whatever changes Ben made are to
> now-dead code, so the code in kvm.git should be used. Does Linus need
> special instruction to do this, or how does that work?

ppc44x_defconfig now fails to build in my tree because of _tlbil_all
being undefined (it has CONFIG_KVM=y), so I need some sort of fix.
What would happen if I made arch/powerpc/kvm/powerpc.c look like the
version from the KVM tree?

Paul.
