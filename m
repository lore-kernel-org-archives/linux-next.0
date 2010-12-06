From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the sh tree
Date: Mon, 6 Dec 2010 12:47:23 +1100
Message-ID: <20101206124723.72a8cd7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in
arch/sh/Kconfig between commit f020c92de48246510623162fb22d60d91810cc56
("sh: Enable optional gpiolib for all CPUs with pinmux tables") from the
sh tree and commit e3e9887ee9de36d8e2bef972ad74a42abd7a44c4 ("sh: Convert
to USB_ARCH_HAS_OHCI/EHCI selects") from the usb tree.

Just context changes.  I fixed ti up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/sh/Kconfig
index 90cd621,e0e2234..0000000
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@@ -347,7 -344,7 +347,8 @@@ config CPU_SUBTYPE_SH772
  	select CPU_SH3
  	select CPU_HAS_DSP
  	select SYS_SUPPORTS_CMT
 +	select ARCH_WANT_OPTIONAL_GPIOLIB
+ 	select USB_ARCH_HAS_OHCI
  	help
  	  Select SH7720 if you have a SH3-DSP SH7720 CPU.
  
@@@ -461,7 -456,8 +464,9 @@@ config CPU_SUBTYPE_SH778
  	select CPU_SHX3
  	select CPU_HAS_PTEAEX
  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 +	select ARCH_WANT_OPTIONAL_GPIOLIB
+ 	select USB_ARCH_HAS_OHCI
+ 	select USB_ARCH_HAS_EHCI
  
  config CPU_SUBTYPE_SHX3
  	bool "Support SH-X3 processor"
