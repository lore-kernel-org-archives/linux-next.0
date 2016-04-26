From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the arm64 tree
Date: Tue, 26 Apr 2016 15:00:41 +1000
Message-ID: <20160426150041.4d86d498@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Will Deacon <will.deacon@arm.com>, Shannon Zhao <shannon.zhao@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/arm64/kernel/setup.c

between commit:

  3194ac6e66cc ("arm64: Move unflatten_device_tree() call earlier.")

from the arm64 tree and commit:

  3915fea959b6 ("ARM: XEN: Move xen_early_init() before efi_init()")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/setup.c
index 65f515949baa,7cf992fe6684..000000000000
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@@ -277,13 -336,13 +278,11 @@@ void __init setup_arch(char **cmdline_p
  
  	early_ioremap_reset();
  
 -	if (acpi_disabled) {
 -		unflatten_device_tree();
 +	if (acpi_disabled)
  		psci_dt_init();
 -	} else {
 +	else
  		psci_acpi_init();
 -	}
  
- 	xen_early_init();
- 
  	cpu_read_bootcpu_ops();
  	smp_init_cpus();
  	smp_build_mpidr_hash();
