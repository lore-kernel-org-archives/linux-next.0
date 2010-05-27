From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 1/4] [x86/mm] Correcting improper large page preservation
Date: Thu, 27 May 2010 12:49:10 -0400
Message-ID: <AANLkTimd5JReMf86z9YwcbSNObqW6n6sY6_AnBq40A6V@mail.gmail.com>
References: <AANLkTilo5onZPVM2KQFHPaQxDOSfpYA6w2ugYpTc8MOM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <AANLkTilo5onZPVM2KQFHPaQxDOSfpYA6w2ugYpTc8MOM@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org
Cc: Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 27, 2010 at 12:45 PM, Siarhei Liakh <sliakh.lkml@gmail.com>=
 wrote:
> This patch fixes a bug in try_preserve_large_page() which may result
> in improper large page preservation and improper application of page
> attributes to the memory area outside of the original change request.
> More specifically, the problem manifests itself when set_memory_*() i=
s
> called for several pages at the beginning of the large page and
[...]
> V1: =A0try_preserve_large_page() patch for Linux 2.6.34-rc2
>
> Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
> Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
> ---
>
> diff --git a/arch/x86/mm/pageattr.c b/arch/x86/mm/pageattr.c
> index cf07c26..6844675 100644
> --- a/arch/x86/mm/pageattr.c
> +++ b/arch/x86/mm/pageattr.c
> @@ -255,6 +255,7 @@ static inline pgprot_t static_protections(pgprot_=
t
[..]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpa->numpages =3D=3D (psize >> PAGE_SHI=
=46T)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* The address is aligned and the numbe=
r of pages
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* covers the full page.
>

Please disregard this patch. Version 2 will be re-posted shortly.
Sorry for mistake.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
