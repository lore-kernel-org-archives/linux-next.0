From: Laura Abbott <lauraa@codeaurora.org>
Subject: Re: [PATCHv7 3/5] common: dma-mapping: Introduce common remapping
 functions
Date: Tue, 26 Aug 2014 09:58:43 -0700
Message-ID: <53FCBCC3.5040901@codeaurora.org>
References: <1407800431-21566-1-git-send-email-lauraa@codeaurora.org>	<1407800431-21566-4-git-send-email-lauraa@codeaurora.org> <CAAG0J99=wrz4+c49HeDvL0W9rDZKk2HNLdVtHv4ZJxU4-OjewA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:58049 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751460AbaHZQ6o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2014 12:58:44 -0400
In-Reply-To: <CAAG0J99=wrz4+c49HeDvL0W9rDZKk2HNLdVtHv4ZJxU4-OjewA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Will Deacon <will.deacon@arm.com>, Russell King <linux@arm.linux.org.uk>, David Riley <davidriley@chromium.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Ritesh Harjain <ritesh.harjani@gmail.com>, linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org

On 8/26/2014 3:05 AM, James Hogan wrote:
> On 12 August 2014 00:40, Laura Abbott <lauraa@codeaurora.org> wrote:
>>
>> For architectures without coherent DMA, memory for DMA may
>> need to be remapped with coherent attributes. Factor out
>> the the remapping code from arm and put it in a
>> common location to reduce code duplication.
>>
>> As part of this, the arm APIs are now migrated away from
>> ioremap_page_range to the common APIs which use map_vm_area for rema=
pping.
>> This should be an equivalent change and using map_vm_area is more
>> correct as ioremap_page_range is intended to bring in io addresses
>> into the cpu space and not regular kernel managed memory.
>>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
>=20
> This commit in linux-next () breaks the build for metag:
>=20
> drivers/base/dma-mapping.c: In function =E2=80=98dma_common_contiguou=
s_remap=E2=80=99:
> drivers/base/dma-mapping.c:294: error: implicit declaration of
> function =E2=80=98dma_common_pages_remap=E2=80=99
> drivers/base/dma-mapping.c:294: warning: assignment makes pointer fro=
m
> integer without a cast
> drivers/base/dma-mapping.c: At top level:
> drivers/base/dma-mapping.c:308: error: conflicting types for
> =E2=80=98dma_common_pages_remap=E2=80=99
> drivers/base/dma-mapping.c:294: error: previous implicit declaration
> of =E2=80=98dma_common_pages_remap=E2=80=99 was here
>=20
> Looks like metag isn't alone either:
>=20
> $ git grep -L dma-mapping-common arch/*/include/asm/dma-mapping.h
> arch/arc/include/asm/dma-mapping.h
> arch/avr32/include/asm/dma-mapping.h
> arch/blackfin/include/asm/dma-mapping.h
> arch/c6x/include/asm/dma-mapping.h
> arch/cris/include/asm/dma-mapping.h
> arch/frv/include/asm/dma-mapping.h
> arch/m68k/include/asm/dma-mapping.h
> arch/metag/include/asm/dma-mapping.h
> arch/mn10300/include/asm/dma-mapping.h
> arch/parisc/include/asm/dma-mapping.h
> arch/xtensa/include/asm/dma-mapping.h
>=20
> I've checked a couple of these arches (blackfin, xtensa) which don't
> include dma-mapping-common.h and their builds seem to be broken too.
>=20
> Cheers
> James
>=20

Thanks for the report. Would you mind giving the following patch
a test (this is theoretical only but I think it should work)

-----8<------

=46rom 81c9a5504cbc1d72ff1df084d48502b248cd79d0 Mon Sep 17 00:00:00 200=
1
=46rom: Laura Abbott <lauraa@codeaurora.org>
Date: Tue, 26 Aug 2014 09:50:49 -0700
Subject: [PATCH] common: dma-mapping: Swap function order

=46ix the order of dma_common_contiguous_remap and
dma_common_pages_remap to avoid function declaration errors:

drivers/base/dma-mapping.c: In function 'dma_common_contiguous_remap':
drivers/base/dma-mapping.c:294: error: implicit declaration of
function 'dma_common_pages_remap'
drivers/base/dma-mapping.c:294: warning: assignment makes pointer from
integer without a cast
drivers/base/dma-mapping.c: At top level:
drivers/base/dma-mapping.c:308: error: conflicting types for
'dma_common_pages_remap'
drivers/base/dma-mapping.c:294: error: previous implicit declaration
of 'dma_common_pages_remap' was here

Change-Id: I65db739114e8f5816a24a279a2ff1a6dc92e2b83
Reported-by: James Hogan <james.hogan@imgtec.com>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
---
 drivers/base/dma-mapping.c | 44 ++++++++++++++++++++++----------------=
------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/base/dma-mapping.c b/drivers/base/dma-mapping.c
index 1bc46df..056fd46 100644
--- a/drivers/base/dma-mapping.c
+++ b/drivers/base/dma-mapping.c
@@ -271,6 +271,28 @@ int dma_common_mmap(struct device *dev, struct vm_=
area_struct *vma,
 EXPORT_SYMBOL(dma_common_mmap);
=20
 /*
+ * remaps an array of PAGE_SIZE pages into another vm_area
+ * Cannot be used in non-sleeping contexts
+ */
+void *dma_common_pages_remap(struct page **pages, size_t size,
+			unsigned long vm_flags, pgprot_t prot,
+			const void *caller)
+{
+	struct vm_struct *area;
+
+	area =3D get_vm_area_caller(size, vm_flags, caller);
+	if (!area)
+		return NULL;
+
+	if (map_vm_area(area, prot, pages)) {
+		vunmap(area->addr);
+		return NULL;
+	}
+
+	return area->addr;
+}
+
+/*
  * remaps an allocated contiguous region into another vm_area.
  * Cannot be used in non-sleeping contexts
  */
@@ -299,28 +321,6 @@ void *dma_common_contiguous_remap(struct page *pag=
e, size_t size,
 }
=20
 /*
- * remaps an array of PAGE_SIZE pages into another vm_area
- * Cannot be used in non-sleeping contexts
- */
-void *dma_common_pages_remap(struct page **pages, size_t size,
-			unsigned long vm_flags, pgprot_t prot,
-			const void *caller)
-{
-	struct vm_struct *area;
-
-	area =3D get_vm_area_caller(size, vm_flags, caller);
-	if (!area)
-		return NULL;
-
-	if (map_vm_area(area, prot, pages)) {
-		vunmap(area->addr);
-		return NULL;
-	}
-
-	return area->addr;
-}
-
-/*
  * unmaps a range previously mapped by dma_common_*_remap
  */
 void dma_common_free_remap(void *cpu_addr, size_t size, unsigned long =
vm_flags)
--=20
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
hosted by The Linux Foundation

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
