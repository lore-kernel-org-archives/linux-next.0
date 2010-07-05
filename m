From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Has somethimg changed in next's Debian package generation?
Date: Mon, 05 Jul 2010 17:09:52 +0200
Message-ID: <4C31F5C0.2020106@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:33534 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758170Ab0GEPJ5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2010 11:09:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hello,

I build the kernel with make-kpkg under debian like:

make-kpkg kernel_image

I have had done it this way also with linux next. Lacking fresh sources=
=20
after a short break from next I tried to build today's next as always=20
but the build failed when it was to finally build the package saying=20
that there is a inconsisteny in control file. I tried to tinker a bit=20
with ./debian/control but to no effect.

Has something changed? It used to work just like that, there were no=20
problems at all.

Regards,

Piotr Hosowicz

--=20
R=F3=BFnica mi=EAdzy PiS, a PO jest taka, =BFe PO nie zro-
bi=B3a liberalizacji, a PiS nie zrobi=B3 lustracji.
NP: Chickenfoot - Oh Yeah
NB: 2.6.35-rc4
