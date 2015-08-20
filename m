From: David Vrabel <david.vrabel@citrix.com>
Subject: Re: [Xen-devel] linux-next: Tree for Aug 18 (xen/apic)
Date: Thu, 20 Aug 2015 11:42:59 +0100
Message-ID: <55D5AF33.7000606@citrix.com>
References: <20150818214003.73bd846a@canb.auug.org.au>
 <55D3639C.401@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:27672 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbbHTKnC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2015 06:43:02 -0400
In-Reply-To: <55D3639C.401@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org

On 18/08/15 17:55, Randy Dunlap wrote:
> On 08/18/15 04:40, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150817:
>>
> 
> on i386:
> 
> CONFIG_SMP is not enabled.
> # CONFIG_X86_UP_APIC is not set

Thanks for the report.  The below patch fixes this.

8<----------------------
x86/xen: make CONFIG_XEN depend on CONFIG_X86_LOCAL_APIC

Since commit feb44f1f7a4ac299d1ab1c3606860e70b9b89d69 (x86/xen:
Provide a "Xen PV" APIC driver to support >255 VCPUs) Xen guests need
a full APIC driver and thus should depend on X86_LOCAL_APIC.

This fixes an i386 build failure with !SMP && !CONFIG_X86_UP_APIC by
disabling Xen support in this configuration.

Users needing Xen support in a non-SMP i386 kernel will need to enable
CONFIG_X86_UP_APIC.

Signed-off-by: David Vrabel <david.vrabel@citrix.com>
---
 arch/x86/xen/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index e88fda8..4841453 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -8,7 +8,7 @@ config XEN
 	select PARAVIRT_CLOCK
 	select XEN_HAVE_PVMMU
 	depends on X86_64 || (X86_32 && X86_PAE)
-	depends on X86_TSC
+	depends on X86_LOCAL_APIC && X86_TSC
 	help
 	  This is the Linux Xen port.  Enabling this will allow the
 	  kernel to boot in a paravirtualized environment under the
@@ -17,7 +17,7 @@ config XEN
 config XEN_DOM0
 	def_bool y
 	depends on XEN && PCI_XEN && SWIOTLB_XEN
-	depends on X86_LOCAL_APIC && X86_IO_APIC && ACPI && PCI
+	depends on X86_IO_APIC && ACPI && PCI

 config XEN_PVHVM
 	def_bool y
-- 
2.1.4
