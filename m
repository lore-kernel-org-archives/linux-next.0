From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: linux-next: Tree for Aug 31 (drivers/usb/gadget/udc/renesas_usb3)
Date: Mon, 3 Sep 2018 03:20:23 +0000
Message-ID: <OSBPR01MB2293786602584B7F92A4A333D80C0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20180831130356.6b0fd971@canb.auug.org.au>
 <d3eaa71e-c11d-82c7-27c3-3cd0a2b031c2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3eaa71e-c11d-82c7-27c3-3cd0a2b031c2@infradead.org>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

> From: Randy Dunlap, Sent: Saturday, September 1, 2018 12:43 AM
>=20
> On 08/30/2018 08:03 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20180830:
> >
>=20
> on i386:
>=20
> drivers/usb/gadget/udc/renesas_usb3.o: In function `renesas_usb3_probe':
> renesas_usb3.c:(.text+0x16da): undefined reference to `usb_of_get_compani=
on_dev'
>=20
>=20
> Full randconfig file is attached.

Thank you for the report!
I already submitted a fix patch [1]. But this patch is not applied yet.

[1]
https://marc.info/?l=3Dlinux-usb&m=3D153476263226681&w=3D2


Related ML archives:
https://marc.info/?l=3Dlinux-usb&m=3D153382696712253&w=3D2
https://marc.info/?l=3Dlinux-usb&m=3D153419699328537&w=3D2

Best regards,
Yoshihiro Shimoda


> --
> ~Randy
