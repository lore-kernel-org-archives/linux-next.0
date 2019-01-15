From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tags need some work in the pm tree
Date: Wed, 16 Jan 2019 09:43:05 +1100
Message-ID: <20190116094305.0f66356a@canb.auug.org.au>
References: <20190116075540.78cff44e@canb.auug.org.au>
        <2774660.l3LIlnjlhl@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FOZKysFIF2eQjL7bBvWOq7f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2774660.l3LIlnjlhl@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

--Sig_/FOZKysFIF2eQjL7bBvWOq7f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

On Tue, 15 Jan 2019 23:13:16 +0100 "Rafael J. Wysocki" <rjw@rjwysocki.net> =
wrote:
>
> On Tuesday, January 15, 2019 9:55:40 PM CET Stephen Rothwell wrote:
> > [I am experimenting with checking the Fixes tags in commits in linux-ne=
xt.
> > Please let me know if you think I am being too strict.]
> >=20
> > Hi Rafael,
> >=20
> > Commits
> >=20
> >   62b33d57c534 ("drivers: thermal: int340x_thermal: Make PCI dependency=
 explicit")
> >   cd793ab22a93 ("x86/intel/lpss: Make PCI dependency explicit")
> >   42ac19e7b81e ("ACPI: EC: Look for ECDT EC after calling acpi_load_tab=
les()")
> >   6c29b81b5695 ("platform/x86: apple-gmux: Make PCI dependency explicit=
")
> >   34783dc0182a ("platform/x86: intel_pmc: Make PCI dependency explicit")
> >   704658d1d3ae ("platform/x86: intel_ips: make PCI dependency explicit")
> >   5df37f3a1aa9 ("vga-switcheroo: make PCI dependency explicit")
> >   da1df6ee4296 ("ata: pata_acpi: Make PCI dependency explicit")
> >   ce97a22a596b ("ACPI / LPSS: Make PCI dependency explicit")
> >=20
> > Have malformed Fixes tags:
> >=20
> > There should be double quotes around the commit subject. =20
>=20
> Well, where does this requirement come from?
>=20
> It hasn't been there before AFAICS.

Documentation/process/submitting-patches.rst has the following, but I
am sure people are happy to discuss changes and it does say "For
example", so maybe I am being to strict?  The counter argument is that
there are various (semi-)automated processes that use these tags and
being consistent probably makes those processes (and life for those who
run them) easier.

------------------------------------------------------------------------
If your patch fixes a bug in a specific commit, e.g. you found an issue usi=
ng
``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
the SHA-1 ID, and the one line summary.  For example::

        Fixes: e21d2170f366 ("video: remove unnecessary platform_set_drvdat=
a()")

The following ``git config`` settings can be used to add a pretty format for
outputting the above style in the ``git log`` or ``git show`` commands::

        [core]
                abbrev =3D 12
        [pretty]
                fixes =3D Fixes: %h (\"%s\")
------------------------------------------------------------------------

--=20
Cheers,
Stephen Rothwell

--Sig_/FOZKysFIF2eQjL7bBvWOq7f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+YfkACgkQAVBC80lX
0GyARAf/Yk/+xQP8jM/ZUpbG0mhqurzZmSRPs1VBNMgil6/Y7Krw1+719wBd3stg
/S9ULY1rQBDLQiIuSN9AtLqIF2ZrNa/YhumIlR5cedFOl7gEY/5FmYWUk3O9YXLw
0WAFrA3doBCOAIsL1iatRVdYWqRvxPziCtlcf7cRDOk4MalJPMvme6tI0aOiU6SV
dHlCm95SAaqPJFDK5OIX3zTKjPxrN9zkF/IFD6IK21TI67OwsJfWzOKK70SdV0Uz
e4KJyCdSP4EG+Of1AH+3emiJnDGPliXpSEsH4v1BSTThNTycv1xGqAEgq6RUyKe+
cqzGStlSsHqd/8xuKoy+45cp+SLd3A==
=F+57
-----END PGP SIGNATURE-----

--Sig_/FOZKysFIF2eQjL7bBvWOq7f--
