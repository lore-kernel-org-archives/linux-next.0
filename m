From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Date: Thu, 8 Mar 2018 11:19:03 +0800
Message-ID: <CAGb2v66m13KiVfsKADGPSTNZHPi4+AGMhKtewXGvFAh=2bNFag@mail.gmail.com>
References: <20180308093532.7fcfb205@canb.auug.org.au> <20180308033746.fc65a8101bf9255b742b2f56@bidouilliste.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308033746.fc65a8101bf9255b742b2f56@bidouilliste.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Maxime Ripard <maxime.ripard@bootlin.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Emmanuel Vadot <manu@freebsd.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Thu, Mar 8, 2018 at 10:37 AM, Emmanuel Vadot <manu@bidouilliste.com> wrote:
>
>  Hi All,
>
> On Thu, 8 Mar 2018 09:35:32 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>>
>> After merging the sunxi tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dtb: ERROR (phandle_references): Reference to non-existent node or label "mmc2_8bits_pins"
>>
>> Caused by commit
>>
>>   89fd776b2b9f ("dts: sunxi: Add eMMC for NanoPi M1 Plus")
>>
>> I have merged the version of the sunxi tree from next-20180307 for today.
>>
>> --
>> Cheers,
>> Stephen Rothwell
>
>  I don't even know how I managed to screw this patch.
>  Maxime, Chen-Yu,  how would you like this problem to be handled ?

There was a typo: "mmc2_8bits_pins" should have been "mmc2_8bit_pins".

I've fixed it and updated our branches.

ChenYu

>
>  Cheers,
>
> --
> Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
