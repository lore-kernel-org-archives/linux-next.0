From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] android: make persistent_ram based drivers depend on HAVE_MEMBLOCK
Date: Sun, 8 Apr 2012 10:43:48 +0200
Message-ID: <CAMuHMdXM9bcmNdet4XAvtWuwPAr9KZS_pbm1TzKCM8UW2hcZmw@mail.gmail.com>
References: <1332350313-2501-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332350313-2501-1-git-send-email-ccross@android.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Cross <ccross@android.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Android Kernel Team <kernel-team@android.com>, gregkh@linuxfoundation.org, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 21, 2012 at 18:18, Colin Cross <ccross@android.com> wrote:
> m68k doesn't have memblock_reserve, which causes a build failure
> with allmodconfig. =C2=A0Make PERSISTENT_RAM and RAM_CONSOLE depend o=
n
> HAVE_MEMBLOCK.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Colin Cross <ccross@android.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
> =C2=A0drivers/staging/android/Kconfig | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> I can't test on m68k, but this disables the options if I remove
> HAVE_MEMBLOCK from arm.
>
> diff --git a/drivers/staging/android/Kconfig b/drivers/staging/androi=
d/Kconfig
> index 08a3b11..eb1dee2 100644
> --- a/drivers/staging/android/Kconfig
> +++ b/drivers/staging/android/Kconfig
> @@ -27,13 +27,14 @@ config ANDROID_LOGGER
>
> =C2=A0config ANDROID_PERSISTENT_RAM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool
> + =C2=A0 =C2=A0 =C2=A0 depends on HAVE_MEMBLOCK
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select REED_SOLOMON
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select REED_SOLOMON_ENC8
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select REED_SOLOMON_DEC8
>
> =C2=A0config ANDROID_RAM_CONSOLE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "Android RAM buffer console"
> - =C2=A0 =C2=A0 =C2=A0 depends on !S390 && !UML
> + =C2=A0 =C2=A0 =C2=A0 depends on !S390 && !UML && HAVE_MEMBLOCK
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select ANDROID_PERSISTENT_RAM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default n

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
