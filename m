From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the mfd tree with the sound tree
Date: Tue, 21 Aug 2018 10:11:41 +0200
Message-ID: <CAMuHMdVs-3CWF23_qik6euae6tQasp-zM4tSgx-pp02xPnyEeA@mail.gmail.com>
References: <20180720134219.680ae314@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134219.680ae314@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Takashi Iwai <tiwai@suse.de>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 20, 2018 at 5:42 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the mfd tree got a conflict in:
>
>   drivers/gpu/drm/i915/Kconfig
>
> between commit:
>
>   a57942bfdd61 ("ALSA: hda: Make audio component support more generic")
>
> from the sound tree and commit:
>
>   9c229127aee2 ("drm/i915: hdmi: add CEC notifier to intel_hdmi")
>
> from the mfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/i915/Kconfig
> index 5c607f2c707b,2d65d567d5d1..000000000000
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@@ -23,7 -23,7 +23,8 @@@ config DRM_I91
>         select SYNC_FILE
>         select IOSF_MBI
>         select CRC32
>  +      select SND_HDA_I915 if SND_HDA_CORE
> +       select CEC_CORE if CEC_NOTIFIER
>         help
>           Choose this option if you have a system that has "Intel Graphics
>           Media Accelerator" or "HD Graphics" integrated graphics,

Anyone who cares about alphabetically sorting the (long) list of selects,
reducing the potential for conflicts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
