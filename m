From: Mark Salter <msalter@redhat.com>
Subject: Re: [PATCHv7 3/5] common: dma-mapping: Introduce common remapping
 functions
Date: Wed, 27 Aug 2014 17:01:18 -0400
Message-ID: <1409173278.9919.29.camel@deneb.redhat.com>
References: <1407800431-21566-1-git-send-email-lauraa@codeaurora.org>
		<1407800431-21566-4-git-send-email-lauraa@codeaurora.org>
	 <CAAG0J99=wrz4+c49HeDvL0W9rDZKk2HNLdVtHv4ZJxU4-OjewA@mail.gmail.com>
	 <53FCBCC3.5040901@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <53FCBCC3.5040901@codeaurora.org>
Sender: owner-linux-mm@kvack.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: James Hogan <james.hogan@imgtec.com>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, Ritesh Harjain <ritesh.harjani@gmail.com>, David Riley <davidriley@chromium.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2014-08-26 at 09:58 -0700, Laura Abbott wrote:
> On 8/26/2014 3:05 AM, James Hogan wrote:
> > On 12 August 2014 00:40, Laura Abbott <lauraa@codeaurora.org> wrote:
> >>
> >> For architectures without coherent DMA, memory for DMA may
> >> need to be remapped with coherent attributes. Factor out
> >> the the remapping code from arm and put it in a
> >> common location to reduce code duplication.
> >>
> >> As part of this, the arm APIs are now migrated away from
> >> ioremap_page_range to the common APIs which use map_vm_area for rema=
pping.
> >> This should be an equivalent change and using map_vm_area is more
> >> correct as ioremap_page_range is intended to bring in io addresses
> >> into the cpu space and not regular kernel managed memory.
> >>
> >> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> >> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
> >=20
> > This commit in linux-next () breaks the build for metag:
> >=20
> > drivers/base/dma-mapping.c: In function =E2=80=98dma_common_contiguou=
s_remap=E2=80=99:
> > drivers/base/dma-mapping.c:294: error: implicit declaration of
> > function =E2=80=98dma_common_pages_remap=E2=80=99
> > drivers/base/dma-mapping.c:294: warning: assignment makes pointer fro=
m
> > integer without a cast
> > drivers/base/dma-mapping.c: At top level:
> > drivers/base/dma-mapping.c:308: error: conflicting types for
> > =E2=80=98dma_common_pages_remap=E2=80=99
> > drivers/base/dma-mapping.c:294: error: previous implicit declaration
> > of =E2=80=98dma_common_pages_remap=E2=80=99 was here
> >=20
> > Looks like metag isn't alone either:
> >=20
> > $ git grep -L dma-mapping-common arch/*/include/asm/dma-mapping.h
> > arch/arc/include/asm/dma-mapping.h
> > arch/avr32/include/asm/dma-mapping.h
> > arch/blackfin/include/asm/dma-mapping.h
> > arch/c6x/include/asm/dma-mapping.h
> > arch/cris/include/asm/dma-mapping.h
> > arch/frv/include/asm/dma-mapping.h
> > arch/m68k/include/asm/dma-mapping.h
> > arch/metag/include/asm/dma-mapping.h
> > arch/mn10300/include/asm/dma-mapping.h
> > arch/parisc/include/asm/dma-mapping.h
> > arch/xtensa/include/asm/dma-mapping.h
> >=20
> > I've checked a couple of these arches (blackfin, xtensa) which don't
> > include dma-mapping-common.h and their builds seem to be broken too.
> >=20
> > Cheers
> > James
> >=20
>=20
> Thanks for the report. Would you mind giving the following patch
> a test (this is theoretical only but I think it should work)

There's a further problem with c6x (no  MMU):

drivers/built-in.o: In function `dma_common_pages_remap':
(.text+0x220c4): undefined reference to `get_vm_area_caller'
drivers/built-in.o: In function `dma_common_pages_remap':
(.text+0x22108): undefined reference to `map_vm_area'
drivers/built-in.o: In function `dma_common_free_remap':
(.text+0x22278): undefined reference to `find_vm_area'



--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
