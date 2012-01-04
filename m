From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 4 Jan 2012 15:07:20 -0800
Message-ID: <20120104230720.GD24583@kroah.com>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:40412 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757264Ab2ADXJV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:09:21 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8F7FE20C53
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:09:20 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Kay Sievers <kay.sievers@vrfy.org>

On Wed, Dec 28, 2011 at 05:45:18PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> arch/powerpc/platforms/cell/spu_base.c: In function 'spu_add_dev_attr':
> arch/powerpc/platforms/cell/spu_base.c:533:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> cc1: all warnings being treated as errors
> arch/powerpc/kernel/sysfs.c: In function 'topology_init':
> arch/powerpc/kernel/sysfs.c:658:22: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c: In function 'register_cpu_online':
> arch/powerpc/kernel/sysfs.c:346:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:380:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:384:22: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:388:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:391:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:394:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:397:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c:400:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> arch/powerpc/kernel/sysfs.c: In function 'cpu_add_dev_attr':
> arch/powerpc/kernel/sysfs.c:532:21: error: ignoring return value of 'device_create_file', declared with attribute warn_unused_result [-Werror=unused-result]
> cc1: all warnings being treated as errors
> 
> Caused by commit 8a25a2fd126c ("cpu: convert 'cpu' and 'machinecheck'
> sysdev_class to a regular subsystem").   Powerpc builds parts of
> arch/powerpc with -Werror.

Ok, I'll take off the warn_unused_result flag for device_create_file for
now, which should solve this, and your other build problems with the
driver-core tree.

> drivers/base/cpu.c: In function 'cpu_is_hotpluggable':
> drivers/base/cpu.c:272:9: error: implicit declaration of function 'get_cpu_sysdev' [-Werror=implicit-function-declaration]
> drivers/base/cpu.c:272:27: warning: initialization makes pointer from integer without a cast [enabled by default]
> drivers/base/cpu.c:273:16: error: 'struct cpu' has no member named 'sysdev'
> drivers/base/cpu.c:273:16: warning: initialization from incompatible pointer type [enabled by default]
> drivers/base/cpu.c:273:16: error: 'struct cpu' has no member named 'sysdev'
> drivers/base/cpu.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
> 
> Caused by the above commit interacting with commit 2987557f52b9
> ("driver-core/cpu: Expose hotpluggability to the rest of the kernel")
> from the tip tree.  This is will fix up in the merge commit next time.

Yeah, nothing I can do here about this, sorry.

So this should fix the build problems in the driver-core-next branch for
linux-next.

thanks,

greg k-h
