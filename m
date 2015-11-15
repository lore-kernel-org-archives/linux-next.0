From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: clean up the kbuild tree?
Date: Sun, 15 Nov 2015 11:27:05 +1100
Message-ID: <20151115112705.0bf4f0ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41080 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751983AbbKOA1I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 14 Nov 2015 19:27:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

Hi Michal,

I notice that the kbuild tree (relative to Linus' tree) only contains
lots of merges and these 2 commits from April 2014:

commit 19a3cc83353e3bb4bc28769f8606139a3d350d2d
Author: Andi Kleen <ak@linux.intel.com>
Date:   Wed Apr 2 21:49:27 2014 +0200

    Kbuild, lto: Add Link Time Optimization support v3
    
    With LTO gcc will do whole program optimizations for
    the whole kernel and each module. This increases compile time,
    but can generate faster and smaller code and allows
    the compiler to do global checking. For example the compiler
    can complain now about type mismatches for symbols between
    different files.
    
    LTO allows gcc to inline functions between different files and
    do various other optimization across the whole binary.
    
    It might also trigger bugs due to more aggressive optimizations.
    It allows gcc to drop unused code. It also allows it to check
    types over the whole program.
    
    The compile time is definitely slower. For gcc 4.8 on a
    typical monolithic config it is about 58% slower. 4.9
    drastically improved performance, with slowdown being
    38% or so. Also incremenential rebuilds are somewhat
    slower, as the whole kernel always needs to be reoptimized.
    Very modular kernels have less build time slow down, as
    the LTO will run for each module individually.
    
    This adds the basic Kbuild plumbing for LTO:
    
    - In Kbuild add a new scripts/Makefile.lto that checks
    the tool chain (note the checks may not be fully bulletproof)
    and when the tests pass sets the LTO options
    Currently LTO is very finicky about the tool chain.
    - Add a new LDFINAL variable that controls the final link
    for vmlinux or module. In this case we call gcc-ld instead
    of ld, to run the LTO step.
    - For slim LTO builds (object files containing no backup
    executable) force AR to gcc-ar
    - Theoretically LTO should pass through compiler options from
    the compiler to the link step, but this doesn't work for all options.
    So the Makefile sets most of these options manually.
    - Kconfigs:
    Since LTO with allyesconfig needs more than 4G of memory (~8G)
    and has the potential to makes people's system swap to death.
    I used a nested config that ensures that a simple
    allyesconfig disables LTO. It has to be explicitely
    enabled.
    - Some depencies on other Kconfigs:
    MODVERSIONS, GCOV, FUNCTION_TRACER, KALLSYMS_ALL, single chain WCHAN are
    incompatible with LTO currently, mostly because they
    they require setting special compiler options
    for specific files, which LTO currently doesn't support.
    MODVERSIONS should in principle work with gcc 4.9, but still disabled.
    FUNCTION_TRACER/GCOV can be fixed with a unmerged gcc patch.
    - Also disable strict copy user checks because they trigger
    errors with LTO.
    - modpost symbol checking is downgraded to a warning,
    as in some cases modpost runs before the final link
    and it cannot resolve LTO symbols at this point.
    
    For more information see Documentation/lto-build
    
    Thanks to HJ Lu, Joe Mario, Honza Hubicka, Richard Guenther,
    Don Zickus, Changlong Xie who helped with this project
    (and probably some more who I forgot, sorry)
    
    v2:
    Merge documentation file into this patch
    Improve documentation and Kconfig, fix a lot of obsolete comments.
    Exclude READABLE_ASM
    Some random fixes
    v3:
    Remove CONFIG_LTO_SLIM, is on by default.
    Signed-off-by: Andi Kleen <ak@linux.intel.com>
    Signed-off-by: Michal Marek <mmarek@suse.cz>

commit 810361b9f65daa6144922ac88087a8426eeae817
Author: Andi Kleen <ak@linux.intel.com>
Date:   Wed Apr 2 21:49:26 2014 +0200

    Kbuild, lto: Set TMPDIR for LTO v4
    
    LTO gcc puts a lot of data into $TMPDIR, essentially another copy
    of the object directory to pass the repartitioned object files
    to the code generation processes.
    
    TMPDIR defaults to /tmp With /tmp as tmpfs it's easy to drive systems to
    out of memory, because they will compete with the already high anonymous
    memory consumption of the wpa LTO pass.
    
    When LTO is set always set TMPDIR to the object directory. This could
    be slightly slower, but is far safer and eliminates another parameter
    the LTO user would need to set manually.
    
    I made it conditional on LTO for now.
    
    v2: Allow user to override (H. Peter Anvin)
    v3: Use standard kernel variable style
    v4: Print message for redirection (M.Marek)
    Signed-off-by: Andi Kleen <ak@linux.intel.com>
    Signed-off-by: Michal Marek <mmarek@suse.cz>

 Documentation/lto-build                            | 173 ++++++++++++++++++++
 Makefile                                           |  23 ++-
 arch/x86/Kconfig                                   |   2 +-
 init/Kconfig                                       |  73 +++++++++
 kernel/gcov/Kconfig                                |   2 +-
 lib/Kconfig.debug                                  |   2 +-
 scripts/Makefile.lto                               |  84 ++++++++++
 scripts/Makefile.modpost                           |   7 +-
 scripts/coccicheck                                 |   2 +-
 scripts/coccinelle/free/ifnullfree.cocci           |  26 +--
 .../iterators/device_node_continue.cocci           | 100 ++++++++++++
 scripts/coccinelle/misc/compare_const_fl.cocci     | 171 ++++++++++++++++++++
 scripts/coccinelle/misc/of_table.cocci             |  33 +++-
 scripts/coccinelle/misc/simple_return.cocci        | 180 ---------------------
 scripts/coccinelle/null/deref_null.cocci           |   4 +-
 scripts/coccinelle/tests/odd_ptr_err.cocci         | 120 ++++++++++----
 scripts/link-vmlinux.sh                            |   2 +-
 scripts/package/builddeb                           |  11 +-
 scripts/tags.sh                                    |   2 +
 19 files changed, 775 insertions(+), 242 deletions(-)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
