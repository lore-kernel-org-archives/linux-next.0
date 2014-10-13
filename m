From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: status of the logfs tree?
Date: Mon, 13 Oct 2014 11:33:04 +1100
Message-ID: <20141013113304.599de9d2@canb.auug.org.au>
References: <20141009105418.32aad6ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4qXPz9rBroCFXM4RAs1m40f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141009105418.32aad6ab@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Prasad Joshi <prasadjoshi.linux@gmail.com>, =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/4qXPz9rBroCFXM4RAs1m40f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 9 Oct 2014 10:54:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The top commit in the logfs tree was committed in November 2012.  Is
> there any intention to ask Linus to merge this tree?  Or should I just
> drop it completely?
>=20
> It is a pain because it takes considerable time for git to actually
> merge it.
>=20
> $ git log --oneline origin/master..logfs/master =20
> 339466142b3f Fix the call to BUG() caused by no free segment found
> ab2ec19f42dc logfs: fix possible memory leak in logfs_mtd_can_write_buf()
> $ git diff --stat origin/master...logfs/master=20
>  fs/logfs/dev_mtd.c | 2 +-
>  fs/logfs/super.c   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Ping?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/4qXPz9rBroCFXM4RAs1m40f
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUOx3FAAoJEMDTa8Ir7ZwVVt4P/2JOQUTn8J9zEEtdhRMYek0s
BgUycR7sA63xdc+tXOAbZElwP1D7SJl9EwacNz2Z7qWY/GVHr/Ys/ESf3yHvr05A
aI8lQXY14TO7g7IQm1X2iIeeQv6sAKAotizdtEOcyxEbyZLIhzMFiCGM/HMVwdS7
llFI6SHA+cVc4taDyC/4bop8WOwfZBIk0MlbhDLdLA1HJVINHLz5zsvD+vFT10hW
OuIHvLTLImIm5mlfp0C67FZM17ilMiyftI61lz6c26vWW2qmvgD50cAbT90ZRzDG
2jw2ozwuMkOGx5T81hgKw6HJyuxi24bNUXdOpLXdi2+ogjU1BHIueR1yFc3MYDy+
DJTe3r0ZYJuvqhzTR0OZMqjqixEeMXIrt8DGznP7fUhO5gOc0S9id5OpTU6kdGXz
mpbTG1bvGHwfTvEgwk5tPL9fFUm/TjKBwZvLEEhLNl929KZxGPvOaqK/LVAMimIQ
D/yXv3wkqzZU16QRFCIZA+QIAPJyoQTGKrPe0sAfQ65cdrTOtn9t1cLz/uFd/Bai
g0EwZpjdpM5sw7VXk0Lj/0mlopb2WJVJthmVsYRE/V3g1T7AE6M8tsP8HV5ZC92m
cQJC1QFlogjcKaRe0OcVMcyOZkXDp2r3NxAueudOi2mTjpVcM8R6oNHOyLAB/R7y
5ldTesNkQ+nehpN+yny8
=VDKc
-----END PGP SIGNATURE-----

--Sig_/4qXPz9rBroCFXM4RAs1m40f--
