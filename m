From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 24 Nov 2009 08:31:54 +0200
Message-ID: <1259044314.18407.51.camel@localhost>
References: <20091124121415.dc1e98a0.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:36005 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757484AbZKXGcQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2009 01:32:16 -0500
In-Reply-To: <20091124121415.dc1e98a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Corentin Chary <corentincj@iksaif.net>

On Tue, 2009-11-24 at 02:14 +0100, Stephen Rothwell wrote:
> Hi Artem,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> fs/ubifs/super.c: In function 'open_ubi':
> fs/ubifs/super.c:1866: error: implicit declaration of function 'ubi_o=
pen_volume_path'
> fs/ubifs/super.c:1866: warning: assignment makes pointer from integer=
 without a cast
>=20
> Caused by commit 82ccbf8c4ec2113d4e73dbac3ca914019ca883ca ("UBIFS:
> support mounting of UBI volume character devices") which I have rever=
ted
> for today.

Stephen,

thanks for quick reaction and sorry for the hassle. I've just fixed thi=
s
up.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
