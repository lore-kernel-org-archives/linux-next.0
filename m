From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH] powerpc: fix compile error with 85xx/p1022_ds.c
Date: Tue, 13 Dec 2011 20:56:48 +0000
Message-ID: <CAOZdJXVyQd2CYCArTU1+6hRxOeVPkJP1evrGRKeO7cQPBU_vFA@mail.gmail.com>
References: <22284.1323643754@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]:50068
	"EHLO VA3EHSOBE009.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755114Ab1LMU4y convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Dec 2011 15:56:54 -0500
In-Reply-To: <22284.1323643754@neuling.org>
Content-Language: en-US
Content-ID: <EDBF6396A9C4DC4BB9C6B437E6D7075B@freescale.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>, Gala Kumar-B11780 <B11780@freescale.com>
Cc: Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Sun, Dec 11, 2011 at 4:49 PM, Michael Neuling <mikey@neuling.org> wr=
ote:
> Current linux-next compiled with mpc85xx_defconfig causes this:
> =A0arch/powerpc/platforms/85xx/p1022_ds.c:341:14: error: 'udbg_progre=
ss' undeclared here (not in a function)
>
> Add include to fix this.
>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Acked-by: Timur Tabi <timur@freescale.com>

--=20
Timur Tabi
Linux kernel developer at Freescale
