From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2019-05-29-20-52 uploaded
Date: Fri, 31 May 2019 13:50:15 +1000
Message-ID: <20190531135015.6a898d26@canb.auug.org.au>
References: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
        <CAA25o9RFhS=qm=B_mYAdQeAUAi7pLbXttWJfw7yKMWQQAXhhAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1ISJy/USqL3uKe+N6QGnZgM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAA25o9RFhS=qm=B_mYAdQeAUAi7pLbXttWJfw7yKMWQQAXhhAw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luigi Semenzato <semenzato@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, linux-next@vger.kernel.org, Michal Hocko <mhocko@suse.cz>, mm-commits@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/1ISJy/USqL3uKe+N6QGnZgM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 29 May 2019 21:43:36 -0700 Luigi Semenzato <semenzato@google.com> w=
rote:
>
> My apologies but the patch
>=20
> mm-smaps-split-pss-into-components.patch
>=20
> has a bug (does not update private_clean and private_dirty).  Please
> do not include it.  I will resubmit a corrected version.

I have dropped that from linux-next today.

P.S. in the future please trim your replies to relevant bits, thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/1ISJy/USqL3uKe+N6QGnZgM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwpHcACgkQAVBC80lX
0GzTMwf+P79ZCniPZu4298eDmJPDDV5hrSNugRpBpF7wLOr72Nm/RbueUfGnpM7e
JlSehMtkCyaJkCW7uW+N6Ior1ep747lrkVCtg95G/yB6vrIu5oUlLG2sGxlWlh1D
pAXCHg3T1BB0/8dRvJXr7YmDOLakwpKf+4nN6V0PZwwEctN4ZvcuCWuHnj2lGTnR
BVlrJe4EDfB/sDUSm9i1gd3Dgx5ClUSk7gG8RrYRezNlOS7pCPEOwEgmQ62KUaeD
qncMOV1g6xhllddSxA97HEyf8C6eA+5tDR2kj1EmDu9hZNR+gLHXgyGUg7QWSGEW
dtHgXURwm3m/7VmP4N+fqpqyzkMF2g==
=ImAe
-----END PGP SIGNATURE-----

--Sig_/1ISJy/USqL3uKe+N6QGnZgM--
