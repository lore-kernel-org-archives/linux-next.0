From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the nand tree
Date: Tue, 02 Apr 2019 14:00:14 +0200
Message-ID: <1554206414.1199.0@crapouillou.net>
References: <20190402101431.6708cb70@canb.auug.org.au>
        <1554161512.10471.3@crapouillou.net> <20190402135631.38dcfe2a@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402135631.38dcfe2a@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon <boris.brezillon@bootlin.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Miquel,

Le mar. 2 avril 2019 =E0 13:56, Miquel Raynal=20
<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net> wrote on Tue, 02 Apr 2019=20
> 01:31:52
> +0200:
>=20
>>  Hi Stephen,
>>=20
>>  Le mar. 2 avril 2019 =E0 1:14, Stephen Rothwell=20
>> <sfr@canb.auug.org.au> a =E9crit :
>>  > Hi all,
>>  >
>>  > After merging the nand tree, today's linux-next build (x86_64
>>  > allmodconfig) failed like this:
>>  >
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:26:5: error:=20
>> redefinition > of 'ingenic_ecc_calculate'
>>  >  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>>  >      ^~~~~~~~~~~~~~~~~~~~~
>>  > In file included from=20
>> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:39:5: note: previous >=20
>> definition of 'ingenic_ecc_calculate' was here
>>  >  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>>  >      ^~~~~~~~~~~~~~~~~~~~~
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:47:5: error:=20
>> redefinition > of 'ingenic_ecc_correct'
>>  >  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
>>  >      ^~~~~~~~~~~~~~~~~~~
>>  > In file included from=20
>> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:46:5: note: previous >=20
>> definition of 'ingenic_ecc_correct' was here
>>  >  int ingenic_ecc_correct(struct ingenic_ecc *ecc,
>>  >      ^~~~~~~~~~~~~~~~~~~
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:93:21: error:=20
>> redefinition > of 'of_ingenic_ecc_get'
>>  >  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node=20
>> *of_node)
>>  >                      ^~~~~~~~~~~~~~~~~~
>>  > In file included from=20
>> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:57:21: note: previous=20
>> > definition of 'of_ingenic_ecc_get' was here
>>  >  struct ingenic_ecc *of_ingenic_ecc_get(struct device_node *np)
>>  >                      ^~~~~~~~~~~~~~~~~~
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:119:6: error:=20
>> redefinition > of 'ingenic_ecc_release'
>>  >  void ingenic_ecc_release(struct ingenic_ecc *ecc)
>>  >       ^~~~~~~~~~~~~~~~~~~
>>  > In file included from=20
>> drivers/mtd/nand/raw/ingenic/ingenic_ecc.c:14:
>>  > drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:53:6: note: previous >=20
>> definition of 'ingenic_ecc_release' was here
>>  >  void ingenic_ecc_release(struct ingenic_ecc *ecc)
>>  >       ^~~~~~~~~~~~~~~~~~~
>>  >
>>  > Caused by commit
>>  >
>>  >   8278ad0d709a ("mtd: rawnand: ingenic: Separate top-level and=20
>> SoC > specific code")
>>  >
>>  > I have used the nand tree from next-20190401 for today.
>>=20
>>  That makes no sense to me; from the offsets of the errors in the=20
>> ingenic_ecc.h
>>  file, it seems that CONFIG_MTD_NAND_INGENIC_ECC is not set, and in=20
>> this case
>>  ingenic_ecc.c should not be compiled at all.
>>=20
>=20
> I think
>=20
>         #ifdef FOO
>=20
> evaluates to true if
>=20
>         FOO=3Dy
>=20
> while we can have
>=20
>         FOO=3Dm
>=20
> which is evaluated to false, hence the double definition with
> allmodconfig.

That's good to know, I guess I'll have to start using IS_DEFINED()
from now on.

> Here is a diff solving the issue, if you are fine with it I will
> correct in-place and push -f nand/next for tomorrow's build.

That would be great.

Thanks!
-Paul

> ---8<---
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h=20
> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> index d0486f963cc9..2cda439b5e11 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> @@ -25,7 +25,7 @@ struct ingenic_ecc_params {
>         int strength;
>  };
>=20
> -#ifdef CONFIG_MTD_NAND_INGENIC_ECC
> +#if IS_ENABLED(CONFIG_MTD_NAND_INGENIC_ECC)
>  int ingenic_ecc_calculate(struct ingenic_ecc *ecc,
>                           struct ingenic_ecc_params *params,
>                           const u8 *buf, u8 *ecc_code);
> --->8---
>=20
>=20
> Thanks,
> Miqu=E8l
>=20

=
