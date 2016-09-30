From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the arm64 tree
Date: Fri, 30 Sep 2016 13:38:22 +1000
Message-ID: <20160930133822.0bf16c41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753786AbcI3Di3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 23:38:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Will Deacon <will.deacon@arm.com>, Aleksey Makarov <aleksey.makarov@linaro.org>

Hi Greg,

Today's linux-next merge of the tty tree got conflicts in:

  arch/arm64/Kconfig

between commit:

  1d8f51d41fc7 ("arm/arm64: arch_timer: Use archdata to indicate vdso suitability")

from the arm64 tree and commit:

  888125a71298 ("ARM64: ACPI: enable ACPI_SPCR_TABLE")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/Kconfig
index 17c14a1d9112,11a2d36b27ef..000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -4,7 -4,7 +4,8 @@@ config ARM6
  	select ACPI_GENERIC_GSI if ACPI
  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
  	select ACPI_MCFG if ACPI
+ 	select ACPI_SPCR_TABLE if ACPI
 +	select ARCH_CLOCKSOURCE_DATA
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
  	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
