From: Daniel Ribeiro <drwyrm@gmail.com>
Subject: Re: [PATCH v3] MFD: PCAP driver
Date: Wed, 03 Jun 2009 21:20:56 -0300
Message-ID: <1244074856.4767.26.camel@brutus>
References: <1243399356.2263.46.camel@brutus>
	 <10f740e80906030738x3b42de18n189367b28a730c56@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.26]:55311 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406AbZFDAVA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 20:21:00 -0400
In-Reply-To: <10f740e80906030738x3b42de18n189367b28a730c56@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>, Philipp Zabel <philipp.zabel@gmail.com>, openezx-devel <openezx-devel@lists.openezx.org>, linux-next <linux-next@vger.kernel.org>

Em Qua, 2009-06-03 =C3=A0s 16:38 +0200, Geert Uytterhoeven escreveu:=20
> > +config EZX_PCAP
> > +       bool "PCAP Support"
> > +       depends on SPI_MASTER
>=20
> It also has to depend on GENERIC_HARDIRQS, as it needs set_irq_type()=
:

Hi Geert, sorry for this. :)



=46ix EZX_PCAP dependency

Signed-off-by: Daniel Ribeiro <drwyrm@gmail.com>

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 060ee14..6557d60 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -243,7 +243,7 @@ config PCF50633_GPIO
=20
 config EZX_PCAP
 	bool "PCAP Support"
-	depends on SPI_MASTER
+	depends on GENERIC_HARDIRQS && SPI_MASTER
 	help
 	  This enables the PCAP ASIC present on EZX Phones. This is
 	  needed for MMC, TouchScreen, Sound, USB, etc..

--=20
Daniel Ribeiro
