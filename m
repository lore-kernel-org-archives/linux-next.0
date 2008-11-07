From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure
Date: Fri, 7 Nov 2008 12:34:45 -0500
Message-ID: <20081107123445.46cf3010@zod.rchland.ibm.com>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
	<1226076005.9309.9.camel@localhost.localdomain>
	<20081107120500.05cfb3a0@zod.rchland.ibm.com>
	<1226078666.9309.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e6.ny.us.ibm.com ([32.97.182.146]:59038 "EHLO e6.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751374AbYKGRfQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 12:35:16 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id mA7HbrlD031021
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:37:53 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA7HYwZo143716
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:34:58 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA7HYjCR013238
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:34:46 -0500
In-Reply-To: <1226078666.9309.17.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org

On Fri, 07 Nov 2008 11:24:26 -0600
Hollis Blanchard <hollisb@us.ibm.com> wrote:

> On Fri, 2008-11-07 at 12:05 -0500, Josh Boyer wrote:
> > On Fri, 07 Nov 2008 10:40:05 -0600
> > Hollis Blanchard <hollisb@us.ibm.com> wrote:
> > > 
> > > Hi Stephen, it looks like Josh accidentally set the following options in
> > > ppc44x_defconfig:
> > > +CONFIG_VIRTUALIZATION=y
> > > +CONFIG_KVM=y
> > > +CONFIG_KVM_BOOKE_HOST=y
> > 
> > That wasn't an accident.  I set them based on -rc2 Kconfig values, and
> > enabled it for better build coverage.  Seems it worked. 
> 
> But when you asked me if I thought it was a good idea to enable KVM in
> ppc44x defconfig, I said "no"...

Hm.  I recall you saying "no", and then we had more discussion and
apparently I took that to mean "maybe."

> I'm not sure if there's precedent for features marked EXPERIMENTAL to be
> in the defconfig, but simply put I have not done a thorough audit of the
> KVM 440 code for security or DoS issues. (For example, until yesterday,
> the guest could trivially flood the host console because I'd left a
> printk enabled.) It just seems like asking for trouble to enable it in
> the defconfig.

If you think it's really in rough enough shape that it's a concern for
.28, then I can change it back.  Let me know soon.

EXPERIMENTAL means very little these days because it's used everywhere
and gets forgotten about down the road.  That's more a comment on the
uselessness of EXPERIMENTAL rather than your code, but that's the state
we're at today.  Marking it BROKEN would have prevented me from
enabling it for sure (maybe).

> That said, I have no complaint about having it enabled for linux-next
> builds.

I don't have a separate defconfig for linux-next builds.  We could do
that but I don't see much value.  I want -next to be building (and
theoretically testing) what gets built for actual release kernels.

josh
