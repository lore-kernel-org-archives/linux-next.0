From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubi tree build warnings
Date: Wed, 08 Jul 2009 07:45:06 +0300
Message-ID: <4A542452.6060703@nokia.com>
References: <20090708130921.a361f6d2.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:42154 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212AbZGHEpf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2009 00:45:35 -0400
In-Reply-To: <20090708130921.a361f6d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

ext Stephen Rothwell wrote:
> Hi Artem,
>=20
> Today's linux-next build (x86_64 allmodconfig) produced these warning=
s:
>=20
> drivers/mtd/ubi/io.c: In function 'nor_erase_prepare':
> drivers/mtd/ubi/io.c:484: warning: passing argument 5 of 'ubi->mtd->w=
rite' from incompatible pointer type
> drivers/mtd/ubi/io.c:484: note: expected 'const u_char *' but argumen=
t is of type 'uint32_t *'
> drivers/mtd/ubi/io.c:486: warning: format '%zd' expects type 'signed =
size_t', but argument 5 has type 'int'
> drivers/mtd/ubi/io.c:486: warning: too many arguments for format
> drivers/mtd/ubi/io.c:493: warning: passing argument 5 of 'ubi->mtd->w=
rite' from incompatible pointer type
> drivers/mtd/ubi/io.c:493: note: expected 'const u_char *' but argumen=
t is of type 'uint32_t *'
>=20
> Introduced by commit ebf53f421308c2f59c9bcbad4c5c297a0d00199a ("UBI: =
fix
> NOR flash recovery").

Will fix ASAP, thank you! I'm always wondering how you manage
to reproduce warnings I do not see.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
