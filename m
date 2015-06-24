From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Wed, 24 Jun 2015 10:21:20 +0900
Message-ID: <558A0610.7070405@samsung.com>
References: <20150623115245.2142288e@canb.auug.org.au>
 <20150624110122.2dcbc338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47771 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbbFXBVl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 21:21:41 -0400
In-reply-to: <20150624110122.2dcbc338@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>

Hi Dave and Stephen,

On 2015=EB=85=84 06=EC=9B=94 24=EC=9D=BC 10:01, Stephen Rothwell wrote:
> Hi Dave,
>=20
> On Tue, 23 Jun 2015 11:52:45 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> After merging the drm-exynos tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_r=
egs':
>> adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpo=
int_by_regs'
>> drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined h=
ere
>> drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph=
_get_endpoint_by_regs':
>> atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_end=
point_by_regs'
>> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0=
x2ce3): first defined here
>> drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_=
get_endpoint_by_regs':
>> rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endp=
oint_by_regs'
>> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0=
x2ce3): first defined here
>>
>> Caused by commit:
>>
>>   a0f7001c18ca ("of: add helper for getting endpoint node of specifi=
c identifiers")
>=20
> This failure is now in the drm tree (where above patch is commit
> 8ccd0d0ca041).  I have used the patch from Inki for today.

As you know, I posted below patch which fixes the build error,
	[PATCH] of: fix a build error to f_graph_get_endpoint_by_regs function

However, I think we need Acked-by from device tree maintainer to merge
it to drm-next.

Thanks,
Inki Dae

>=20
