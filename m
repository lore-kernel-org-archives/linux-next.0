From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 20 (gpu/drm/i915)
Date: Thu, 20 Oct 2016 10:37:13 -0700
Message-ID: <0c3c853b-3116-2935-c449-f63b21bb569d@infradead.org>
References: <20161020142037.709ffeb1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161020142037.709ffeb1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On 10/19/16 20:20, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20161019:
> 

on i386: when CONFIG_ACPI is not enabled:

../drivers/gpu/drm/i915/gvt/opregion.c: In function 'intel_gvt_init_opregion':
../drivers/gpu/drm/i915/gvt/opregion.c:183:2: error: implicit declaration of function 'acpi_os_ioremap' [-Werror=implicit-function-declaration]
  gvt->opregion.opregion_va = acpi_os_ioremap(gvt->opregion.opregion_pa,
  ^
../drivers/gpu/drm/i915/gvt/opregion.c:183:28: warning: assignment makes pointer from integer without a cast [enabled by default]
  gvt->opregion.opregion_va = acpi_os_ioremap(gvt->opregion.opregion_pa,
                            ^
../drivers/gpu/drm/i915/gvt/gtt.c: In function 'read_pte64':
../drivers/gpu/drm/i915/gvt/gtt.c:277:2: warning: left shift count >= width of type [enabled by default]
  pte |= ioread32(addr + 4) << 32;
  ^
../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gtt_get_pfn':
../drivers/gpu/drm/i915/gvt/gtt.c:360:3: warning: left shift count >= width of type [enabled by default]
   pfn = (e->val64 & ADDR_4K_MASK) >> 12;
   ^
../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gtt_set_pfn':
../drivers/gpu/drm/i915/gvt/gtt.c:373:3: warning: left shift count >= width of type [enabled by default]
   e->val64 &= ~ADDR_4K_MASK;
   ^
../drivers/gpu/drm/i915/gvt/gtt.c:374:3: warning: left shift count >= width of type [enabled by default]
   pfn &= (ADDR_4K_MASK >> 12);
   ^
../drivers/gpu/drm/i915/gvt/gtt.c: In function 'gen8_gma_to_pml4_index':
../drivers/gpu/drm/i915/gvt/gtt.c:436:1: warning: right shift count >= width of type [enabled by default]
 DEFINE_PPGTT_GMA_TO_INDEX(gen8, pml4, (gma >> 39 & 0x1ff));
 ^
  CC      drivers/gpu/drm/radeon/si_smc.o
In file included from ../drivers/gpu/drm/i915/i915_drv.h:46:0,
                 from ../drivers/gpu/drm/i915/gvt/gtt.c:36:
../drivers/gpu/drm/i915/gvt/gtt.c: In function 'intel_gvt_create_scratch_page':
../drivers/gpu/drm/i915/gvt/gtt.c:1945:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
   gvt_err("fail to translate vaddr:0x%llx\n", (u64)vaddr);
                                               ^
../include/drm/drmP.h:201:43: note: in definition of macro 'DRM_ERROR'
  drm_printk(KERN_ERR, DRM_UT_NONE, fmt, ##__VA_ARGS__)
                                           ^
../drivers/gpu/drm/i915/gvt/gtt.c:1945:3: note: in expansion of macro 'gvt_err'
   gvt_err("fail to translate vaddr:0x%llx\n", (u64)vaddr);
   ^



-- 
~Randy
