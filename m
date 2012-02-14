From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Breakage from ARM when building x86
Date: Tue, 14 Feb 2012 16:44:53 +0000
Message-ID: <20120214164453.003d9777@pyramind.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:59308 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147Ab2BNQnM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2012 11:43:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, rmk@arm.linux.org.uk

Either this needs the headers fixing or should be protected by an ARM
config, not sure which

drivers/mfd/twl-core.c: In function =E2=80=98twl_probe=E2=80=99:
drivers/mfd/twl-core.c:1218:2: error: implicit declaration of function
=E2=80=98irq_alloc_descs=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
drivers/mfd/twl-core.c:1226:2: error: implicit declaration of function
=E2=80=98irq_domain_add_legacy=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
drivers/mfd/twl-core.c:1227:11: error: =E2=80=98irq_domain_simple_ops=E2=
=80=99 undeclared
(first use in this function) drivers/mfd/twl-core.c:1227:11: note: each
undeclared identifier is reported only once for each function it appear=
s
in cc1: some warnings being treated as errors

make[2]: *** [drivers/mfd/twl-core.o] Error 1
make[1]: *** [drivers/mfd] Error 2
