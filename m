From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the nand tree
Date: Tue, 02 Apr 2019 01:31:52 +0200
Message-ID: <1554161512.10471.3@crapouillou.net>
References: <20190402101431.6708cb70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402101431.6708cb70@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Le mar. 2 avril 2019 =E0 1:14, Stephen Rothwell <sfr@canb.auug.org.au> a=20
=E9crit :
> Hi all,
>=20
> After merging the nand tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:26:5: error: redefinition=20
> of 'ingenic_ecc_calculate'
>  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>      ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:39:5: note: previous=20
> definition of 'ingenic_ecc_calculate' was here
>  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>      ^~~~~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:47:5: error: redefinition=20
> of 'ingenic_ecc_correct'
>  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
>      ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:46:5: note: previous=20
> definition of 'ingenic_ecc_correct' was here
>  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
>      ^~~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:93:21: error: redefinition=20
> of 'of_ingenic_ecc_get'
>  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *of_node)
>                      ^~~~~~~~~~~~~~~~~~
> In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:57:21: note: previous=20
> definition of 'of_ingenic_ecc_get' was here
>  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *np)
>                      ^~~~~~~~~~~~~~~~~~
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:119:6: error: redefinition=20
> of 'ingenic_ecc_release'
>  void ingenic_ecc_release(struct ingenic_ecc *ecc)
>       ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:53:6: note: previous=20
> definition of 'ingenic_ecc_release' was here
>  void ingenic_ecc_release(struct ingenic_ecc *ecc)
>       ^~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   8278ad0d709a ("mtd: rawnand: ingenic: Separate top-level and SoC=20
> specific code")
>=20
> I have used the nand tree from next-20190401 for today.

That makes no sense to me; from the offsets of the errors in the=20
ingenic_ecc.h
file, it seems that CONFIG_MTD_NAND_INGENIC_ECC is not set, and in this=20
case
ingenic_ecc.c should not be compiled at all.

-Paul

=
