From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging/lustre: fix build errors
Date: Wed, 5 Jun 2013 14:07:21 +0300
Message-ID: <20130605110721.GV28112@mwanda>
References: <1882637210201641A747464075FFC6490E57F19F@MX101CL02.corp.emc.com>
 <20130605104250.b332e5e9db6c4e458130abd0@canb.auug.org.au>
 <1882637210201641A747464075FFC6490E580820@MX101CL02.corp.emc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:33877 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752978Ab3FELHk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Jun 2013 07:07:40 -0400
Content-Disposition: inline
In-Reply-To: <1882637210201641A747464075FFC6490E580820@MX101CL02.corp.emc.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Peng, Tao" <tao.peng@emc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andreas Dilger <andreas.dilger@intel.com>

On Wed, Jun 05, 2013 at 10:36:20AM +0000, Peng, Tao wrote:
> > > Stephen, please see if this fixes your build failure. I have tested it locally but only on X86
> > architecture, with CONFIG_CPUMASK_OFFSTACK on and CONFIG_MODULES/CONFIG_MODULE_UNLOAD off.
> > 
> > I have tried this with an x86_64 allmodconfig build and now I get just
> > this build problem:
> > 
> > drivers/built-in.o: In function `crc32_pclmul_le_16':
> > (.text+0x28b9310): multiple definition of `crc32_pclmul_le_16'
> > arch/x86/built-in.o:(.text+0xe70d0): first defined here
> > 
> We should really remove the crypto implementations inside Lustre
> code. I have a patch to do that and Andreas is helping review it.
> Once done, I will send it out.

Hopefully, it will be ready for tomorrow's linux-next?  x86_64
allmodconfig is one of the most common ways to build a kernel.

regards,
dan carpenter
