From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: linux-next: build failure after merge of the thermal tree
Date: Fri, 10 Oct 2014 16:19:14 +0800
Message-ID: <1412929154.3713.74.camel@rzhang1-toshiba>
References: <20141010121435.1a614c2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42574 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174AbaJJITR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Oct 2014 04:19:17 -0400
In-Reply-To: <20141010121435.1a614c2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2014-10-10 at 12:14 +1100, Stephen Rothwell wrote:
> Hi Zhang,
> 
> After merging the thermal tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from /scratch/sfr/next/init/main.c:27:0:
> /scratch/sfr/next/include/linux/acpi.h: In function 'acpi_create_platform_device':
> /scratch/sfr/next/include/linux/acpi.h:528:12: error: parameter name omitted
>      struct acpi_device *)
>             ^
> In file included from /scratch/sfr/next/drivers/i2c/i2c-core.c:54:0:
> /scratch/sfr/next/include/linux/acpi.h: In function 'acpi_create_platform_device':
> /scratch/sfr/next/include/linux/acpi.h:528:12: error: parameter name omitted
>      struct acpi_device *)
>             ^
> 
> And so on ...
> 
> Caused by commit 55fe2ff57c7e ("ACPI: make
> acpi_create_platform_device() an external API").  This build does not
> have CONFIG_ACPI set.  This has come along a bit late. :-(
> 
> I have used the thermal tree from next-20141009 for today.

I've fixed the problem in my tree. Please re-pull.

thanks,
rui
