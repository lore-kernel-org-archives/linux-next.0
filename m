From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: RE: linux-next: build warning after merge of the spi tree
Date: Tue, 29 Jan 2019 08:39:55 +0000
Message-ID: <VI1PR04MB57268573920A23B333CBE68799970@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <20190129130237.677e5ac8@canb.auug.org.au>
        <VI1PR04MB57262F1ADEEC151C11E0F48499970@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20190129192658.72c88d0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129192658.72c88d0b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, Boris Brezillon <bbrezillon@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, January 29, 2019 1:57 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: Mark Brown <broonie@kernel.org>; Linux Next Mailing List <linux-
> next@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kerne=
l.org>;
> Frieder Schrempf <frieder.schrempf@kontron.de>; Boris Brezillon
> <bbrezillon@kernel.org>
> Subject: Re: linux-next: build warning after merge of the spi tree
>=20
> Hi Yogesh,
>=20
> On Tue, 29 Jan 2019 06:57:51 +0000 Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com> wrote:
> >
> > > WARNING: modpost: missing MODULE_LICENSE() in
> > > drivers/spi/spi-nxp-fspi.o see include/linux/module.h for more
> > > information
> > >
> > Can someone help in pointing out that why above warning message is comi=
ng
> for mentioned commit.
> > Below MODULE_LICENSE string is present in the above mentioned file,
> drivers/spi/spi-nxp-fspi.c.
> >     MODULE_LICENSE("GPL v2");
>=20
> The version in linux-next has no such line.
>=20
Yes, somehow this missing line was appended to the commit message instead o=
f the actual in patchwork, also being pointed out by Frieder in his reply.
Sorry for this.

I have send fix patch for this warning message [1]. Please check the patch =
and apply.

--
Regards,
Yogesh Gaur

[1] https://patchwork.ozlabs.org/patch/1032586/

> --
> Cheers,
> Stephen Rothwell
