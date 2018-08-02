From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the m68k tree
Date: Thu, 2 Aug 2018 09:17:16 +0200
Message-ID: <CAMuHMdXTW8iSA+HnnDNzoNkMwUchLY1J6YBYCBCfGRT5UatBqg@mail.gmail.com>
References: <20180802092708.10e1a71d@canb.auug.org.au> <20180802094154.6d88f03c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802094154.6d88f03c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@telegraphics.com.au>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Aug 2, 2018 at 1:42 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> [forgot the conflict resolution ...]
>
> On Thu, 2 Aug 2018 09:27:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the powerpc tree got a conflict in:
> >
> >   arch/m68k/mac/misc.c
> >
> > between commit:
> >
> >   5b9bfb8ec467 ("m68k: mac: Use time64_t in RTC handling")
> >
> > from the m68k tree and commit:
> >
> >   ebd722275f9c ("macintosh/via-pmu: Replace via-pmu68k driver with via-pmu driver")
> >
> > from the powerpc tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

Ah, now I remember Finn said he was going to rebase his series once the time64_t
patch has entered my tree...

> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@@ -90,11 -85,11 +90,11 @@@ static void cuda_write_pram(int offset
>   }
>   #endif /* CONFIG_ADB_CUDA */
>
> - #ifdef CONFIG_ADB_PMU68K
> + #ifdef CONFIG_ADB_PMU
>  -static long pmu_read_time(void)
>  +static time64_t pmu_read_time(void)
>   {
>         struct adb_request req;
>  -      long time;
>  +      time64_t time;
>
>         if (pmu_request(&req, NULL, 1, PMU_READ_RTC) < 0)
>                 return 0;

Thanks, looks good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
