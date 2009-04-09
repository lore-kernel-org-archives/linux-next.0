From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [BUILD FAILURE 05] Next April 9 : PPC64 randconfig
 [drivers/net/wan/wanxlfw.inc]
Date: Thu, 9 Apr 2009 16:51:35 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0904091650060.4839@vixen.sonytel.be>
References: <1239285152.5188.66.camel@subratamodak.linux.ibm.com> <1239285437.5188.68.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:55942 "EHLO
	pophost.sonytel.be" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756637AbZDIOvh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 10:51:37 -0400
In-Reply-To: <1239285437.5188.68.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Linuxppc-dev <Linuxppc-dev@ozlabs.org>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-net@vger.kernel.org

On Thu, 9 Apr 2009, Subrata Modak wrote:
> Observed the following error:
>=20
> BLD FW  drivers/net/wan/wanxlfw.inc
> /bin/sh: as68k: command not found
> make[3]: *** [drivers/net/wan/wanxlfw.inc] Error 127
> make[2]: *** [drivers/net/wan] Error 2
> make[1]: *** [drivers/net] Error 2
> make: *** [drivers] Error 2

Yeah, if you enable CONFIG_WANXL_BUILD_FIRMWARE without
CONFIG_PREVENT_FIRMWARE_BUILD (the trick for allmodconfig?), you need t=
he
appropriate tools installed...

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
