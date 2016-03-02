From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the tip tree
Date: Wed, 2 Mar 2016 15:27:57 +1100
Message-ID: <20160302152757.143b8437@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41449 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751127AbcCBE17 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Mar 2016 23:27:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  tools/Makefile

between commit:

  442f04c34a1a ("objtool: Add tool to perform compile-time stack metadata validation")

from the tip tree and commit:

  6d591c46bce0 ("tools/gpio: create GPIO tools")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc tools/Makefile
index cc2a37d975d6,f41e7c6ea23e..000000000000
--- a/tools/Makefile
+++ b/tools/Makefile
@@@ -54,7 -54,7 +55,7 @@@ acpi: FORC
  cpupower: FORCE
  	$(call descend,power/$@)
  
- cgroup firewire hv guest spi usb virtio vm net iio objtool: FORCE
 -cgroup firewire hv guest spi usb virtio vm net iio gpio: FORCE
++cgroup firewire hv guest spi usb virtio vm net iio objtool gpio: FORCE
  	$(call descend,$@)
  
  liblockdep: FORCE
@@@ -120,7 -120,7 +121,7 @@@ acpi_clean
  cpupower_clean:
  	$(call descend,power/cpupower,clean)
  
- cgroup_clean hv_clean firewire_clean lguest_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean objtool_clean:
 -cgroup_clean hv_clean firewire_clean lguest_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean gpio_clean:
++cgroup_clean hv_clean firewire_clean lguest_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean objtool_clean gpio_clean:
  	$(call descend,$(@:_clean=),clean)
  
  liblockdep_clean:
@@@ -157,6 -157,6 +158,6 @@@ clean: acpi_clean cgroup_clean cpupower
  		perf_clean selftests_clean turbostat_clean spi_clean usb_clean virtio_clean \
  		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
  		freefall_clean build_clean libbpf_clean libsubcmd_clean liblockdep_clean \
- 		objtool_clean
 -		gpio_clean
++		objtool_clean gpio_clean
  
  .PHONY: FORCE
