From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the spi tree
Date: Mon, 28 Aug 2017 14:05:03 +1000
Message-ID: <20170828140503.63b569bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Juergen Gross <jgross@suse.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/Makefile

between commit:

  e9d4650dcc59 ("spi: tools: add install section")

from the spi tree and commit:

  ecda85e70277 ("x86/lguest: Remove lguest support")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc tools/Makefile
index 616e7722b327,a19b176b914b..000000000000
--- a/tools/Makefile
+++ b/tools/Makefile
@@@ -90,8 -89,8 +89,8 @@@ freefall: FORC
  kvm_stat: FORCE
  	$(call descend,kvm/$@)
  
- all: acpi cgroup cpupower gpio hv firewire lguest liblockdep \
+ all: acpi cgroup cpupower gpio hv firewire liblockdep \
 -		perf selftests turbostat usb \
 +		perf selftests spi turbostat usb \
  		virtio vm net x86_energy_perf_policy \
  		tmon freefall objtool kvm_stat
  
@@@ -101,7 -100,7 +100,7 @@@ acpi_install
  cpupower_install:
  	$(call descend,power/$(@:_install=),install)
  
- cgroup_install firewire_install gpio_install hv_install lguest_install perf_install spi_install usb_install virtio_install vm_install net_install objtool_install:
 -cgroup_install firewire_install gpio_install hv_install perf_install usb_install virtio_install vm_install net_install objtool_install:
++cgroup_install firewire_install gpio_install hv_install perf_install spi_install usb_install virtio_install vm_install net_install objtool_install:
  	$(call descend,$(@:_install=),install)
  
  liblockdep_install:
