From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Wed, 24 Jun 2015 10:25:23 +0900
Message-ID: <558A0703.2060103@samsung.com>
References: <20150623115245.2142288e@canb.auug.org.au>
 <20150624110122.2dcbc338@canb.auug.org.au> <558A0610.7070405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <558A0610.7070405@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-next.vger.kernel.org

On 2015=EB=85=84 06=EC=9B=94 24=EC=9D=BC 10:21, Inki Dae wrote:
> Hi Dave and Stephen,
>=20
> On 2015=EB=85=84 06=EC=9B=94 24=EC=9D=BC 10:01, Stephen Rothwell wrot=
e:
>> Hi Dave,
>>
>> On Tue, 23 Jun 2015 11:52:45 +1000 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
>>>
>>> After merging the drm-exynos tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_=
regs':
>>> adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endp=
oint_by_regs'
>>> drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined =
here
>>> drivers/media/platform/soc_camera/atmel-isi.o: In function `of_grap=
h_get_endpoint_by_regs':
>>> atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_en=
dpoint_by_regs'
>>> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+=
0x2ce3): first defined here
>>> drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph=
_get_endpoint_by_regs':
>>> rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_end=
point_by_regs'
>>> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+=
0x2ce3): first defined here
>>>
>>> Caused by commit:
>>>
>>>   a0f7001c18ca ("of: add helper for getting endpoint node of specif=
ic identifiers")
>>
>> This failure is now in the drm tree (where above patch is commit
>> 8ccd0d0ca041).  I have used the patch from Inki for today.
>=20
> As you know, I posted below patch which fixes the build error,
> 	[PATCH] of: fix a build error to f_graph_get_endpoint_by_regs functi=
on
>=20
> However, I think we need Acked-by from device tree maintainer to merg=
e
> it to drm-next.

Sorry, Rob did already Acked-by. :)

Thanks,
Inki Dae

>=20
> Thanks,
> Inki Dae
>=20
>>
>=20
