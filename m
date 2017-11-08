From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the net-next
 tree
Date: Wed, 8 Nov 2017 14:29:57 +1100
Message-ID: <20171108142957.5cb6caa3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750735AbdKHDaA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Nov 2017 22:30:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>

Hi Darren,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  tools/Makefile

between commit:

  a92bb546cff0 ("tools: rename tools/net directory to tools/bpf")

from the net-next tree and commit:

  9d64fc08f6fe ("tools/wmi: add a sample for dell smbios communication over WMI")

from the drivers-x86 tree.

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
index c03b4f69d5b7,9d2fd2606810..000000000000
--- a/tools/Makefile
+++ b/tools/Makefile
@@@ -58,7 -58,7 +59,7 @@@ acpi: FORC
  cpupower: FORCE
  	$(call descend,power/$@)
  
- cgroup firewire hv guest spi usb virtio vm bpf iio gpio objtool leds: FORCE
 -cgroup firewire hv guest spi usb virtio vm net iio gpio objtool leds wmi: FORCE
++cgroup firewire hv guest spi usb virtio vm bpf iio gpio objtool leds wmi: FORCE
  	$(call descend,$@)
  
  liblockdep: FORCE
@@@ -92,8 -92,8 +93,8 @@@ kvm_stat: FORC
  
  all: acpi cgroup cpupower gpio hv firewire liblockdep \
  		perf selftests spi turbostat usb \
 -		virtio vm net x86_energy_perf_policy \
 +		virtio vm bpf x86_energy_perf_policy \
- 		tmon freefall iio objtool kvm_stat
+ 		tmon freefall iio objtool kvm_stat wmi
  
  acpi_install:
  	$(call descend,power/$(@:_install=),install)
@@@ -101,7 -101,7 +102,7 @@@
  cpupower_install:
  	$(call descend,power/$(@:_install=),install)
  
- cgroup_install firewire_install gpio_install hv_install iio_install perf_install spi_install usb_install virtio_install vm_install bpf_install objtool_install:
 -cgroup_install firewire_install gpio_install hv_install iio_install perf_install spi_install usb_install virtio_install vm_install net_install objtool_install wmi_install:
++cgroup_install firewire_install gpio_install hv_install iio_install perf_install spi_install usb_install virtio_install vm_install bpf_install objtool_install wmi_install:
  	$(call descend,$(@:_install=),install)
  
  liblockdep_install:
@@@ -125,8 -125,9 +126,9 @@@ kvm_stat_install
  install: acpi_install cgroup_install cpupower_install gpio_install \
  		hv_install firewire_install iio_install liblockdep_install \
  		perf_install selftests_install turbostat_install usb_install \
 -		virtio_install vm_install net_install x86_energy_perf_policy_install \
 +		virtio_install vm_install bpf_install x86_energy_perf_policy_install \
- 		tmon_install freefall_install objtool_install kvm_stat_install
+ 		tmon_install freefall_install objtool_install kvm_stat_install \
+ 		wmi_install
  
  acpi_clean:
  	$(call descend,power/acpi,clean)
@@@ -134,7 -135,7 +136,7 @@@
  cpupower_clean:
  	$(call descend,power/cpupower,clean)
  
- cgroup_clean hv_clean firewire_clean spi_clean usb_clean virtio_clean vm_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean:
 -cgroup_clean hv_clean firewire_clean spi_clean usb_clean virtio_clean vm_clean wmi_clean net_clean iio_clean gpio_clean objtool_clean leds_clean:
++cgroup_clean hv_clean firewire_clean spi_clean usb_clean virtio_clean vm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean:
  	$(call descend,$(@:_clean=),clean)
  
  liblockdep_clean:
@@@ -170,8 -171,8 +172,8 @@@ build_clean
  
  clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean \
  		perf_clean selftests_clean turbostat_clean spi_clean usb_clean virtio_clean \
 -		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 +		vm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
  		freefall_clean build_clean libbpf_clean libsubcmd_clean liblockdep_clean \
- 		gpio_clean objtool_clean leds_clean
+ 		gpio_clean objtool_clean leds_clean wmi_clean
  
  .PHONY: FORCE
