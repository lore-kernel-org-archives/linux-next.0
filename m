From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: linux-next: manual merge of the rockchip tree with the amlogic tree
Date: Fri, 26 Apr 2019 21:25:04 +0200
Message-ID: <CAFBinCA9yPKzr=UPtGDe+fCxd3H6cjpoPKQwfZNvPq4QKC0EBg@mail.gmail.com>
References: <20190424093137.241407fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424093137.241407fe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Stuebner <heiko@sntech.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Apr 24, 2019 at 1:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rockchip tree got a conflict in:
>
>   arch/arm/configs/multi_v7_defconfig
>
> between commit:
>
>   029da5e5266c ("ARM: multi_v7_defconfig: enable the Amlogic Meson ADC and eFuse drivers")
>
> from the amlogic tree and commit:
>
>   366391f04177 ("ARM: multi_v7_defconfig: Enable missing drivers for supported Chromebooks")
>
> from the rockchip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
I just checked the result in next-20190426 and it looks fine
thank you for taking care of this!

do you need anything from me (Acked-by, etc.) to avoid any issues
during the merge for Linus and/or the ARM maintainers?


Regards
Martin
