From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commits in the h8300 tree
Date: Wed, 18 Jul 2018 07:57:50 +1000
Message-ID: <20180718075750.037fd403@canb.auug.org.au>
References: <20180717052419.11610795@canb.auug.org.au>
        <87o9f6l0ck.wl-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ni.5GwuzH1_MzH_g4yD+hnb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9f6l0ck.wl-ysato@users.sourceforge.jp>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ni.5GwuzH1_MzH_g4yD+hnb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yoshinori,

On Tue, 17 Jul 2018 17:42:35 +0900 Yoshinori Sato <ysato@users.sourceforge.=
jp> wrote:
>
> On Tue, 17 Jul 2018 04:24:19 +0900, Stephen Rothwell wrote:
> >=20
> > Commit
> >=20
> >   39f077046d46 ("h8300: switch to NO_BOOTMEM")
> >=20
> > is missing a Signed-off-by from its committer.
> >=20
> > Commits
> >=20
> >   d6bde68ad18e ("h8300: Add missing output register.")
> >   5aa2f1573e0c ("h8300: gcc-8.1 fix")
> >=20
> > are missing a Signed-off-by from their author and committer.
>=20
> OK. Fixed.

Not really, you now have those patches in your tree twice :-(  To fix
the missing SOB lines you really needed to rewrite your branch without
the original commits above.
--=20
Cheers,
Stephen Rothwell

--Sig_/ni.5GwuzH1_MzH_g4yD+hnb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltOZl4ACgkQAVBC80lX
0GzCVwf/a7etmJTu01sQD63kSbLkW4nsah1W6eALEpuVwk9hGXiUNhAody4ShtAU
dtz32oHrMEZeSW/IGUk9PVzzs6YuqJ7gGFuwpSiBf6bKDUtc77I41HKA8hjU6YhW
+cyjrdcP3QDySbvP8HIGz84pUJGz0iWgbwQBKO3xB/hPA6RipZwYUZ8/9CRpe3Pj
tH29IcUZ9TwfIH2HndXctCKUATEuBuWnYiogeivKp3lbd4pCynUtRILPx9RcsnnY
PjRWqrH+MrXc06RyDuZ/B39Gl91XmSFGuW8WnaDOj9JXoLNSi0s7n36/uuSoWqde
tXpa8x1f+JColuvVsN32Ak5/B5lBxw==
=ORMB
-----END PGP SIGNATURE-----

--Sig_/ni.5GwuzH1_MzH_g4yD+hnb--
