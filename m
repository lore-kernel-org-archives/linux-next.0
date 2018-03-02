From: John Hsu <KCHSU0@nuvoton.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 2 Mar 2018 10:49:37 +0800
Message-ID: <5A98BBC1.2060608@nuvoton.com>
References: <20180302105434.16280703@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302105434.16280703@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 3/2/2018 7:54 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> sound/soc/intel/boards/cht_bsw_nau8824.c: In function 'cht_codec_init':
> sound/soc/intel/boards/cht_bsw_nau8824.c:137:29: error: passing argument 1 of 'nau8824_enable_jack_detect' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   nau8824_enable_jack_detect(codec, jack);
>                              ^~~~~
> In file included from sound/soc/intel/boards/cht_bsw_nau8824.c:31:0:
> sound/soc/intel/boards/../../codecs/nau8824.h:474:5: note: expected 'struct snd_soc_component *' but argument is of type 'struct snd_soc_codec *'
>  int nau8824_enable_jack_detect(struct snd_soc_component *component,
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   5b00ce63e07f ("ASoC: Intel: add nau8824 sound card")
>
> I have used the sound-asoc tree from next-20180301 for today.
>

The fix patch has submitted. Please check the link as follows:
http://mailman.alsa-project.org/pipermail/alsa-devel/2018-March/132811.html
[alsa-devel] [PATCH] ASoC: Intel: fix argument error in nau8824 machine


===========================================================================================
The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
