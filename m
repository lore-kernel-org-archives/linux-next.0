From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the pci tree
Date: Thu, 9 Nov 2017 16:53:24 +1100
Message-ID: <20171109165324.51eafb68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  init/Kconfig

between commit:

  03ea2263c2ef ("PCI: Move PCI_QUIRKS to the PCI bus menu")

from the pci tree and patch:

  "EXPERT Kconfig menu: fix broken EXPERT menu"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc init/Kconfig
index 7d5a6fbac56a,a05d8938c016..000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -1378,14 -1308,15 +1308,6 @@@ config ADVISE_SYSCALL
  	  applications use these syscalls, you can disable this option to save
  	  space.
  
- config USERFAULTFD
- 	bool "Enable userfaultfd() system call"
- 	select ANON_INODES
- 	depends on MMU
 -config PCI_QUIRKS
 -	default y
 -	bool "Enable PCI quirk workarounds" if EXPERT
 -	depends on PCI
--	help
- 	  Enable the userfaultfd() system call that allows to intercept and
- 	  handle page faults in userland.
 -	  This enables workarounds for various PCI chipset
 -	  bugs/quirks. Disable this only if your target machine is
 -	  unaffected by PCI quirks.
--
  config MEMBARRIER
  	bool "Enable membarrier() system call" if EXPERT
  	default y
