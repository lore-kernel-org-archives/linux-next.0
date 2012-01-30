From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] slub: prefetch next freelist pointer in slab_alloc()
Date: Mon, 30 Jan 2012 22:32:53 +0100
Message-ID: <CAMuHMdW-RbD-uxpOGmhv0LCsHLG-2Q0LvSRrB0cdM2efGRAYnw@mail.gmail.com>
References: <1324049134.25554.29.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
	<alpine.DEB.2.00.1112161030270.26651@router.home>
	<alpine.LFD.2.02.1201242152480.1658@tux.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40914 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752220Ab2A3Vcz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2012 16:32:55 -0500
In-Reply-To: <alpine.LFD.2.02.1201242152480.1658@tux.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Christoph Lameter <cl@linux.com>, Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, David Rientjes <rientjes@google.com>, "Alex,Shi" <alex.shi@intel.com>, Shaohua Li <shaohua.li@intel.com>, Matt Mackall <mpm@selenic.com>, Linux-Next <linux-next@vger.kernel.org>

On Tue, Jan 24, 2012 at 20:54, Pekka Enberg <penberg@kernel.org> wrote:
> On Fri, 16 Dec 2011, Eric Dumazet wrote:
>>> Recycling a page is a problem, since freelist link chain is hot on
>>> cpu(s) which freed objects, and possibly very cold on cpu currently
>>> owning slab.
>
> On Fri, 16 Dec 2011, Christoph Lameter wrote:
>> Good idea. How do the tcp benchmarks look after this?
>>
>> Looks sane.
>>
>> Acked-by: Christoph Lameter <cl@linux.com>
>
> Applied, thanks!

m68k/allmodconfig at http://kisskb.ellerman.id.au/kisskb/buildresult/55=
27349/

mm/slub.c:274: error: implicit declaration of function 'prefetch'

Sorry, didn't notice it earlier due to other build breakage in -next.

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
