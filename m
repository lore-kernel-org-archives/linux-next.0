From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Mon, 8 Dec 2014 12:54:47 +0000
Message-ID: <20141208125447.GJ3951@x1>
References: <20141208230517.13ebfe4f@canb.auug.org.au>
 <20141208121342.GW11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:40800 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752514AbaLHMyw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2014 07:54:52 -0500
Received: by mail-qa0-f43.google.com with SMTP id bm13so3242518qab.2
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2014 04:54:51 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20141208121342.GW11764@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurentiu Palcu <laurentiu.palcu@intel.com>

On Mon, 08 Dec 2014, Mark Brown wrote:

> On Mon, Dec 08, 2014 at 11:05:17PM +1100, Stephen Rothwell wrote:
>=20
> > Caused by commit cf9e9c98fa8c ("spi: Add new driver for
> > STMicroelectronics' SPI Controller").
>=20
> > To me COMPILE_TEST means "this builds everywhere, make sure it does=
n't
> > break" ... not "lets set this and see if Stephen finds anything" :-=
)
>=20
> > I reverted both commits for today.
>=20
> I've dropped both from my tree too.

Patches re-sent without COMPILE_TEST support.

I will re-enable COMPILE_TEST when Will Deacon's patch to fix this
kind of nonsense lands.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
