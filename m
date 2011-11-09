From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k
 tree
Date: Wed, 9 Nov 2011 17:37:41 +1000
Message-ID: <4EBA2DC5.5010907@snapgear.com>
References: <20111109111519.7d8969103ab32e7e8193c018@canb.auug.org.au>	<4EBA26D9.3050108@snapgear.com> <CAMuHMdVsE4ZY3p8+kPgmKe5OOpoi1QV6BASK7gFYYTUDezyzLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVsE4ZY3p8+kPgmKe5OOpoi1QV6BASK7gFYYTUDezyzLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Geert,

On 11/09/2011 05:13 PM, Geert Uytterhoeven wrote:
> Hi Greg,
>
> On Wed, Nov 9, 2011 at 08:08, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 11/09/2011 10:15 AM, Stephen Rothwell wrote:
>>> Today's linux-next merge of the m68knommu tree got a conflict in
>>> arch/m68k/Kconfig between commit d890d7399525 ("m68k/irq: Remove ob=
solete
>>> m68k irq framework") from the m68k tree and commit 4e8a9e70dfe8 ("m=
68k:
>>> selection of GENERIC_ATOMIC64 is not MMU specific") from the m68kno=
mmu
>>> tree.
>>>
>>> Just context changes. =C3=A1I fixed it up (see below) and can carry=
 the fix as
>>> necessary.
>>
>> Thanks. Both this and the previous m68k merge conflict patch look go=
od.
>>
>> Geert: would you prefer I hold off on these 2 patches until after
>> you merge your IRQ changes?
>
> I'll ask Linus to pull them today or tomorrow. After that (and he has
> pulled), you can
> rebase your tree. Is that OK for you?

Yep, that is good. I wasn't sure if you where looking to push them
in rc1 or in the next merge window.

Thanks
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close,                            FAX:         +61 7 3891 363=
0
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
