From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCHv7 3/5] common: dma-mapping: Introduce common remapping
 functions
Date: Wed, 27 Aug 2014 10:30:10 +0100
Message-ID: <53FDA522.2010106@imgtec.com>
References: <1407800431-21566-1-git-send-email-lauraa@codeaurora.org>	<1407800431-21566-4-git-send-email-lauraa@codeaurora.org> <CAAG0J99=wrz4+c49HeDvL0W9rDZKk2HNLdVtHv4ZJxU4-OjewA@mail.gmail.com> <53FCBCC3.5040901@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <53FCBCC3.5040901@codeaurora.org>
Sender: owner-linux-mm@kvack.org
To: Laura Abbott <lauraa@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Will Deacon <will.deacon@arm.com>, Russell King <linux@arm.linux.org.uk>, David Riley <davidriley@chromium.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Ritesh Harjain <ritesh.harjani@gmail.com>, linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 26/08/14 17:58, Laura Abbott wrote:
> On 8/26/2014 3:05 AM, James Hogan wrote:
>> On 12 August 2014 00:40, Laura Abbott <lauraa@codeaurora.org> wrote:
>>>
>>> For architectures without coherent DMA, memory for DMA may
>>> need to be remapped with coherent attributes. Factor out
>>> the the remapping code from arm and put it in a
>>> common location to reduce code duplication.
>>>
>>> As part of this, the arm APIs are now migrated away from
>>> ioremap_page_range to the common APIs which use map_vm_area for remap=
ping.
>>> This should be an equivalent change and using map_vm_area is more
>>> correct as ioremap_page_range is intended to bring in io addresses
>>> into the cpu space and not regular kernel managed memory.
>>>
>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
>>
>> This commit in linux-next () breaks the build for metag:
>>
>> drivers/base/dma-mapping.c: In function =E2=80=98dma_common_contiguous=
_remap=E2=80=99:
>> drivers/base/dma-mapping.c:294: error: implicit declaration of
>> function =E2=80=98dma_common_pages_remap=E2=80=99
>> drivers/base/dma-mapping.c:294: warning: assignment makes pointer from
>> integer without a cast
>> drivers/base/dma-mapping.c: At top level:
>> drivers/base/dma-mapping.c:308: error: conflicting types for
>> =E2=80=98dma_common_pages_remap=E2=80=99
>> drivers/base/dma-mapping.c:294: error: previous implicit declaration
>> of =E2=80=98dma_common_pages_remap=E2=80=99 was here
>>
>> Looks like metag isn't alone either:
>>
>> $ git grep -L dma-mapping-common arch/*/include/asm/dma-mapping.h
>> arch/arc/include/asm/dma-mapping.h
>> arch/avr32/include/asm/dma-mapping.h
>> arch/blackfin/include/asm/dma-mapping.h
>> arch/c6x/include/asm/dma-mapping.h
>> arch/cris/include/asm/dma-mapping.h
>> arch/frv/include/asm/dma-mapping.h
>> arch/m68k/include/asm/dma-mapping.h
>> arch/metag/include/asm/dma-mapping.h
>> arch/mn10300/include/asm/dma-mapping.h
>> arch/parisc/include/asm/dma-mapping.h
>> arch/xtensa/include/asm/dma-mapping.h
>>
>> I've checked a couple of these arches (blackfin, xtensa) which don't
>> include dma-mapping-common.h and their builds seem to be broken too.
>>
>> Cheers
>> James
>>
>=20
> Thanks for the report. Would you mind giving the following patch
> a test (this is theoretical only but I think it should work)

It certainly fixes the build for metag.

Thanks
James

>=20
> -----8<------
>=20
> From 81c9a5504cbc1d72ff1df084d48502b248cd79d0 Mon Sep 17 00:00:00 2001
> From: Laura Abbott <lauraa@codeaurora.org>
> Date: Tue, 26 Aug 2014 09:50:49 -0700
> Subject: [PATCH] common: dma-mapping: Swap function order
>=20
> Fix the order of dma_common_contiguous_remap and
> dma_common_pages_remap to avoid function declaration errors:
>=20
> drivers/base/dma-mapping.c: In function 'dma_common_contiguous_remap':
> drivers/base/dma-mapping.c:294: error: implicit declaration of
> function 'dma_common_pages_remap'
> drivers/base/dma-mapping.c:294: warning: assignment makes pointer from
> integer without a cast
> drivers/base/dma-mapping.c: At top level:
> drivers/base/dma-mapping.c:308: error: conflicting types for
> 'dma_common_pages_remap'
> drivers/base/dma-mapping.c:294: error: previous implicit declaration
> of 'dma_common_pages_remap' was here
>=20
> Change-Id: I65db739114e8f5816a24a279a2ff1a6dc92e2b83
> Reported-by: James Hogan <james.hogan@imgtec.com>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
> ---
>  drivers/base/dma-mapping.c | 44 ++++++++++++++++++++++----------------=
------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/base/dma-mapping.c b/drivers/base/dma-mapping.c
> index 1bc46df..056fd46 100644
> --- a/drivers/base/dma-mapping.c
> +++ b/drivers/base/dma-mapping.c
> @@ -271,6 +271,28 @@ int dma_common_mmap(struct device *dev, struct vm_=
area_struct *vma,
>  EXPORT_SYMBOL(dma_common_mmap);
> =20
>  /*
> + * remaps an array of PAGE_SIZE pages into another vm_area
> + * Cannot be used in non-sleeping contexts
> + */
> +void *dma_common_pages_remap(struct page **pages, size_t size,
> +			unsigned long vm_flags, pgprot_t prot,
> +			const void *caller)
> +{
> +	struct vm_struct *area;
> +
> +	area =3D get_vm_area_caller(size, vm_flags, caller);
> +	if (!area)
> +		return NULL;
> +
> +	if (map_vm_area(area, prot, pages)) {
> +		vunmap(area->addr);
> +		return NULL;
> +	}
> +
> +	return area->addr;
> +}
> +
> +/*
>   * remaps an allocated contiguous region into another vm_area.
>   * Cannot be used in non-sleeping contexts
>   */
> @@ -299,28 +321,6 @@ void *dma_common_contiguous_remap(struct page *pag=
e, size_t size,
>  }
> =20
>  /*
> - * remaps an array of PAGE_SIZE pages into another vm_area
> - * Cannot be used in non-sleeping contexts
> - */
> -void *dma_common_pages_remap(struct page **pages, size_t size,
> -			unsigned long vm_flags, pgprot_t prot,
> -			const void *caller)
> -{
> -	struct vm_struct *area;
> -
> -	area =3D get_vm_area_caller(size, vm_flags, caller);
> -	if (!area)
> -		return NULL;
> -
> -	if (map_vm_area(area, prot, pages)) {
> -		vunmap(area->addr);
> -		return NULL;
> -	}
> -
> -	return area->addr;
> -}
> -
> -/*
>   * unmaps a range previously mapped by dma_common_*_remap
>   */
>  void dma_common_free_remap(void *cpu_addr, size_t size, unsigned long =
vm_flags)
>=20

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
