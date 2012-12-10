From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the arm-soc tree with the sound-asoc tree
Date: Sun, 9 Dec 2012 22:49:59 -0800
Message-ID: <CAOesGMixeGKmie_dioz24O1MD+2KJEn2z-gvHtZojgjCnsdJXQ@mail.gmail.com>
References: <20121210174057.9862b43ff7350ba20c048df3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121210174057.9862b43ff7350ba20c048df3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rahul Sharma <rahul.sharma@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 9, 2012 at 10:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/plat-samsung/include/plat/devs.h between commit a08485d8fdf6
> ("ASoC: Samsung: Do not register samsung audio dma device as pdev") from
> the sound-asoc tree and commit 0a9d5ac307ae ("ARM: EXYNOS: removing
> exynos-drm device registration from non-dt platforms") from the arm-soc
> tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.


-Olof
