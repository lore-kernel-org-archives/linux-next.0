From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Mon, 25 Feb 2019 16:54:37 +0530
Message-ID: <e2aaed45-0fb1-c9c8-76d4-3b97b36cada6@nvidia.com>
References: <20190225123615.49bce7cd@canb.auug.org.au>
 <CAK8P3a3moJ12SDM3Ow-Hw3qBeTv9siswK+9pPiEA4JJ+7k4xvg@mail.gmail.com>
 <s5hr2bw2k7m.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5hr2bw2k7m.wl-tiwai@suse.de>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-next.vger.kernel.org


On 2/25/2019 4:44 PM, Takashi Iwai wrote:
> On Mon, 25 Feb 2019 10:19:15 +0100,
> Arnd Bergmann wrote:
>> On Mon, Feb 25, 2019 at 2:36 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>>> Hi Takashi,
>>>
>>> Today's linux-next merge of the sound tree got conflicts in:
>>>
>>>    arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>>    arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>>>
>>> between commits:
>>>
>>>    5eef17ee764d ("arm64: tegra: p2972: Sort nodes properly")
>>>    be4f0dd347ad ("arm64: tegra: p2597: Sort nodes by unit-address")
>>>
>>> from the arm-soc tree and commit:
>>>
>>>    11ce4308307c ("arm64: tegra: custom name for hda sound card")
>>>
>>> from the sound tree.
>>>
>>> I fixed it up (see below - in tegra194-p2972-0000.dts. the line added
>>> just needed to be moved up a few lines) and can carry the fix as
>>> necessary. This is now fixed as far as linux-next is concerned, but any
>>> non trivial conflicts should be mentioned to your upstream maintainer
>>> when your tree is submitted for merging.  You may also want to consider
>>> cooperating with the maintainer of the conflicting tree to minimise any
>>> particularly complex conflicts.
>> The merge looks fine to me, but I wonder about that commit
>> in the alsa tree, why does the sound card need a board specific
>> name?
>>
>> I see this property being used in commit c0bde003a013 ("ALSA:
>> hda/tegra: sound card name from device tree"), which removes
>> a questionable use of the root compatible property, replacing
>> it with the new 'nvidia,model' property. We don't do this for any
>> other subsystem, so why does the sound subsystem export
>> information about the board as a string here?
> The sound subsystem exports merely some understandable name string
> for the given sound card object, and that was composed from the
> compatible string in the past, which turned out to be useless on some
> configs.
>
> But this kind of addition is an extremely bad manner, I'm fine to
> revert these (at best with a better alternative).  This isn't about
> any functionality but rather some readable information that isn't a
> part of API.
>
The motivation for adding custom sound card name is following,
1. When for boards, multiple HDMI/DP ports are exposed, it is sometimes
 =C2=A0=C2=A0 necessary to know the default port or any customization for t=
hat matter.
 =C2=A0=C2=A0 Audio userspace can distinguish based on the sound card names=
.
2. Multiple sound cards can coexist for a platform, the indication of=20
particular
 =C2=A0=C2=A0 audio path is useful.
3. It can help to customize audio paths.
 =C2=A0=C2=A0 Generally people use "*,model" property in DT to name the sou=
nd complex.
 =C2=A0=C2=A0 Ex: "samsung,model" [sound/soc/samsung/snow.c]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rockchip,model" [sound/soc/rockchip/=
rockchip_rt5645.c]

Thanks,
Sameer.
> thanks,
>
> Takashi
