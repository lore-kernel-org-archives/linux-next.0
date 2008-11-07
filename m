From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure
Date: Fri, 7 Nov 2008 12:05:00 -0500
Message-ID: <20081107120500.05cfb3a0@zod.rchland.ibm.com>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
	<1226076005.9309.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:49382 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753001AbYKGRFU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 12:05:20 -0500
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com [9.17.195.107])
	by e34.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mA7H4wmh002035
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 10:04:58 -0700
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA7H5Gr8084052
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 10:05:16 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA7H5CM7008253
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 10:05:13 -0700
In-Reply-To: <1226076005.9309.9.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org

On Fri, 07 Nov 2008 10:40:05 -0600
Hollis Blanchard <hollisb@us.ibm.com> wrote:

> On Fri, 2008-11-07 at 20:25 +1100, Stephen Rothwell wrote:
> > Hi Avi,
> > 
> > Today's linux-next build (powerpc ppc44x_config) failed like this:
> > 
> > arch/powerpc/kvm/built-in.o: In function `kvm_vcpu_ioctl':
> > kvm_main.c:(.text+0x890): undefined reference to `kvm_arch_vcpu_ioctl_get_sregs'
> [...]
> 
> > I have reverted the merge of the kvm tree for today.
> 
> Hi Stephen, it looks like Josh accidentally set the following options in
> ppc44x_defconfig:
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=y
> +CONFIG_KVM_BOOKE_HOST=y

That wasn't an accident.  I set them based on -rc2 Kconfig values, and
enabled it for better build coverage.  Seems it worked. 

> 
> http://git.kernel.org/?p=linux/kernel/git/jwboyer/powerpc-4xx.git;a=commitdiff;h=8531b7a805833649591fa324cadbab7d6b667f4b
> 
> Since then, CONFIG_KVM_BOOKE_HOST was renamed to CONFIG_KVM_440.
> Unfortunately I don't have the right Kconfig constraint in place to
> catch that, leading to this problem. I will submit a patch for this
> today.

Thanks.

josh
