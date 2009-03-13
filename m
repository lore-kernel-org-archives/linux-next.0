From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: kernel/up.c:16: error: dereferencing pointer to incomplete
	type
Date: Fri, 13 Mar 2009 08:59:31 +0100
Message-ID: <10f740e80903130059h7c6b9b3bpe2a204eba15c37b6@mail.gmail.com>
References: <10f740e80903120608v314be360u30911fa003ab5ebc@mail.gmail.com>
	 <20090313142033.d69d9d2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090313142033.d69d9d2e.sfr@canb.auug.org.au>
Sender: linux-m68k-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-m68k@vger.kernel.org, michael@ellerman.id.au
List-Id: linux-next.vger.kernel.org

Hi Stephe,

On Fri, Mar 13, 2009 at 04:20, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> On Thu, 12 Mar 2009 14:08:57 +0100 Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
>>
>> I can't seem to reproduce the compile failure of kernel/up.c on m68k=
,
>> as shown on
>> http://kisskb.ellerman.id.au/kisskb/buildresult/186066/:
>>
>> | kernel/up.c:16: error: dereferencing pointer to incomplete type
>
> When kisskb gets an error in building a kernel, it tries to bisect th=
e
> problem starting from a known good kernel. =C2=A0The above error occu=
rs
> during the bisection process not when building the original kernel. =C2=
=A0I
> guess we need to be a bit more careful when reporting the errors. =C2=
=A0Sorry
> about that.

Ah, that explains it, thanks!

I had also just noticed kernel/up.o was compiled twice, and the first
one succeeded.
Now I understand why...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
