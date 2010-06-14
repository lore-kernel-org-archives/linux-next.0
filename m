From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: build warning after merge of the ubi tree
Date: Mon, 14 Jun 2010 05:34:47 +0300
Message-ID: <1276482887.9881.0.camel@localhost.localdomain>
References: <20100614115822.728c3199.sfr@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:51586 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754982Ab0FNCex (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 13 Jun 2010 22:34:53 -0400
In-Reply-To: <20100614115822.728c3199.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2010-06-14 at 11:58 +1000, Stephen Rothwell wrote:
> Hi Artem,
>=20
> After merging the ubi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/mtd/ubi/io.c: In function 'ubi_io_read':
> drivers/mtd/ubi/io.c:153: warning: initialization makes integer from =
pointer without a cast
> drivers/mtd/ubi/io.c:170: warning: format '%s' expects type 'char *',=
 but argument 5 has type 'int'
> drivers/mtd/ubi/io.c:177: warning: format '%zd' expects type 'signed =
size_t', but argument 7 has type 'int'
> drivers/mtd/ubi/io.c:177: warning: too many arguments for format
>=20
> Introduced by commit 1a49af2ca019dcb4614c32f832bbcb814b61409c ("UBI:
> improve ECC error message").

Thanks Stephen,

I'll take care of these today.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
