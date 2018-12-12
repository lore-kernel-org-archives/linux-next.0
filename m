From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 13 Dec 2018 07:44:08 +1100
Message-ID: <20181213074408.1355ab8b@canb.auug.org.au>
References: <20181203180037.0a54279b@canb.auug.org.au>
        <8e677bb9-22c3-83c5-ff41-765d20fc0047@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZmxodMAhsUdWwh9J.pBa5qf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e677bb9-22c3-83c5-ff41-765d20fc0047@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ZmxodMAhsUdWwh9J.pBa5qf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anshuman,

On Wed, 12 Dec 2018 22:35:38 +0530 Anshuman Khandual <anshuman.khandual@arm=
.com> wrote:
>
> On 12/03/2018 12:30 PM, Stephen Rothwell wrote:
> > Hi Andrew,
> >=20
> > After merging the akpm tree, today's linux-next build (powerpc_le perf)
> > failed like this:
> >=20
> > bench/numa.c:37:10: fatal error: linux/numa.h: No such file or directory
> >  #include <linux/numa.h>
> >           ^~~~~~~~~~~~~~
> >=20
> > Caused by patches
> >=20
> >   "mm: replace all open encodings for NUMA_NO_NODE"
> >   "mm-replace-all-open-encodings-for-numa_no_node-fix"
> >=20
> > For linux/numa.h to be generally availble to the tools builds, it must
> > be copied into tools/include/linux ...
> >=20
> > I have done that copy for today:
> >=20
> > From 6dabc11d5513510d0ec0a6b0a4aa8b9051b71516 Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 3 Dec 2018 17:57:27 +1100
> > Subject: [PATCH] linux/numa.h is now needed for the perf build
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Hello Stephen,
>=20
> I will respin the original patch (https://patchwork.kernel.org/patch/1069=
8089/)
> once more to accommodate new feedbacks from Lubomir Rintel. This patch fi=
xes the
> build problem related to tools/perf. As Lubomir suggested, it might be be=
tter to
> split the tools/perf changes ("tools: Replace open encodings for NUMA_NO_=
NODE")
> from the original patch and then fold this fix onto it with both signed-o=
ff-by.
> Does it sound good. Are you okay with it ?

Sounds fine to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZmxodMAhsUdWwh9J.pBa5qf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwRcxgACgkQAVBC80lX
0GzgEwf/YncIIrFSJ2eXIYSalgTGJjnTDa1fPICARIEhytg2mmTZYWHNqAuP2hnt
LwU2axyUBkqYRRmjYue8bIxApfhu35pwT3IwEF3HHlvGIqqZ4IIbcECUZxwznOG0
Slq5kyet6evkCmZm7i+dnSjmR/ESfJJrVhZ0ROs2GRpiSUrCz7nI6pxJWdsqwYy4
ghchrvGvcu9hKYrtuWhnqdYMatHo7wkg2oKU7c5PovwIOgDLtKRgJ/frw9B+6La1
pLUbmUHzhCxnz/s07bfASRU75f2m2CIdjvJ8ebOkKo1kArY8OZswTO0jVDPjfnwl
lmWHeqf54UrvTJDdC5U2JzUBOfro/A==
=HcRY
-----END PGP SIGNATURE-----

--Sig_/ZmxodMAhsUdWwh9J.pBa5qf--
