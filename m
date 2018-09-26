From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pci tree
Date: Thu, 27 Sep 2018 07:27:05 +1000
Message-ID: <20180927072705.3cbafb12@canb.auug.org.au>
References: <20180926150051.6ee97aae@canb.auug.org.au>
        <20180926142540.GB14407@localhost.localdomain>
        <20180926145820.GA14688@localhost.localdomain>
        <CAErSpo6CAMrNafXPcdkYRgZsNtBj+zOdWoAKqG2r5h-jDCaVJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4d_gddnm/a.Qnb+xh7/HVda"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo6CAMrNafXPcdkYRgZsNtBj+zOdWoAKqG2r5h-jDCaVJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Keith Busch <keith.busch@intel.com>, linux-next list <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4d_gddnm/a.Qnb+xh7/HVda
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Wed, 26 Sep 2018 14:48:10 -0500 Bjorn Helgaas <bhelgaas@google.com> wrot=
e:
>
> On Wed, Sep 26, 2018 at 9:56 AM Keith Busch <keith.busch@intel.com> wrote:
> >
> > On Wed, Sep 26, 2018 at 08:25:40AM -0600, Keith Busch wrote: =20
> > >
> > > Thanks for the notice. Does this mean you don't have CONFIG_SYSFS? I
> > > must admit I missed that connection for building slot.c.

Yes, it was an "allnoconfig" powerpc build.

> > There's unfortunately second bug here when there are no slots, which
> > would be the case without CONFIG_SYSFS: the slot list is empty, and the
> > function just returned success, but it should have gone to the default
> > secondary bus reset behavior in that case. I'll send a patch shortly. =
=20
>=20
> I folded in Keith's patch for this, so you should be able to drop your
> workaround, Stephen.

OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/4d_gddnm/a.Qnb+xh7/HVda
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlur+akACgkQAVBC80lX
0GyYOQf9ERGOjpU5wBwCa/QlTrqDzTz71BIA1GWH2SDWFqtChG69h8yPQPSoOFVo
KZ6EFvt+Ix4mQV1HYn8Hl19qMrnbCBQF9PPKjkpaHd5jEhZI95+6wdgVzcjihIK6
ILTIPGTXNqvG1tkiHJkyV8HGzjG/Tywzzs86zaGHGXmBKEvi8NEWgYNAYZQY1hAi
I7opCoN00EfX0JJrYB6RwJNbKw5y2qRgHZDtYz2Iv5+/PMS4Y+pVDU35MMjSDkwF
0JSkMLbPAIy9f9iGhDPTM9DWAx4e1LN3+VwO1oFJWBIkqxVNlnbC2AGxYYIr/3xO
5Ila8BeM+frVgnFOCRiMj8jv61xATg==
=xfXF
-----END PGP SIGNATURE-----

--Sig_/4d_gddnm/a.Qnb+xh7/HVda--
