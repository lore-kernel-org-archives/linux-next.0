From: Inki Dae <inki.dae@samsung.com>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Tue, 23 Jun 2015 14:30:48 +0900
Message-ID: <5588EF08.2000506@samsung.com>
References: <20150623115245.2142288e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38383 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbFWFau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 01:30:50 -0400
In-reply-to: <20150623115245.2142288e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>

Hi Stephen,

On 2015=EB=85=84 06=EC=9B=94 23=EC=9D=BC 10:52, Stephen Rothwell wrote:
> Hi Inki,
>=20
> After merging the drm-exynos tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Thanks for report.

I found out this problem. That is because below patch missed "static"
when defining of_graph_get_endpoint_by_regs function,
	a0f7001c18ca ("of: add helper for getting endpoint node of specific
identifiers")

=46or this, I will fix and post it soon.

Thanks,
Inki Dae

>=20
> drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_re=
gs':
> adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpoi=
nt_by_regs'
> drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined he=
re
> drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph_=
get_endpoint_by_regs':
> atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_endp=
oint_by_regs'
> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x=
2ce3): first defined here
> drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_g=
et_endpoint_by_regs':
> rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endpo=
int_by_regs'
> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x=
2ce3): first defined here
>=20
> Caused by commit:
>=20
>   a0f7001c18ca ("of: add helper for getting endpoint node of specific=
 identifiers")
>=20
> I have used the drm-exynos from next-20150622 for today.
>=20
