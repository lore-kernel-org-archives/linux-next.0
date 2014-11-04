From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 4 Nov 2014 08:09:17 +0000
Message-ID: <20141104080917.GC17577@x1>
References: <20141104164005.1a45ad46@canb.auug.org.au>
 <1415087669.2389.7.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:36647 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792AbaKDIJW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Nov 2014 03:09:22 -0500
Received: by mail-ie0-f178.google.com with SMTP id rp18so7052282iec.9
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2014 00:09:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1415087669.2389.7.camel@AMDC1943>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Tue, 04 Nov 2014, Krzysztof Kozlowski wrote:
> On wto, 2014-11-04 at 16:40 +1100, Stephen Rothwell wrote:
> >=20
> > After merging the mfd tree, today's linux-next build (powerpc allye=
sconfig)
> > failed like this:

[Crash, bang, wallop]

> > And so on ...
> >=20
> > Caused by commit 9d5f4c2c748e ("mfd: max77686/802: Remove support f=
or
> > board files") from the mfd tree.
> >=20
> > I reverted that commit for today.
>=20
> The commit depends on other patches from a set which hadn't been
> applied. Please drop it.

It is done!

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
