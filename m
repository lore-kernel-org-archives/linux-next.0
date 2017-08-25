From: Hsin-yu Chao <hychao@chromium.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 25 Aug 2017 15:58:56 +0800
Message-ID: <CANyK0SmE7VwiDocjwSBqQFjZaTE1WOPZS9PBB8+wYtfPtOQ+Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Sorry for the trouble.
Looks like these rt5514_spi_* functions should be guarded by #if
IS_ENABLED(CONFIG_SND_SOC_RT5514_SPI)
I'll resend the patch to address this.

Thanks,
Hsin-yu

On Fri, Aug 25, 2017 at 3:41 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> sound/soc/codecs/rt5514.c: In function 'rt5514_dsp_voice_wake_up_put':
> sound/soc/codecs/rt5514.c:343:11: error: implicit declaration of function 'rt5514_spi_burst_write' [-Werror=implicit-function-declaration]
>      ret = rt5514_spi_burst_write(0x4ff80000,
>            ^
>
> Caused by commit
>
>   d18420b0a0b8 ("ASoC: rt5514: expose Hotword Model control")
>
> I have reverted that commit for today.
>
> --
> Cheers,
> Stephen Rothwell
