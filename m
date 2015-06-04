From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Thu, 4 Jun 2015 22:29:28 +1000
Message-ID: <20150604222928.0d64b6b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0zh6An6=lPcaVOOHs.CMhi1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0zh6An6=lPcaVOOHs.CMhi1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

./usr/include/linux/userfaultfd.h:14: found __[us]{8,16,32,64} type without=
 #include <linux/types.h>

Introduced by commit 2873f48b446c ("userfaultfd: uAPI").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/0zh6An6=lPcaVOOHs.CMhi1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcEStAAoJEMDTa8Ir7ZwV5TIP/jtP+iTLkauFtLp8LdZk32n7
s/3pAnJI6AuiN99G7oBG27gx4F32wPgftcXzJInCyinEAM7TcLejAPHDTx3LdifU
KEn3TeyLt90nef/9oY7uOJ49ZnEBYzcFs5DLwjYWsjS7B1vi89va1TbjcR9wk0zb
0+7SeA15EmH+wMifWsNWlQWwgIaFL+OYN8sAwVr5Ze38hEC+vzQ42a3iyEP74o9G
Mhtpb5Uc2GEOiUN5GLsjb3AkavgaVEKgVmUXe4NPi2v5qZb829fRFDcjW5Kv0GkQ
vGGie0uR8E0lOR2n9ab2CfI/rhgI/kYk2k1NAOhk0oLQgDP6pGGSwyNABQn7sgpd
EvloMmEi+gh4ys/2gC2mgQxYUf8Iy671JCll9Deh94jX4RutSNdfE97fqT9ouH0E
BBBOEDO6EtHyD6o88ta4qxdr/PDOlo4C4GNTFQz/7b/AETWduLYF35JemwmDmyck
wVvGlN6fBSQ0Av+deOxQ9BC72JDBrmN19QzC0ijOSIJL2A95wvur0scKX4TdShOF
/vGztUuoCwSBf6UaqPHa3TJFdJL8gp8WDiiYBjIpqplzVKNOVXEDdbRClF6j/WDE
5o2zspbzcX5nI0gaHN6vmPJ8rth6IXFU8G0IdVCk7sgZljaGtHo8HqS8Wk/h53tz
sPHSmFt7Wh868JdXMl5L
=hVJE
-----END PGP SIGNATURE-----

--Sig_/0zh6An6=lPcaVOOHs.CMhi1--
