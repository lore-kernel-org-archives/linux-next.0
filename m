From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: manual merge of the kvm tree
Date: Mon, 22 Dec 2008 16:03:42 -0600
Message-ID: <1229983422.7181.7.camel@localhost.localdomain>
References: <20081222145255.17f885f2.sfr@canb.auug.org.au>
	 <1229922804.13001.84.camel@pasglop>
	 <1229981967.7181.5.camel@localhost.localdomain>
	 <1229982095.4360.19.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:47899 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758900AbYLVWDo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 17:03:44 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e33.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mBMM2w1q019071
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 15:02:58 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mBMM3hdu209324
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 15:03:43 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mBMM3g2o005682
	for <linux-next@vger.kernel.org>; Mon, 22 Dec 2008 15:03:43 -0700
In-Reply-To: <1229982095.4360.19.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

On Tue, 2008-12-23 at 08:41 +1100, Benjamin Herrenschmidt wrote:
> On Mon, 2008-12-22 at 15:39 -0600, Hollis Blanchard wrote:
> > On Mon, 2008-12-22 at 16:13 +1100, Benjamin Herrenschmidt wrote:
> > > On Mon, 2008-12-22 at 14:52 +1100, Stephen Rothwell wrote:
> > > > 
> > > > The former patch changes the _tlbia() to _tlbil_all() in
> > > > kvm_arch_vcpu_put().  The latter restructures this code.
> > > > 
> > > > I don't know enough to fix this up, so for today I have merely used the
> > > > kvm tree version.  Please come up with something better (if needed) and I
> > > > can use that as a merge resolution.
> > > 
> > > Hollis, can you have a look ? I suspect whatever is in the kvm tree is
> > > ok, provided it doesn't use the old names such as _tlbia() or _tlbie()
> > > which don't exist anymore for nohash...
> > 
> > I've stopped calling _tlbia() in KVM, so I think the easiest solution
> > would be to drop the KVM part of your patch, Ben.
> 
> Patch is in Paulus -next already so we'll have to do a manual resolve.

Who has to do it? My code should "win".

> Also, you'll need to include ../mm/mmu_decl.h to get to _tlbil_* ..
> sorry about that.

I don't want _tlb anything; I was only using _tlbia(), and I'm not any
more.

-- 
Hollis Blanchard
IBM Linux Technology Center
