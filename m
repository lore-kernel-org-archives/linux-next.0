From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] slub: prefetch next freelist pointer in slab_alloc()
Date: Thu, 9 Feb 2012 21:00:22 +0100
Message-ID: <CAMuHMdXRXRo9zuKj9E3jUrSMrvpUD2KjVZ76f_WJWvG=8dvTSw@mail.gmail.com>
References: <1324049134.25554.29.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
	<alpine.DEB.2.00.1112161030270.26651@router.home>
	<alpine.LFD.2.02.1201242152480.1658@tux.localdomain>
	<CAMuHMdW-RbD-uxpOGmhv0LCsHLG-2Q0LvSRrB0cdM2efGRAYnw@mail.gmail.com>
	<alpine.DEB.2.00.1201301549240.3895@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:63443 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757427Ab2BIUAX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2012 15:00:23 -0500
In-Reply-To: <alpine.DEB.2.00.1201301549240.3895@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, David Rientjes <rientjes@google.com>, "Alex,Shi" <alex.shi@intel.com>, Shaohua Li <shaohua.li@intel.com>, Matt Mackall <mpm@selenic.com>, Linux-Next <linux-next@vger.kernel.org>

On Mon, Jan 30, 2012 at 22:53, Christoph Lameter <cl@linux.com> wrote:
> On Mon, 30 Jan 2012, Geert Uytterhoeven wrote:
>> m68k/allmodconfig at http://kisskb.ellerman.id.au/kisskb/buildresult=
/5527349/
>>
>> mm/slub.c:274: error: implicit declaration of function 'prefetch'
>>
>> Sorry, didn't notice it earlier due to other build breakage in -next=
=2E
>
> Does this fix it?

Yep. Thx!

> Subject: slub: include include for prefetch
>
> Otherwise m68k breaks.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Christoph Lameter <cl@linux.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0mm/slub.c | =C2=A0 =C2=A01 +
> =C2=A01 file changed, 1 insertion(+)
>
> Index: linux-2.6/mm/slub.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/mm/slub.c =C2=A0 =C2=A02012-01-13 10:04:06.0000000=
00 -0600
> +++ linux-2.6/mm/slub.c 2012-01-30 15:51:55.000000000 -0600
> @@ -29,6 +29,7 @@
> =C2=A0#include <linux/math64.h>
> =C2=A0#include <linux/fault-inject.h>
> =C2=A0#include <linux/stacktrace.h>
> +#include <linux/prefetch.h>
>
> =C2=A0#include <trace/events/kmem.h>

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
