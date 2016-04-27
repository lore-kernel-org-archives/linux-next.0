From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Apr 27
Date: Wed, 27 Apr 2016 16:31:36 +0900
Message-ID: <20160427073136.GB7601@swordfish>
References: <20160427170354.5c643779@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160427170354.5c643779@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello,

commit 2f7600bc981cb0fd7ea0b92618bae32dcc778317
Author: Thierry Reding <treding@nvidia.com>
Date:   Tue Apr 5 17:17:34 2016 +0200

    phy: core: Allow children node to be overridden
   =20
    In order to more flexibly support device tree bindings, allow drive=
rs to
    override the container of the child nodes. By default the device no=
de of
    the PHY provider is assumed to be the parent for children, but bind=
ings
    may decide to add additional levels for better organization.


this does not compile on !CONFIG_OF systems

drivers/phy/phy-core.c: In function =E2=80=98__of_phy_provider_register=
=E2=80=99:
drivers/phy/phy-core.c:848:13: error: implicit declaration of function =
=E2=80=98of_get_next_parent=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    parent =3D of_get_next_parent(parent);
             ^~~~~~~~~~~~~~~~~~
drivers/phy/phy-core.c:848:11: warning: assignment makes pointer from i=
nteger without a cast [-Wint-conversion]
    parent =3D of_get_next_parent(parent);
           ^
  CC [M]  drivers/net/usb/usbnet.o
cc1: some warnings being treated as errors
  CC      net/ipv4/proc.o
scripts/Makefile.build:289: recipe for target 'drivers/phy/phy-core.o' =
failed
make[2]: *** [drivers/phy/phy-core.o] Error 1
scripts/Makefile.build:440: recipe for target 'drivers/phy' failed
make[1]: *** [drivers/phy] Error 2
make[1]: *** Waiting for unfinished jobs....


	-ss
