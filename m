From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] sparc32/sparc64: Provide cmpxchg64()
Date: Wed, 20 Mar 2013 09:05:19 +0100
Message-ID: <CAMuHMdXHuT16xuw3-5rwL2WY7ZRzfweB7jKVyoi-xnqT4B0pBg@mail.gmail.com>
References: <1363290128-21247-1-git-send-email-geert@linux-m68k.org>
	<20130319.162000.1936616024625986095.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20130319.162000.1936616024625986095.davem@davemloft.net>
Sender: sparclinux-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi David,

On Tue, Mar 19, 2013 at 9:20 PM, David Miller <davem@davemloft.net> wro=
te:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Thu, 14 Mar 2013 20:42:08 +0100
>
>> sparc/sparc64 allmodconfig:
>>
>> drivers/block/blockconsole.c: In function =E2=80=98bcon_advance_cons=
ole_bytes=E2=80=99:
>> drivers/block/blockconsole.c:164: error: implicit declaration of fun=
ction
>> =E2=80=98cmpxchg64=E2=80=99
>>
>> Map cmpxchg64 to cmpxchg64_local to fix this.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> But, in the sparc 32-bit case, the _local() variants are only atomic
> from the perspective of the current cpu, they are not globally atomic=
=2E
>
> This is true because the sparc 32-bit cases use the
> asm-generic/cmpxchg-local.h helpers.
>
> I really can't apply this, it isn't correct, sorry.

You're right, sorry for that.

The sparc64 part is still OK as it eventually calls __cmpxchg_u64(), is=
n't it?

Do you want me to send a new patch for that part only, or will you just
remove the sparc32 part?

Thanks!

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
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
