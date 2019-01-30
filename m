From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Date: Wed, 30 Jan 2019 11:02:56 +1100
Message-ID: <20190130110256.41722408@canb.auug.org.au>
References: <20190130075647.53e86078@canb.auug.org.au>
        <20190129220802.GC4205@dastard>
        <20190130100640.5c2512a4@canb.auug.org.au>
        <20190129234338.GF4205@dastard>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ju_2Cx3TjixfKLr.f9bx+WN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129234338.GF4205@dastard>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Chinner <david@fromorbit.com>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/Ju_2Cx3TjixfKLr.f9bx+WN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 30 Jan 2019 10:43:38 +1100 Dave Chinner <david@fromorbit.com> wrote:
>
> .... and in replying to correct me demonstrates the exact point I
> was making - that documenting what configuration should be used to
> avoid the warning acheives far more than just reporting an error.
>=20
> i.e. all those people who /don't follow git development/ and have
> working configs that pre-date the "auto mode" or it being made
> the default now know the correct way to configure their repository.

Point taken.  It now says:

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
--=20
Cheers,
Stephen Rothwell

--Sig_/Ju_2Cx3TjixfKLr.f9bx+WN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQ6bAACgkQAVBC80lX
0GwRSQf+LZaMR2p3+rsykF4i5BASfhPanraR7vwDoZ+4uvD53JMFBn401k1J1eH4
9lzUDTrAqzAtbwJKvAHSKiXyMcs4GFPTjzo+pon34imta6FeMB3iOuoz7ENZQny+
Jy9+NOiansUetSm9qbkEkNGhSvaNzZdgKNKhwUuVDMEU2+8wAJaBNNGhsFaLPqT2
Att2ce29ntdWz/BmfPKZLCPO4bWzvOxkcD2AWlICUmb08H1jwhEdFyj/FukJTxrq
d0SqA7jvJXyUZl/QVOmo1nsaC8Ljb4qLHM+JeFVYFKQPp3rZVrpTo7nQcdMk4F2k
qGZPIxy3U/f349/790K17e3fEx9jsg==
=VShS
-----END PGP SIGNATURE-----

--Sig_/Ju_2Cx3TjixfKLr.f9bx+WN--
