From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: RE: linux-next: build warning after merge of the spi tree
Date: Tue, 29 Jan 2019 06:57:51 +0000
Message-ID: <VI1PR04MB57262F1ADEEC151C11E0F48499970@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <20190129130237.677e5ac8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129130237.677e5ac8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, Boris Brezillon <bbrezillon@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, January 29, 2019 7:33 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Ma=
iling
> List <linux-kernel@vger.kernel.org>; Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com>; Frieder Schrempf
> <frieder.schrempf@kontron.de>; Boris Brezillon <bbrezillon@kernel.org>;
> Ashish Kumar <ashish.kumar@nxp.com>
> Subject: linux-next: build warning after merge of the spi tree
>=20
> Hi all,
>=20
> After merging the spi tree, today's linux-next build (KCONFIG_NAME) produ=
ced
> this warning:
>=20
> WARNING: modpost: missing MODULE_LICENSE() in drivers/spi/spi-nxp-fspi.o
> see include/linux/module.h for more information
>=20
Can someone help in pointing out that why above warning message is coming f=
or mentioned commit.
Below MODULE_LICENSE string is present in the above mentioned file, drivers=
/spi/spi-nxp-fspi.c.
    MODULE_LICENSE("GPL v2");

--
Regards,
Yogesh Gaur
> Introduced by commit
>=20
>   a5356aef6a90 ("spi: spi-mem: Add driver for NXP FlexSPI controller")
>=20
> --
> Cheers,
> Stephen Rothwell
