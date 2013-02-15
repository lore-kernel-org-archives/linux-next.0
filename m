From: "Liu, Jinsong" <jinsong.liu@intel.com>
Subject: RE: linux-next: build failure after merge of the xen-two tree
Date: Fri, 15 Feb 2013 17:20:07 +0000
Message-ID: <DE8DF0795D48FD4CA783C40EC82923353FBF85@SHSMSX101.ccr.corp.intel.com>
References: <20130215154551.d11e9d376d30d32b9673e6cc@canb.auug.org.au>
 <20130215132624.GB11777@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130215132624.GB11777@phenom.dumpdata.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "Wu, Fengguang" <fengguang.wu@intel.com>, "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>
List-Id: linux-next.vger.kernel.org

Konrad Rzeszutek Wilk wrote:
> On Fri, Feb 15, 2013 at 03:45:51PM +1100, Stephen Rothwell wrote:
>> Hi Konrad,
>> 
>> After merging the xen-two tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
> 
> Good morning!
>> 
>> drivers/xen/xen-acpi-memhotplug.c: In function
>> 'acpi_memory_get_device': 
>> drivers/xen/xen-acpi-memhotplug.c:191:2: error: implicit declaration
>> of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
>> drivers/xen/xen-acpi-memhotplug.c: At top level: 
>> drivers/xen/xen-acpi-memhotplug.c:417:3: warning: initialization
>> from incompatible pointer type [enabled by default]
>> drivers/xen/xen-acpi-memhotplug.c:417:3: warning: (near
>> initialization for 'xen_acpi_memory_device_driver.ops.remove')
>> [enabled by default]   
>> 
>> Caused by commit 259f201cb7ea ("xen/acpi: ACPI memory hotplug").
>> 
>> drivers/xen/xen-acpi-cpuhotplug.c: In function
>> 'acpi_processor_device_add': 
>> drivers/xen/xen-acpi-cpuhotplug.c:254:2: error: implicit declaration
>> of function 'acpi_bus_add' [-Werror=implicit-function-declaration]
>> drivers/xen/xen-acpi-cpuhotplug.c: At top level: 
>> drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: initialization
>> from incompatible pointer type [enabled by default]
>> drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: (near
>> initialization for 'xen_acpi_processor_driver.ops.remove') [enabled
>> by default]   
>> 
>> Caused by commit 181232c249f0 ("xen/acpi: ACPI cpu hotplug").
> 
> Grrrreat! Jinsong, can you please fix that ? A patch on top of the
> #linux-next
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 

Done, warning fixed.

Thanks,
Jinsong