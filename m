From: "Liu, Jinsong" <jinsong.liu@intel.com>
Subject: RE: linux-next: build failure after merge of the xen-two tree
Date: Fri, 15 Feb 2013 17:08:24 +0000
Message-ID: <DE8DF0795D48FD4CA783C40EC82923353FBF51@SHSMSX101.ccr.corp.intel.com>
References: <20130215154551.d11e9d376d30d32b9673e6cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:21416 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060Ab3BORJS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Feb 2013 12:09:18 -0500
In-Reply-To: <20130215154551.d11e9d376d30d32b9673e6cc@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "Wu, Fengguang" <fengguang.wu@intel.com>

Stephen Rothwell wrote:
> Hi Konrad,
> 
> After merging the xen-two tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/xen/xen-acpi-memhotplug.c: In function
> 'acpi_memory_get_device': 
> drivers/xen/xen-acpi-memhotplug.c:191:2: error: implicit declaration
> of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
> drivers/xen/xen-acpi-memhotplug.c: At top level: 
> drivers/xen/xen-acpi-memhotplug.c:417:3: warning: initialization from
> incompatible pointer type [enabled by default]
> drivers/xen/xen-acpi-memhotplug.c:417:3: warning: (near
> initialization for 'xen_acpi_memory_device_driver.ops.remove')
> [enabled by default]   
> 
> Caused by commit 259f201cb7ea ("xen/acpi: ACPI memory hotplug").
> 
> drivers/xen/xen-acpi-cpuhotplug.c: In function
> 'acpi_processor_device_add': 
> drivers/xen/xen-acpi-cpuhotplug.c:254:2: error: implicit declaration
> of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
> drivers/xen/xen-acpi-cpuhotplug.c: At top level: 
> drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: initialization from
> incompatible pointer type [enabled by default]
> drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: (near
> initialization for 'xen_acpi_processor_driver.ops.remove') [enabled
> by default]   
> 
> Caused by commit 181232c249f0 ("xen/acpi: ACPI cpu hotplug").
> 
> These commits interacted with commits 636458de36f1 ("ACPI: Remove the
> arguments of acpi_bus_add() that are not used"), 0cd6ac52b333 ("ACPI:
> Make acpi_bus_scan() and acpi_bus_add() take only one argument") and
> b8bd759acd05 ("ACPI / scan: Drop acpi_bus_add() and use
> acpi_bus_scan() 
> instead") from the pm tree.
> 
> I have added this merge fix patch and can carry it as necessary (I did
> *not* fix the warnings above):

Thanks Stephen to fix the confliction between xen and pm tree!
As for the warnings above, I have just sent out a patch 1 minutes ago to fix it.

Regards,
Jinsong

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Feb 2013 15:37:27 +1100
> Subject: [PATCH] xen/acpi: fix up for apci_bus_add api change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/xen/xen-acpi-cpuhotplug.c | 2 +-
>  drivers/xen/xen-acpi-memhotplug.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/xen-acpi-cpuhotplug.c
> b/drivers/xen/xen-acpi-cpuhotplug.c 
> index 9eefbb0..0db4722 100644
> --- a/drivers/xen/xen-acpi-cpuhotplug.c
> +++ b/drivers/xen/xen-acpi-cpuhotplug.c
> @@ -251,7 +251,7 @@ int acpi_processor_device_add(acpi_handle handle,
>  	struct acpi_device **device) if (acpi_bus_get_device(phandle,
>  		&pdev)) return -ENODEV;
> 
> -	if (acpi_bus_add(device, pdev, handle, ACPI_BUS_TYPE_PROCESSOR))
> +	if (acpi_bus_scan(handle))
>  		return -ENODEV;
> 
>  	return 0;
> diff --git a/drivers/xen/xen-acpi-memhotplug.c
> b/drivers/xen/xen-acpi-memhotplug.c 
> index 678680c..164287b 100644
> --- a/drivers/xen/xen-acpi-memhotplug.c
> +++ b/drivers/xen/xen-acpi-memhotplug.c
> @@ -188,7 +188,7 @@ acpi_memory_get_device(acpi_handle handle,
>  	 * Now add the notified device.  This creates the acpi_device
>  	 * and invokes .add function
>  	 */
> -	result = acpi_bus_add(&device, pdevice, handle,
> ACPI_BUS_TYPE_DEVICE); +	result = acpi_bus_scan(handle);
>  	if (result) {
>  		pr_warn(PREFIX "Cannot add acpi bus\n");
>  		return -EINVAL;
> --
> 1.8.1
