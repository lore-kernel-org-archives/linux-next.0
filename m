From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 24 Mar 2009 18:38:00 -0700
Message-ID: <20090324183800.6ba50715@hobbes.virtuouswap>
References: <20090323124948.fed84e3a.sfr@canb.auug.org.au>
	<20090325122121.225a0ccb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-40.bluehost.com ([69.89.20.194]:41298 "HELO
	outbound-mail-40.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752422AbZCYBot (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2009 21:44:49 -0400
In-Reply-To: <20090325122121.225a0ccb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

On Wed, 25 Mar 2009 12:21:21 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> On Mon, 23 Mar 2009 12:49:48 +1100 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > arch/powerpc/kernel/msi.c: In function 'arch_msi_check_device':
> > arch/powerpc/kernel/msi.c:23: error: 'PCI_CAP_ID_MSI' undeclared
> > (first use in this function)
> > 
> > Caused by commit 1c8d7b0a562da06d3ebe83f01b1ed553205d1ae4 ("PCI
> > MSI: Add support for multiple MSI").  PCI_CAP_ID_MSI is defined in
> > linux/pci_regs.h which is included by linux/pci.h, but neither is
> > included by arch/powerpc/kernel/msi.c.
> > 
> > I have used the version of the pci tree from next-20090320 for
> > today.
> 
> This is still happening ...

Does this fix it?  Some header file changes must be to blame...

diff --git a/arch/powerpc/kernel/msi.c b/arch/powerpc/kernel/msi.c
index 0c16e2a..8bbc12d 100644
--- a/arch/powerpc/kernel/msi.c
+++ b/arch/powerpc/kernel/msi.c
@@ -9,6 +9,7 @@

 #include <linux/kernel.h>
 #include <linux/msi.h>
+#include <linux/pci.h>

 #include <asm/machdep.h>



-- 
Jesse Barnes, Intel Open Source Technology Center
