From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: manual merge of the samsung tree with the arm-soc
 and at91 trees
Date: Wed, 20 May 2015 11:16:46 +0200
Message-ID: <20150520091646.GF3338@piout.net>
References: <20150520102743.3d336a73@canb.auug.org.au>
 <CAJKOXPdsi-5kdQJtybeaMCy0DXuRTRGgBEOM=SH9BsjquEMjCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPdsi-5kdQJtybeaMCy0DXuRTRGgBEOM=SH9BsjquEMjCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Baruch Siach <baruch@tkos.co.il>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-next.vger.kernel.org

On 20/05/2015 at 09:35:36 +0900, Krzysztof Kozlowski wrote :
> 2015-05-20 9:27 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Kukjin,
> >
> > Today's linux-next merge of the samsung tree got a conflict in
> > arch/arm/configs/multi_v7_defconfig between various commits from the
> > arm-soc and at91 trees and various commits from the samsung tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Hi,
> 
> Thanks for the merge.
> 
> The parts coming from samsung-soc related to manually toggling stuff
> (by me and Javier) look fine. The rest (coming from Kukjin's
> savedefconfig) I don't know - too much of them.
> 

Hum, last time I asked, we were not supposed to do a savedefconfig on
multi_v7...

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
