From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: build failure
Date: Fri, 07 Nov 2008 10:40:05 -0600
Message-ID: <1226076005.9309.9.camel@localhost.localdomain>
References: <20081107202541.85d6a823.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:47007 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752800AbYKGQkI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 11:40:08 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mA7Ge6lf032583
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 11:40:06 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA7Ge7CP084016
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 11:40:07 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA7Ge6bb024976
	for <linux-next@vger.kernel.org>; Fri, 7 Nov 2008 11:40:06 -0500
In-Reply-To: <20081107202541.85d6a823.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Josh Boyer <jwboyer@linux.vnet.ibm.com>

On Fri, 2008-11-07 at 20:25 +1100, Stephen Rothwell wrote:
> Hi Avi,
> 
> Today's linux-next build (powerpc ppc44x_config) failed like this:
> 
> arch/powerpc/kvm/built-in.o: In function `kvm_vcpu_ioctl':
> kvm_main.c:(.text+0x890): undefined reference to `kvm_arch_vcpu_ioctl_get_sregs'
[...]

> I have reverted the merge of the kvm tree for today.

Hi Stephen, it looks like Josh accidentally set the following options in
ppc44x_defconfig:
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_KVM_BOOKE_HOST=y

http://git.kernel.org/?p=linux/kernel/git/jwboyer/powerpc-4xx.git;a=commitdiff;h=8531b7a805833649591fa324cadbab7d6b667f4b

Since then, CONFIG_KVM_BOOKE_HOST was renamed to CONFIG_KVM_440.
Unfortunately I don't have the right Kconfig constraint in place to
catch that, leading to this problem. I will submit a patch for this
today.

-- 
Hollis Blanchard
IBM Linux Technology Center
