From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v3] MFD: PCAP driver
Date: Fri, 5 Jun 2009 00:54:49 +0200
Message-ID: <20090604225447.GA4806@sortiz.org>
References: <1243399356.2263.46.camel@brutus> <10f740e80906030738x3b42de18n189367b28a730c56@mail.gmail.com> <1244074856.4767.26.camel@brutus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:6278 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751860AbZFDWwk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 18:52:40 -0400
Content-Disposition: inline
In-Reply-To: <1244074856.4767.26.camel@brutus>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>, Philipp Zabel <philipp.zabel@gmail.com>, openezx-devel <openezx-devel@lists.openezx.org>, linux-next <linux-next@vger.kernel.org>

Hi Daniel,

On Wed, Jun 03, 2009 at 09:20:56PM -0300, Daniel Ribeiro wrote:
> Em Qua, 2009-06-03 =E0s 16:38 +0200, Geert Uytterhoeven escreveu:=20
> > > +config EZX_PCAP
> > > +       bool "PCAP Support"
> > > +       depends on SPI_MASTER
> >=20
> > It also has to depend on GENERIC_HARDIRQS, as it needs set_irq_type=
():
>=20
> Hi Geert, sorry for this. :)
>=20
>=20
>=20
> Fix EZX_PCAP dependency
>=20
> Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>
Thanks. Pushed to my for-next branch.
I fixed it on the original patch, to avoid having 2 commits.

Cheers,
Samuel.


> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 060ee14..6557d60 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -243,7 +243,7 @@ config PCF50633_GPIO
> =20
>  config EZX_PCAP
>  	bool "PCAP Support"
> -	depends on SPI_MASTER
> +	depends on GENERIC_HARDIRQS && SPI_MASTER
>  	help
>  	  This enables the PCAP ASIC present on EZX Phones. This is
>  	  needed for MMC, TouchScreen, Sound, USB, etc..
>=20
> --=20
> Daniel Ribeiro
>=20

--=20
Intel Open Source Technology Centre
http://oss.intel.com/
