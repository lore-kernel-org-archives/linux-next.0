From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Dec 19 (target)
Date: Thu, 19 Dec 2013 21:44:22 +0100
Message-ID: <CAMuHMdXdz5numoe_8SzYy_AN4++c2c_uqPtbdhq9kzTdLN=7+g@mail.gmail.com>
References: <20131219165106.73f28ea8aa1bd059423cb5f8@canb.auug.org.au>
	<52B349B5.6090200@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52B349B5.6090200@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, target-devel <target-devel@vger.kernel.org>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 19, 2013 at 8:32 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 12/18/13 21:51, Stephen Rothwell wrote:
>> Changes since 20131218:
> on i386:
>
> drivers/built-in.o: In function `target_alua_state_check':
> (.text+0x3fc859): undefined reference to `__udivdi3'

I believe this is already fixed in today's tree (it also happened on m68k
and mips).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
