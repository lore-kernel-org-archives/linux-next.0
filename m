From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with the pm tree
Date: Wed, 29 Jul 2015 08:44:19 +0100
Message-ID: <20150729074419.GG2284@x1>
References: <20150729122730.1fc9b6a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150729122730.1fc9b6a6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

> Hi Lee,

Morning Stephen.

> Today's linux-next merge of the mfd tree got a conflict in:
>=20
>   drivers/acpi/scan.c
>=20
> between commit:
>=20
>   68c6b148daa6 ("ACPI / scan: Move device matching code to bus.c")
>=20
> from the pm tree and commit:
>=20
>   712e960f0ee9 ("ACPI / PM: Attach ACPI power domain only once")
>=20
> from the mfd tree.

I believe this will go away when Rafael pulls [0]

[0] http://www.kernelhub.org/?msg=3D803290&p=3D2

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
