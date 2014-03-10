From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: Tree for Mar 6 (mfd/tps65218)
Date: Mon, 10 Mar 2014 15:31:42 +0000
Message-ID: <20140310153142.GD13661@lee--X1>
References: <20140306194821.3715d0b6212cc10415374a68@canb.auug.org.au>
 <5318B2B5.4030609@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:36102 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753752AbaCJPbr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Mar 2014 11:31:47 -0400
Received: by mail-we0-f169.google.com with SMTP id w62so8872700wes.0
        for <linux-next@vger.kernel.org>; Mon, 10 Mar 2014 08:31:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5318B2B5.4030609@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, J Keerthy <j-keerthy@ti.com>, Samuel Ortiz <sameo@linux.intel.com>

> > Hi all,
> >=20
> > There may be build failures in this tree due to the percpu changes =
in the
> > akpm tree.
> >=20
> > This tree fails (more than usual) the powerpc allyesconfig build.
> >=20
> > Changes since 20140305:
> >=20
>=20
> In linux-next-20140305 and -20140306:
>=20
> ERROR: "regmap_del_irq_chip" [drivers/mfd/tps65218.ko] undefined!
>=20
> when CONFIG_REGMAP_IRQ is not enabled.
>=20
> Driver's kconfig needs to select REGMAP_IRQ ?

=46ix submitted with your Reported-by. Thanks for letting us know.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
