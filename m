From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags needs some work in the akpm-current tree
Date: Thu, 31 Jan 2019 11:05:41 +1100
Message-ID: <20190131110541.3f3a808c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bs_.GBX.hqlakDsFwUu5OIW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liviu Dudau <liviu@dudau.co.uk>, Qian Cai <cai@lca.pw>
List-Id: linux-next.vger.kernel.org

--Sig_/Bs_.GBX.hqlakDsFwUu5OIW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  86c7502b25ed ("mm/vmalloc.c: don't dereference possible NULL pointer in _=
_vunmap()")

Fixes tag

  Fixes: f3c01d2f3ade ("mm: vmalloc: avoid racy handling of debugobjects

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags across more than 1 line.

In commit

  6e9ed490d190 ("mm/page_owner: fix for deferred struct page init")

Fixes tag

  Fixes: fe53ca54270 ("mm: use early_pfn_to_nid in page_ext_init")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Bs_.GBX.hqlakDsFwUu5OIW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSO9UACgkQAVBC80lX
0GxozAgAndA+eQEnyIjF0/CnyNghPTie31FJ5TohhccbNie055brleJjhC02zsjA
IjcHqd37sEdDsJQbkUB6lOpDyQ3fkDHzJZ5nvZ8NUG9/64crxaCFoh4nFjrtuIYI
EHIMV72poXCbXPXbM8ZhrvnG9TTpYtGYy2On3B0Q7awzZGqCa8mSvW4whtblES6a
wDRIbK7GB8qmVAP+d/AXKWHwQM7Ttg0YfeOD4CK/mr8NTRVpzpohKbf+7lyELqcN
Z5GOV0ajzb2jbWiTUHRdwqNxfkXu6n31XojBXrAsrEL253QTkvnFQTPYdH3W/NQ9
hjiJjyeuusohJve8i88q14Vxvd/jIQ==
=ouuW
-----END PGP SIGNATURE-----

--Sig_/Bs_.GBX.hqlakDsFwUu5OIW--
