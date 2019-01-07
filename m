From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the drm-intel tree
Date: Tue, 8 Jan 2019 10:50:11 +1100
Message-ID: <20190108105011.619cf6be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from include/linux/printk.h:7,
                 from include/linux/kernel.h:14,
                 from include/asm-generic/bug.h:18,
                 from arch/x86/include/asm/bug.h:83,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from include/linux/io-mapping.h:22,
                 from drivers/gpu/drm/i915/i915_drv.h:36,
                 from drivers/gpu/drm/i915/intel_hangcheck.c:25:
drivers/gpu/drm/i915/selftests/intel_hangcheck.c: In function 'igt_atomic_reset_engine':
include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^~~~~~
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^~~~~~~~
include/linux/printk.h:303:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^~~~~~~~
drivers/gpu/drm/i915/selftests/intel_hangcheck.c:1564:3: note: in expansion of macro 'pr_err'
   pr_err("%s(%s): Failed to start request %llx, at %x\n",
   ^~~~~~
In file included from drivers/gpu/drm/i915/intel_hangcheck.c:315:
drivers/gpu/drm/i915/selftests/intel_hangcheck.c:1564:46: note: format string is defined here
   pr_err("%s(%s): Failed to start request %llx, at %x\n",
                                           ~~~^
                                           %x

Introduced by commit

  921f3a60e54e ("drm/i915/selftests: Verify we can perform resets from atomic context")

-- 
Cheers,
Stephen Rothwell
