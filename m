From: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] gpu/drm/amd/amdkfd: fix build, select MMU_NOTIFIER
Date: Thu, 19 Apr 2018 12:46:14 +0200
Message-ID: <CADYN=9KhMhgCzmwg1P5FHEt0EaTH-EoELeF7mCCc-KtWocEGOQ@mail.gmail.com>
References: <20180414002933.6h3S5%akpm@linux-foundation.org> <cf7fe470-1b8f-a4a2-d3a1-3360ec1cc578@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cf7fe470-1b8f-a4a2-d3a1-3360ec1cc578@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Oded Gabbay <oded.gabbay@gmail.com>
List-Id: linux-next.vger.kernel.org

On 14 April 2018 at 04:49, Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> When CONFIG_MMU_NOTIFIER is not enabled, struct mmu_notifier has an
> incomplete type definition, which causes build errors.
>
> ../drivers/gpu/drm/amd/amdkfd/kfd_priv.h:607:22: error: field 'mmu_notifier' has incomplete type
> ../include/linux/kernel.h:979:32: error: dereferencing pointer to incomplete type
> ../include/linux/kernel.h:980:18: error: dereferencing pointer to incomplete type
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:434:2: error: implicit declaration of function 'mmu_notifier_unregister_no_release' [-Werror=implicit-function-declaration]
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:435:2: error: implicit declaration of function 'mmu_notifier_call_srcu' [-Werror=implicit-function-declaration]
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:438:21: error: variable 'kfd_process_mmu_notifier_ops' has initializer but incomplete type
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:439:2: error: unknown field 'release' specified in initializer
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:439:2: warning: excess elements in struct initializer [enabled by default]
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:439:2: warning: (near initialization for 'kfd_process_mmu_notifier_ops') [enabled by default]
> ../drivers/gpu/drm/amd/amdkfd/kfd_process.c:534:2: error: implicit declaration of function 'mmu_notifier_register' [-Werror=implicit-function-declaration]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: dri-devel@lists.freedesktop.org

Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
> From linux-next, not mmotm, but found in mmotm builds.
>
>  drivers/gpu/drm/amd/amdkfd/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- mmotm-2018-0413-1728.orig/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ mmotm-2018-0413-1728/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -6,5 +6,6 @@ config HSA_AMD
>         tristate "HSA kernel driver for AMD GPU devices"
>         depends on DRM_AMDGPU && X86_64
>         imply AMD_IOMMU_V2
> +       select MMU_NOTIFIER
>         help
>           Enable this if you want to use HSA features on AMD GPU devices.
>
