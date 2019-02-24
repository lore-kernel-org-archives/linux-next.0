From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc
 tree
Date: Mon, 25 Feb 2019 09:47:25 +1100
Message-ID: <20190225094659.741bf42f@canb.auug.org.au>
References: <20190224010511.74f25272@canb.auug.org.au>
        <8736odl846.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/==0L43=u6mND1Rkb1uxqnn9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8736odl846.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/==0L43=u6mND1Rkb1uxqnn9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, 24 Feb 2019 22:48:57 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> But do they need SOBs?

I think so, since they modify the code ..

> The DCO says:
>=20
> By making a contribution to this project, I certify that:
>=20
>         (a) The contribution was created in whole or in part by me and I
>             have the right to submit it under the open source license
>             indicated in the file; or
>=20
>         (b) The contribution is based upon previous work that, to the best
>             of my knowledge, is covered under an appropriate open source
>             license and I have the right under that license to submit that
>             work with modifications, whether created in whole or in part
>             by me, under the same open source license (unless I am
>             permitted to submit under a different license), as indicated
>             in the file; or
>=20
>         (c) The contribution was provided directly to me by some other
>             person who certified (a), (b) or (c) and I have not modified
>             it.
>=20
>         (d) I understand and agree that this project and the contribution
>             are public and that a record of the contribution (including a=
ll
>             personal information I submit with it, including my sign-off)=
 is
>             maintained indefinitely and may be redistributed consistent w=
ith
>             this project or the open source license(s) involved.
>=20
>=20
> Only d) really applies to a revert, and as the maintainer I feel like d)
> is kind of implied.

I read this as (a || b || c) && d.  And if there is no SOB, then none
of the above is certified.

> Anyway I'll try and remember to do it in future if that's The Rule ;)

Its just as effective as the rest of our rules ... i.e. a strong
suggestion :-)

Thanks
--=20
Cheers,
Stephen Rothwell

--Sig_/==0L43=u6mND1Rkb1uxqnn9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxzHv0ACgkQAVBC80lX
0Gz4KAf/YaVU9s53s+KgK+SNwYdSYd42mRJmfXVyrrUb0M6tubHkFyFsMmrI4apo
lSaMmDwtrlOMf0Q8zm34TLUpyGtN0qGlhIlWgQJJSycLHZdh8BTkmzpyM5F9Byoa
Yjiqx5eHBl1Bzd4K6BlJp0LdQG1FIuJcYKPD9iJ/mmqYhOLpEjs5KGiVmwQeML7g
nzdG+lnBTlxdV/ja2VYqxtNK7Elb6PP6RpBSgqvWbPM1bIn95Ajk3HBJ93W9qvVK
ykYz515cx8NvKj+OeKdnRX1uUDrjdU+vO06xFNL15/2ta5isXrdfbNiejglSChYh
ZjfEz58DI2UdEoFIs8pqO7nCb9m3GA==
=Vw1t
-----END PGP SIGNATURE-----

--Sig_/==0L43=u6mND1Rkb1uxqnn9--
