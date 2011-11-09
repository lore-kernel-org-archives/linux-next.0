From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k tree
Date: Wed, 9 Nov 2011 09:19:47 +0100
Message-ID: <CAMuHMdW6qo2-Rg1vdB4_QMYTbhKyAFTiamy4z1zYhf0uQZB3-Q@mail.gmail.com>
References: <20111109111519.7d8969103ab32e7e8193c018@canb.auug.org.au>
	<4EBA26D9.3050108@snapgear.com>
	<CAMuHMdVsE4ZY3p8+kPgmKe5OOpoi1QV6BASK7gFYYTUDezyzLA@mail.gmail.com>
	<4EBA2DC5.5010907@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4EBA2DC5.5010907@snapgear.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Greg,

On Wed, Nov 9, 2011 at 08:37, Greg Ungerer <gerg@snapgear.com> wrote:
> On 11/09/2011 05:13 PM, Geert Uytterhoeven wrote:
>> On Wed, Nov 9, 2011 at 08:08, Greg Ungerer<gerg@snapgear.com> =C2=A0=
wrote:
>>>
>>> On 11/09/2011 10:15 AM, Stephen Rothwell wrote:
>>>>
>>>> Today's linux-next merge of the m68knommu tree got a conflict in
>>>> arch/m68k/Kconfig between commit d890d7399525 ("m68k/irq: Remove
>>>> obsolete
>>>> m68k irq framework") from the m68k tree and commit 4e8a9e70dfe8 ("=
m68k:
>>>> selection of GENERIC_ATOMIC64 is not MMU specific") from the m68kn=
ommu
>>>> tree.
>>>>
>>>> Just context changes. =C3=83=C2=A1I fixed it up (see below) and ca=
n carry the fix
>>>> as
>>>> necessary.
>>>
>>> Thanks. Both this and the previous m68k merge conflict patch look g=
ood.
>>>
>>> Geert: would you prefer I hold off on these 2 patches until after
>>> you merge your IRQ changes?
>>
>> I'll ask Linus to pull them today or tomorrow. After that (and he ha=
s
>> pulled), you can
>> rebase your tree. Is that OK for you?
>
> Yep, that is good. I wasn't sure if you where looking to push them
> in rc1 or in the next merge window.

rc2. I didn't want to rebase them to a random point between 3.1 and rc1=
=2E

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
