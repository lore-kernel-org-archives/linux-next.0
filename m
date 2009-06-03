From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubi tree build failure
Date: Wed, 03 Jun 2009 11:46:02 +0300
Message-ID: <4A26384A.6000906@nokia.com>
References: <20090603184408.49c7fb1f.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.233]:63995 "EHLO
	mgw-mx06.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586AbZFCIqa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 04:46:30 -0400
In-Reply-To: <20090603184408.49c7fb1f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Pervushin <dpervushin@embeddedalley.com>

Hi,

Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
>=20
> drivers/mtd/ubi/gluebi.c: In function 'gluebi_get_device':
> drivers/mtd/ubi/gluebi.c:126: error: implicit declaration of function=
 'IS_ERR'
> drivers/mtd/ubi/gluebi.c:129: error: implicit declaration of function=
 'PTR_ERR'
>=20
> Introduced by commit ec5c514efde253de7f28668c88bbae26d2a293de ("UBI: =
make
> gluebi a separate module") from the ubi tree.  I guess the conversion
> managed to remove an implicit include of linux/err.h.
>=20
> I have reverted that commit for today.  I then needed to also revert
> commit 518ceef0c9ca97023e45ae46aedaefa240c690a6 ("UBI: remove built-i=
n
> gluebi") to make it build again.

My fault. Will be fixed shortly, thank you!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
