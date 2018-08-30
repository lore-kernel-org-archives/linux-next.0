From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: disabling -Wstringop-truncation
Date: Fri, 31 Aug 2018 08:45:35 +1000
Message-ID: <20180831084535.505d1822@canb.auug.org.au>
References: <20180831080714.4f94fba9@canb.auug.org.au>
        <87in3r32qh.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4fmv1BG0UF8lscL5tpTU31Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87in3r32qh.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Kleen <ak@linux.intel.com>
Cc: Linus <torvalds@linux-foundation.org>, Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/4fmv1BG0UF8lscL5tpTU31Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, 30 Aug 2018 15:32:06 -0700 Andi Kleen <ak@linux.intel.com> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > I am now mainly using gcc v8.2 for my builds and -Wstringop-truncation
> > causes so many warnings that I am sure to miss others, so I have
> > applied the below to my fixes tree until the noise reduces. =20
>=20
> I have the same problem.
>=20
> However It's not clear if they're all false positives (I suspect not)

Right.

> It would be better to move the warning to W=3D2 or so, and also needs
> someone actually looking at them.

Sure, my patch was just a quick fix for linux-next to make it more
manageable.  Also, I am not worse off than when I was using older
compilers.

--=20
Cheers,
Stephen Rothwell

--Sig_/4fmv1BG0UF8lscL5tpTU31Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluIc48ACgkQAVBC80lX
0GwI7wf/e5+zFNmRn20g1fNNeGZndTt01o1cFmXlelq2oEtJ+Wt3d4ZQnqm9w/YF
KKf5kfKw2UeWRW14mgRac9mXH9mfMljQznFez9M28n5/8zNxbt4cIUOKaIreHdPM
vZzetEJQ0qldKupuLXQjBC7ye4L5PSUed63Vzkzw8hO5G2hDPcaNjrt6KaB8o8k6
apQ2CA8xN1LZ9kmm9nL6yP7WQa0PPq3HBNOpCOtRaIAca7VP7PVXTnhZMNaJletg
4wVwYtegtxUJ5NAuHTuc99FT3tEusT4XbAbFqARikzj7mcjgP8oNuZF01+sVz1nk
l4CBslYgpnzKsi+7/ugF+e+xnEiu4g==
=dsnB
-----END PGP SIGNATURE-----

--Sig_/4fmv1BG0UF8lscL5tpTU31Q--
