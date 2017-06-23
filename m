From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of most trees
Date: Fri, 23 Jun 2017 17:04:21 +1000
Message-ID: <20170623170421.30459eec@canb.auug.org.au>
References: <20170622184116.0ebaabd9@roar.ozlabs.ibm.com>
        <20170622.101306.2121302610489503804.davem@davemloft.net>
        <20170623003339.11cbc062@roar.ozlabs.ibm.com>
        <20170622.105648.1780325804771154563.davem@davemloft.net>
        <20170623164323.2ff81b19@canb.auug.org.au>
        <cccaf981b39844cb975f41e41abcd809@SOC-EX01V.e01.socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750821AbdFWHEY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Jun 2017 03:04:24 -0400
In-Reply-To: <cccaf981b39844cb975f41e41abcd809@SOC-EX01V.e01.socionext.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: davem@davemloft.net, npiggin@gmail.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, amodra@gmail.com

Hi,

On Fri, 23 Jun 2017 06:46:53 +0000 <yamada.masahiro@socionext.com> wrote:
>
> > -----Original Message-----
> > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > Sent: Friday, June 23, 2017 3:43 PM
> > To: David Miller <davem@davemloft.net>
> > Cc: npiggin@gmail.com; linux-next@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Yamada, Masahiro/=E5=B1=B1=E7=94=B0 =E7=
=9C=9F=E5=BC=98
> > <yamada.masahiro@socionext.com>; amodra@gmail.com
> > Subject: Re: linux-next: build failure after merge of most trees
> >=20
> > Hi all,
> >=20
> > On Thu, 22 Jun 2017 10:56:48 -0400 (EDT) David Miller <davem@davemloft.=
net>
> > wrote: =20
> > >
> > > Feel free to merge it into your series:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =20
> [snip]
> >=20
> > I added that to linux-next today and it fixed the build problem. =20
>=20
> Thanks for taking care of this.

No worries.

> Sorry, I missed to pick up this for today's release.
> I will insert this before Nicholas' series.

Thanks, I will drop it on Monday.

--=20
Cheers,
Stephen Rothwell
