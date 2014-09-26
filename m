From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pci
 tree
Date: Fri, 26 Sep 2014 10:00:11 +0100
Message-ID: <20140926090011.GH841@e106497-lin.cambridge.arm.com>
References: <20140925174730.302842e6@canb.auug.org.au>
 <20140925193000.GA26946@google.com>
 <20140925124744.b1e37bdbd5b4f4cfcfbb6505@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140925124744.b1e37bdbd5b4f4cfcfbb6505@linux-foundation.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Feiner <pfeiner@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Sep 25, 2014 at 08:47:44PM +0100, Andrew Morton wrote:
> On Thu, 25 Sep 2014 12:30:00 -0700 Peter Feiner <pfeiner@google.com> =
wrote:
>=20
> > On Thu, Sep 25, 2014 at 05:47:30PM +1000, Stephen Rothwell wrote:
> > > Hi Andrew,
> > >=20
> > > Today's linux-next merge of the akpm-current tree got a conflict =
in
> > > include/asm-generic/pgtable.h between commit b766eafe6828 ("PCI: =
Add
> > > pci_remap_iospace() to map bus I/O resources") from the pci tree =
and
> > > commit 4cc2f91f2636 ("mm: softdirty: enable write notifications o=
n VMAs
> > > after VM_SOFTDIRTY cleared") from the akpm-current tree.
> > >=20
> > > I fixed it up (see below) and can carry the fix as necessary (no =
action
> > > is required).
> > >=20
> > > --=20
> > > Cheers,
> > > Stephen Rothwell                    sfr@canb.auug.org.au
> > >=20
> > > diff --cc include/asm-generic/pgtable.h
> > > index 977e545a64c3,f6acf1195182..000000000000
> > > --- a/include/asm-generic/pgtable.h
> > > +++ b/include/asm-generic/pgtable.h
> > > @@@ -249,10 -249,18 +249,22 @@@ static inline int pmd_same(pmd_t =
pmd_a
> > >   #define pgprot_writecombine pgprot_noncached
> > >   #endif
> > >  =20
> > >  +#ifndef pgprot_device
> > >  +#define pgprot_device pgprot_noncached
> > >  +#endif
> > >  +
> > > + #ifndef pgprot_modify
> > > + #define pgprot_modify pgprot_modify
> > > + static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t=
 newprot)
> > > + {
> > > + 	if (pgprot_val(oldprot) =3D=3D pgprot_val(pgprot_noncached(old=
prot)))
> > > + 		newprot =3D pgprot_noncached(newprot);
> > > + 	if (pgprot_val(oldprot) =3D=3D pgprot_val(pgprot_writecombine(=
oldprot)))
> > > + 		newprot =3D pgprot_writecombine(newprot);
> >=20
> > For completeness of the arch-independent pgprot-modify,
> >=20
> > 	if (pgprot_val(oldprot) =3D=3D pgprot_val(pgprot_device(oldprot)))
> > 		newprot =3D pgprot_device(newprot);
> >=20
> > should be added here.
> >=20

Thanks for noticing this Peter!

>=20
> Tricky.  I've moved
> mm-softdirty-enable-write-notifications-on-vmas-after-vm_softdirty-cl=
eared.paqtch
> to be staged after linux-next, so I'll merge it after PCI has merged.=
=20
> And added this:
>=20
> --- a/include/asm-generic/pgtable.h~mm-softdirty-enable-write-notific=
ations-on-vmas-after-vm_softdirty-cleared-fix
> +++ a/include/asm-generic/pgtable.h
> @@ -261,6 +261,8 @@ static inline pgprot_t pgprot_modify(pgp
>  		newprot =3D pgprot_noncached(newprot);
>  	if (pgprot_val(oldprot) =3D=3D pgprot_val(pgprot_writecombine(oldpr=
ot)))
>  		newprot =3D pgprot_writecombine(newprot);
> +	if (pgprot_val(oldprot) =3D=3D pgprot_val(pgprot_device(oldprot)))
> +		newprot =3D pgprot_device(newprot);
>  	return newprot;
>  }
>  #endif
> _
>=20

Thanks for the patch Andrew!

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
