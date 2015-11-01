From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the modules tree with the kbuild tree
Date: Sun, 1 Nov 2015 19:31:10 +1100
Message-ID: <20151101193110.5b803cab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32896 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751226AbbKAIbO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 03:31:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Andi Kleen <ak@linux.intel.com>

Hi Rusty,

Today's linux-next merge of the modules tree got a conflict in:

  scripts/Makefile.modpost

between commit:

  19a3cc83353e ("Kbuild, lto: Add Link Time Optimization support v3")

from the kbuild tree and commit:

  47490ec141b9 ("modpost: Add flag -E for making section mismatches fatal")

from the modules tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc scripts/Makefile.modpost
index 9c40daea846c,1366a94b6c39..000000000000
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@@ -77,8 -77,8 +77,9 @@@ modpost = scripts/mod/modpos
   $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
   $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
   $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
+  $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
 - $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
 + $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w) \
 + $(if $(CONFIG_LTO),-w)
  
  MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
  
