From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: build failure
Date: Fri, 07 Nov 2008 15:18:05 -0600
Message-ID: <1226092685.9309.31.camel@localhost.localdomain>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
	 <1226076005.9309.9.camel@localhost.localdomain>
	 <20081107120500.05cfb3a0@zod.rchland.ibm.com>
	 <1226078666.9309.17.camel@localhost.localdomain>
	 <20081107123445.46cf3010@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:52649 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbYKGVSH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 16:18:07 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e36.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mA7LHZZ2016693
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 14:17:35 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA7LI6Yo100332
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 14:18:07 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA7LI6NV031465
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 14:18:06 -0700
In-Reply-To: <20081107123445.46cf3010@zod.rchland.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org

On Fri, 2008-11-07 at 12:34 -0500, Josh Boyer wrote:
> On Fri, 07 Nov 2008 11:24:26 -0600
> Hollis Blanchard <hollisb@us.ibm.com> wrote:
> 
> > I'm not sure if there's precedent for features marked EXPERIMENTAL to be
> > in the defconfig, but simply put I have not done a thorough audit of the
> > KVM 440 code for security or DoS issues. (For example, until yesterday,
> > the guest could trivially flood the host console because I'd left a
> > printk enabled.) It just seems like asking for trouble to enable it in
> > the defconfig.
> 
> If you think it's really in rough enough shape that it's a concern for
> .28, then I can change it back.  Let me know soon.

Well, I'm happy to have the (build) test coverage...

Since KVM can only be invoked via /dev/kvm, and that device node (if
automatically created) only has root permissions, I think it will be OK.

> > That said, I have no complaint about having it enabled for linux-next
> > builds.
> 
> I don't have a separate defconfig for linux-next builds.  We could do
> that but I don't see much value.  I want -next to be building (and
> theoretically testing) what gets built for actual release kernels.

Fair enough.

-- 
Hollis Blanchard
IBM Linux Technology Center
