From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Mon, 25 Feb 2019 10:19:15 +0100
Message-ID: <CAK8P3a3moJ12SDM3Ow-Hw3qBeTv9siswK+9pPiEA4JJ+7k4xvg@mail.gmail.com>
References: <20190225123615.49bce7cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225123615.49bce7cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 25, 2019 at 2:36 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Takashi,
>
> Today's linux-next merge of the sound tree got conflicts in:
>
>   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
>
> between commits:
>
>   5eef17ee764d ("arm64: tegra: p2972: Sort nodes properly")
>   be4f0dd347ad ("arm64: tegra: p2597: Sort nodes by unit-address")
>
> from the arm-soc tree and commit:
>
>   11ce4308307c ("arm64: tegra: custom name for hda sound card")
>
> from the sound tree.
>
> I fixed it up (see below - in tegra194-p2972-0000.dts. the line added
> just needed to be moved up a few lines) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The merge looks fine to me, but I wonder about that commit
in the alsa tree, why does the sound card need a board specific
name?

I see this property being used in commit c0bde003a013 ("ALSA:
hda/tegra: sound card name from device tree"), which removes
a questionable use of the root compatible property, replacing
it with the new 'nvidia,model' property. We don't do this for any
other subsystem, so why does the sound subsystem export
information about the board as a string here?

(added ASoC maintainers to Cc for insight).

      Arnd
