From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: Tree for December 16
Date: Wed, 17 Dec 2008 09:07:20 +0200
Message-ID: <4948A528.9090605@nokia.com>
References: <20081216223754.0c8e21d4.sfr@canb.auug.org.au> <20081216152607.f232fafd.akpm@linux-foundation.org>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:33336 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbYLQHLr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Dec 2008 02:11:47 -0500
In-Reply-To: <20081216152607.f232fafd.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <ext-adrian.hunter@nokia.com>, David Woodhouse <David.Woodhouse@intel.com>

ext Andrew Morton wrote:
> On Tue, 16 Dec 2008 22:37:54 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
>> I have created today's linux-next tree at
>> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
>> (patches at
>> http://www.kernel.org/pub/linux/kernel/people/sfr/linux-next/)
>=20
> This MTD patch:
>=20
> commit 69423d99fc182a81f3c5db3eb5c140acc6fc64be
> Author:     Adrian Hunter <ext-adrian.hunter@nokia.com>
> AuthorDate: Wed Dec 10 13:37:21 2008 +0000
> Commit:     David Woodhouse <David.Woodhouse@intel.com>
> CommitDate: Wed Dec 10 13:37:21 2008 +0000
>=20
>     [MTD] update internal API to support 64-bit device size
>=20
> broke the i386 build:
>=20
> ERROR: "__udivdi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
> ERROR: "__umoddi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
> ERROR: "__umoddi3" [drivers/mtd/devices/m25p80.ko] undefined!
>=20
> because things like
>=20
>                 pageaddr =3D instr->addr / priv->page_size;
>=20
> are now doing a 64-bit divide.
>=20
> These will all need to be hunted down and converted to do_div().

Right, I'll fix this shortly.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
