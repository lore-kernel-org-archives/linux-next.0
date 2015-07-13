From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 13 Jul 2015 08:14:56 +0200
Message-ID: <CAD3Xx4JbHN_agRAAZ=KnjLrGTVjBQSM_D-y3Kpfe0G0GNpqmZQ@mail.gmail.com>
References: <20150713132309.4ad9b4c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150713132309.4ad9b4c8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Paul Bolle <pebolle@tiscali.nl>, Andreas Ruprecht <rupran@einserver.de>, hengelein Stefan <stefan.hengelein@fau.de>
List-Id: linux-next.vger.kernel.org

Hi,

On Mon, Jul 13, 2015 at 5:23 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> warning: (SND_SOC_ALL_CODECS) selects SND_SOC_STI_SAS which has unmet direct dependencies (SOUND && !M68K && !UML && SND && SND_SOC && SND_SOC_STI)

Here's the introducing hunk:

+config SND_SOC_STI_SAS
+       tristate "codec Audio support for STI SAS codec"
+       depends on SND_SOC_STI

SND_SOC_STI is not defined in Kconfig.

Kind regards,
 Valentin

> Introduced by commit
>
>   32a726b2e089 ("ASoC: sti-sas: Add sti platform codec")
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
