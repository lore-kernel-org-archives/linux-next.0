From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: [PATCH][BUILD FAILURE 03/12] Re: Next April 21 : PPC64 randconfig [arch/powerpc/kernel/of_platform.o]
Date: Wed, 22 Apr 2009 21:46:48 +0530
Message-ID: <20090422161648.9231.76057.sendpatchset@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e1.ny.us.ibm.com ([32.97.182.141]:42197 "EHLO e1.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752143AbZDVQQ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 12:16:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, Michael Ellerman <michael@ellerman.id.au>

On Wed, 2009-04-22 at 00:20 +0530, Subrata Modak wrote:
> Reported this earlier on 14th April 2009:
> http://lkml.org/lkml/2009/4/14/480,
>=20
> Michael,
>=20
> Any fix in sight ?
> http://lkml.org/lkml/2009/4/14/676,
>=20
> CC      arch/powerpc/kernel/of_platform.o
> arch/powerpc/kernel/of_platform.c: In function 'of_pci_phb_probe':
> arch/powerpc/kernel/of_platform.c:270: error: implicit declaration of
> function 'pci_devs_phb_init_dynamic'
> arch/powerpc/kernel/of_platform.c:279: error: implicit declaration of
> function 'scan_phb'
> arch/powerpc/kernel/of_platform.c:295: error: implicit declaration of
> function 'pci_bus_add_devices'
> make[1]: *** [arch/powerpc/kernel/of_platform.o] Error 1
> make: *** [arch/powerpc/kernel] Error 2
> ---

Well, 'pci_devs_phb_init_dynamic', 'scan_phb' & 'pci_bus_add_devices'
has been defined at ./arch/powerpc/include/asm/ppc-pci.h, but as
	#ifdef CONFIG_PCI
the reason for which the declarations were not visible. And these
would churn out few additional failures also for PPC build, like:

CC      arch/powerpc/kernel/pci_dn.o
arch/powerpc/kernel/pci_dn.c:82: error: expected declaration specifiers=
 or =E2=80=98...=E2=80=99 before =E2=80=98traverse_func=E2=80=99
arch/powerpc/kernel/pci_dn.c: In function =E2=80=98traverse_pci_devices=
=E2=80=99:
arch/powerpc/kernel/pci_dn.c:97: error: =E2=80=98pre=E2=80=99 undeclare=
d (first use in this function)
arch/powerpc/kernel/pci_dn.c:97: error: (Each undeclared identifier is =
reported only once
arch/powerpc/kernel/pci_dn.c:97: error: for each function it appears in=
=2E)
arch/powerpc/kernel/pci_dn.c:97: error: implicit declaration of functio=
n =E2=80=98pre=E2=80=99
arch/powerpc/kernel/pci_dn.c:97: warning: assignment makes pointer from=
 integer without a cast
arch/powerpc/kernel/pci_dn.c: In function =E2=80=98pci_devs_phb_init_dy=
namic=E2=80=99:
arch/powerpc/kernel/pci_dn.c:143: error: too many arguments to function=
 =E2=80=98traverse_pci_devices=E2=80=99
arch/powerpc/kernel/pci_dn.c: In function =E2=80=98fetch_dev_dn=E2=80=99=
:
arch/powerpc/kernel/pci_dn.c:180: error: too many arguments to function=
 =E2=80=98traverse_pci_devices=E2=80=99
arch/powerpc/kernel/pci_dn.c: In function =E2=80=98pci_devs_phb_init=E2=
=80=99:
arch/powerpc/kernel/pci_dn.c:224: error: =E2=80=98hose_list=E2=80=99 un=
declared (first use in this function)
make[1]: *** [arch/powerpc/kernel/pci_dn.o] Error 1
make: *** [arch/powerpc/kernel/pci_dn.o] Error 2
---
CC      arch/powerpc/platforms/pseries/pci_dlpar.o
arch/powerpc/platforms/pseries/pci_dlpar.c: In function =E2=80=98pcibio=
s_remove_pci_devices=E2=80=99:
arch/powerpc/platforms/pseries/pci_dlpar.c:88: error: implicit declarat=
ion of function =E2=80=98pci_remove_bus_device=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c: In function =E2=80=98pcibio=
s_add_pci_devices=E2=80=99:
arch/powerpc/platforms/pseries/pci_dlpar.c:121: error: implicit declara=
tion of function =E2=80=98pci_scan_slot=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c:130: error: implicit declara=
tion of function =E2=80=98pci_scan_bridge=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c: In function =E2=80=98init_p=
hb_dynamic=E2=80=99:
arch/powerpc/platforms/pseries/pci_dlpar.c:146: error: implicit declara=
tion of function =E2=80=98rtas_setup_phb=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c:149: error: implicit declara=
tion of function =E2=80=98pci_devs_phb_init_dynamic=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c:154: error: implicit declara=
tion of function =E2=80=98scan_phb=E2=80=99
arch/powerpc/platforms/pseries/pci_dlpar.c: In function =E2=80=98remove=
_phb_dynamic=E2=80=99:
arch/powerpc/platforms/pseries/pci_dlpar.c:191: error: implicit declara=
tion of function =E2=80=98pci_remove_bus=E2=80=99
make[1]: *** [arch/powerpc/platforms/pseries/pci_dlpar.o] Error 1
make: *** [arch/powerpc/platforms/pseries/pci_dlpar.o] Error 2
---

The following patch attempts to fix them all. I had tested them. Please=
 review.

Signed-Off-By: Subrata Modak <subrata@linux.vnet.ibm.com>,
To: Paul Mackerras <paulus@samba.org>
To: Linuxppc-dev <Linuxppc-dev@ozlabs.org>
Cc: Michael Ellerman <michael@ellerman.id.au>
Cc: Balbir Singh <balbir@linux.vnet.ibm.com>
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
---

--- linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/kernel/of_pla=
tform.c.orig	2009-04-22 09:50:32.000000000 -0500
+++ linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/kernel/of_pla=
tform.c	2009-04-22 10:06:52.000000000 -0500
@@ -230,7 +230,7 @@ struct of_device *of_find_device_by_phan
 EXPORT_SYMBOL(of_find_device_by_phandle);
=20
=20
-#ifdef CONFIG_PPC_OF_PLATFORM_PCI
+#if defined(CONFIG_PPC_OF_PLATFORM_PCI) && defined(CONFIG_PCI)
=20
 /* The probing of PCI controllers from of_platform is currently
  * 64 bits only, mostly due to gratuitous differences between
--- linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/kernel/pci_dn=
=2Ec.orig	2009-04-22 10:07:21.000000000 -0500
+++ linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/kernel/pci_dn=
=2Ec	2009-04-22 10:09:10.000000000 -0500
@@ -35,6 +35,8 @@
  * Traverse_func that inits the PCI fields of the device node.
  * NOTE: this *must* be done before read/write config to the device.
  */
+
+#ifdef CONFIG_PCI
 static void * __devinit update_dn_pci_info(struct device_node *dn, voi=
d *data)
 {
 	struct pci_controller *phb =3D data;
@@ -226,3 +228,4 @@ void __init pci_devs_phb_init(void)
=20
 	pSeries_reconfig_notifier_register(&pci_dn_reconfig_nb);
 }
+#endif
--- linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/platforms/pse=
ries/pci_dlpar.c.orig	2009-04-22 10:10:26.000000000 -0500
+++ linux-2.6.30-rc2-next20090421-randconfig/arch/powerpc/platforms/pse=
ries/pci_dlpar.c	2009-04-22 10:12:23.000000000 -0500
@@ -33,6 +33,7 @@
 #include <asm/firmware.h>
 #include <asm/eeh.h>
=20
+#ifdef CONFIG_PCI
 static struct pci_bus *
 find_bus_among_children(struct pci_bus *bus,
                         struct device_node *dn)
@@ -208,3 +209,4 @@ int remove_phb_dynamic(struct pci_contro
 	return 0;
 }
 EXPORT_SYMBOL_GPL(remove_phb_dynamic);
+#endif

---
Regards--
Subrata
