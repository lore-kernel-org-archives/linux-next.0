From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: build failure
Date: Fri, 07 Nov 2008 11:24:26 -0600
Message-ID: <1226078666.9309.17.camel@localhost.localdomain>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
	 <1226076005.9309.9.camel@localhost.localdomain>
	 <20081107120500.05cfb3a0@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e3.ny.us.ibm.com ([32.97.182.143]:40929 "EHLO e3.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750816AbYKGRY2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 12:24:28 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id mA7HOR5P015345
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:24:27 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA7HORNn147974
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:24:27 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA7HOF4H011739
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 12:24:15 -0500
In-Reply-To: <20081107120500.05cfb3a0@zod.rchland.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org

On Fri, 2008-11-07 at 12:05 -0500, Josh Boyer wrote:
> On Fri, 07 Nov 2008 10:40:05 -0600
> Hollis Blanchard <hollisb@us.ibm.com> wrote:
> > 
> > Hi Stephen, it looks like Josh accidentally set the following options in
> > ppc44x_defconfig:
> > +CONFIG_VIRTUALIZATION=y
> > +CONFIG_KVM=y
> > +CONFIG_KVM_BOOKE_HOST=y
> 
> That wasn't an accident.  I set them based on -rc2 Kconfig values, and
> enabled it for better build coverage.  Seems it worked. 

But when you asked me if I thought it was a good idea to enable KVM in
ppc44x defconfig, I said "no"...

I'm not sure if there's precedent for features marked EXPERIMENTAL to be
in the defconfig, but simply put I have not done a thorough audit of the
KVM 440 code for security or DoS issues. (For example, until yesterday,
the guest could trivially flood the host console because I'd left a
printk enabled.) It just seems like asking for trouble to enable it in
the defconfig.

That said, I have no complaint about having it enabled for linux-next
builds.

-- 
Hollis Blanchard
IBM Linux Technology Center
