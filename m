From: KY Srinivasan <kys@microsoft.com>
Subject: RE: linux-next: Tree for May 4 (hyperv / vmbus)
Date: Wed, 4 May 2011 16:56:02 +0000
Message-ID: <6E21E5352C11B742B20C142EB499E0481DFD54@TK5EX14MBXC124.redmond.corp.microsoft.com>
References: <20110504144759.802483cc.sfr@canb.auug.org.au>
 <20110504094908.b8295d22.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110504094908.b8295d22.randy.dunlap@oracle.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "gregkh@suse.de" <gregkh@suse.de>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: devel-bounces@linuxdriverproject.org [mailto:devel-
> bounces@linuxdriverproject.org] On Behalf Of Randy Dunlap
> Sent: Wednesday, May 04, 2011 12:49 PM
> To: Stephen Rothwell; driverdevel; gregkh@suse.de
> Cc: Haiyang Zhang; linux-next@vger.kernel.org; LKML
> Subject: Re: linux-next: Tree for May 4 (hyperv / vmbus)
> 
> On Wed, 4 May 2011 14:47:59 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> >
> > Changes since 20110503:
> 
> 
> when CONFIG_ACPI is not enabled:
> 
> 
> drivers/staging/hv/vmbus_drv.c:736: warning: 'struct acpi_device' declared inside
> parameter list
> drivers/staging/hv/vmbus_drv.c:736: warning: its scope is only this definition or
> declaration, which is probably not what you want
> drivers/staging/hv/vmbus_drv.c: In function 'vmbus_acpi_add':
> drivers/staging/hv/vmbus_drv.c:741: error: dereferencing pointer to incomplete
> type
> drivers/staging/hv/vmbus_drv.c: At top level:
> drivers/staging/hv/vmbus_drv.c:758: error: variable 'vmbus_acpi_driver' has
> initializer but incomplete type
> drivers/staging/hv/vmbus_drv.c:759: error: unknown field 'name' specified in
> initializer
> drivers/staging/hv/vmbus_drv.c:759: warning: excess elements in struct initializer
> drivers/staging/hv/vmbus_drv.c:759: warning: (near initialization for
> 'vmbus_acpi_driver')
> drivers/staging/hv/vmbus_drv.c:760: error: unknown field 'ids' specified in
> initializer
> drivers/staging/hv/vmbus_drv.c:760: warning: excess elements in struct initializer
> drivers/staging/hv/vmbus_drv.c:760: warning: (near initialization for
> 'vmbus_acpi_driver')
> drivers/staging/hv/vmbus_drv.c:761: error: unknown field 'ops' specified in
> initializer
> drivers/staging/hv/vmbus_drv.c:761: error: extra brace group at end of initializer
> drivers/staging/hv/vmbus_drv.c:761: error: (near initialization for
> 'vmbus_acpi_driver')
> drivers/staging/hv/vmbus_drv.c:763: warning: excess elements in struct initializer
> drivers/staging/hv/vmbus_drv.c:763: warning: (near initialization for
> 'vmbus_acpi_driver')
> drivers/staging/hv/vmbus_drv.c: In function 'vmbus_acpi_init':
> drivers/staging/hv/vmbus_drv.c:771: error: implicit declaration of function
> 'acpi_bus_register_driver'
> drivers/staging/hv/vmbus_drv.c: In function 'vmbus_acpi_exit':
> drivers/staging/hv/vmbus_drv.c:780: error: implicit declaration of function
> 'acpi_bus_unregister_driver'
> make[4]: *** [drivers/staging/hv/vmbus_drv.o] Error 1
> make[3]: *** [drivers/staging/hv] Error 2
> 
> 
> 
> 
> 
> vmbus_drv.c sure looks like it requires (depends on) both ACPI and PCI.
> That should be expressed somewhere in its Kconfig file.

Greg,

Do you want me to send you a patch to fix this?

Regards,

K. Y
> 
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code
> ***
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/devel
