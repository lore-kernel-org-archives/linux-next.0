From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for March 14, 2012
Date: Wed, 21 Mar 2012 09:33:45 +0100
Message-ID: <CAMuHMdWU2TcU=LPMQZD35Ssbfah5tuhykcfQPPkEtF_RRdjTyw@mail.gmail.com>
References: <20120314233926.GA22887@windriver.com>
	<CAMuHMdV45SBg+cm0+x07SfvY-xpjqb_ZVznn-vD=70G1YZXnFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV45SBg+cm0+x07SfvY-xpjqb_ZVznn-vD=70G1YZXnFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Colin Cross <ccross@android.com>, Android Kernel Team <kernel-team@android.com>, gregkh@linuxfoundation.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2012 at 09:00, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Thu, Mar 15, 2012 at 00:39, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> New breakage since last report:
>
> Seems you missed two new failures for m68k/allmodconfig:
>
> include/linux/mmc/core.h:128:20: error: field 'completion' has incomp=
lete type
> make[4]: *** [drivers/mmc/card/mmc_test.o] Error 1
>
> drivers/staging/android/persistent_ram.c:457:2: error: implicit
> declaration of function 'memblock_reserve'
> [-Werror=3Dimplicit-function-declaration]
> cc1: some warnings being treated as errors
> make[4]: *** [drivers/staging/android/persistent_ram.o] Error 1

This build failure is now in Linus' tree :-(
http://kisskb.ellerman.id.au/kisskb/buildresult/5926105/

Please fix it. Thx!

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
