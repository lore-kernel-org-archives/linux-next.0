From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: manual merge of the pci tree with the asm-generic
 tree
Date: Fri, 26 Sep 2014 10:13:57 +0100
Message-ID: <20140926091357.GL841@e106497-lin.cambridge.arm.com>
References: <20140926132902.603fb9f8@canb.auug.org.au>
 <20140926070022.GA31002@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926070022.GA31002@ulmo>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 26, 2014 at 08:00:23AM +0100, Thierry Reding wrote:
> On Fri, Sep 26, 2014 at 01:29:02PM +1000, Stephen Rothwell wrote:
> > Hi Bjorn,
> >=20
> > Today's linux-next merge of the pci tree got a conflict in
> > include/asm-generic/io.h between commit 4005bfe0aa45
> > ("asm-generic/io.h: Implement generic {read,write}s*()") from the
> > asm-generic tree and commit 3aad9c969c09 ("asm-generic/io.h: Fix
> > ioport_map() for !CONFIG_GENERIC_IOMAP") from the pci tree.
> >=20
> > I fixed it up (the only difference is that the latter castes the re=
sult
> > to void __iomem * - see below) and can carry the fix as necessary (=
no
> > action is required).
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> >=20
> > diff --cc include/asm-generic/io.h
> > index 3e976be3bdd4,2e2161b0c795..000000000000
> > --- a/include/asm-generic/io.h
> > +++ b/include/asm-generic/io.h
> > @@@ -756,16 -329,11 +756,16 @@@ static inline void iounmap(void __i=
ome
> >  =20
> >   #ifdef CONFIG_HAS_IOPORT_MAP
> >   #ifndef CONFIG_GENERIC_IOMAP
> >  +#ifndef ioport_map
> >  +#define ioport_map ioport_map
> >   static inline void __iomem *ioport_map(unsigned long port, unsign=
ed int nr)
> >   {
> > - 	return PCI_IOBASE + (port & IO_SPACE_LIMIT);
> > + 	return (void __iomem *)(PCI_IOBASE + (port & IO_SPACE_LIMIT));
>=20
> I don't think that cast is necessary. All instances of PCI_IOBASE are
> already defined to be void __iomem *.
>=20
> Or at least they were until a few days ago. Commit f3dfddf7bd85 (ARM:
> Define PCI_IOBASE as the base of virtual PCI IO space) introduces one
> variant for ARM which isn't actually void __iomem *. I think what we
> should do is standardize the type of PCI_IOBASE.
>=20
> So how about we remove commit 3aad9c969c09 (asm-generic/io.h: Fix
> ioport_map() for !CONFIG_GENERIC_IOMAP) and move the cast to void
> __iomem * to Liviu's definition of PCI_IOBASE for ARM?
>=20
> Thierry

Hi Stephen,

I agree with Thierry's solution.

I don't know how these cases are handled. Should I send Bjorn a patch f=
or his tree?

Best regards,
Liviu


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
