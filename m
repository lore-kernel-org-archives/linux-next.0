From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: drivers/char/dsp56k.c breakage [was: Re: linux-next: Tree for May
 26]
Date: Mon, 26 May 2008 16:46:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0805261644230.4417@anakin>
References: <20080526172222.b6979523.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757157AbYEZOrH@vger.kernel.org>
In-Reply-To: <20080526172222.b6979523.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linux/m68k <linux-m68k@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 26 May 2008, Stephen Rothwell wrote:
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.

commit	6fe28df6c14e7e02bfea6b2bebf42716176e6dff

    dsp56k: BKL pushdown

    Put explicit lock_kernel calls into dsp56k_open().

Broke the build of drivers/char/dsp56k.c by introducing a jump to a
non-existent label

http://kisskb.ellerman.id.au/kisskb/buildresult/29211/

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
