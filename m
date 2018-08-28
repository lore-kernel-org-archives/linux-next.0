From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Tue, 28 Aug 2018 15:34:38 +0200
Message-ID: <CAMuHMdU2dK10m2c2b3w6+-6KDr-L5MejJbvo6Y2urj1j-TA7+w@mail.gmail.com>
References: <20180817103913.52544928@canb.auug.org.au> <CAMuHMdUQcoMxb=0_i1PYyymUpQ1VBOub+EgDbRJWmrq8_xJ-uQ@mail.gmail.com>
 <20180821183012.3b9bc4f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821183012.3b9bc4f3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, rf@opensource.cirrus.com, "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, Aug 21, 2018 at 10:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 21 Aug 2018 10:08:54 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > To obey sorting rules, the CIRRUS LOGIC entry should be before the CLANG
> > entry.
> > Upon closer look, it should be inserted before the CISCO entries, too (in
> > the mfd tree).
>
> Thanks for noticing.  Unfortunately it is badly ordered in Linus' tree
> now as well.  Feel like sending him a patch?

Your wish is my command; sent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
