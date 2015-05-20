From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the samsung tree with the arm-soc and
 at91 trees
Date: Wed, 20 May 2015 11:47:45 +0200
Message-ID: <CAMuHMdVoot1mBHUmGMuTzCkxzd7H5TJThrwmPvnedFAOAP49pw@mail.gmail.com>
References: <20150520102743.3d336a73@canb.auug.org.au>
	<CAJKOXPdsi-5kdQJtybeaMCy0DXuRTRGgBEOM=SH9BsjquEMjCQ@mail.gmail.com>
	<20150520091646.GF3338@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150520091646.GF3338@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <maxime.coquelin@st.com>, Baruch Siach <baruch@tkos.co.il>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-next.vger.kernel.org

On Wed, May 20, 2015 at 11:16 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> On 20/05/2015 at 09:35:36 +0900, Krzysztof Kozlowski wrote :
>> 2015-05-20 9:27 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
>> > Today's linux-next merge of the samsung tree got a conflict in
>> > arch/arm/configs/multi_v7_defconfig between various commits from the
>> > arm-soc and at91 trees and various commits from the samsung tree.
>> >
>> > I fixed it up (see below) and can carry the fix as necessary (no action
>> > is required).
>>
>> Hi,
>>
>> Thanks for the merge.
>>
>> The parts coming from samsung-soc related to manually toggling stuff
>> (by me and Javier) look fine. The rest (coming from Kukjin's
>> savedefconfig) I don't know - too much of them.
>>
>
> Hum, last time I asked, we were not supposed to do a savedefconfig on
> multi_v7...

Yeah, IMHO it's something the arm-soc maintainers should do only right
after rc1.

Doing it at any other point in time may remove options that have just been
added to multi_v7_defconfig by an arm-soc submaintainer, and that depend on
a Kconfig change queued in another maintainer's for-next branch.

Personally, I think no arm-soc submaintainer should touch multi_v7_defconfig,
and all changes should be applied by the arm-soc maintainers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
