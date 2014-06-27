From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad commits in the ext4 tree
Date: Fri, 27 Jun 2014 10:06:32 +1000
Message-ID: <20140627100632.05e6c3ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w5bl/3s3M/vCt8eeoKK7g4I"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52704 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751777AbaF0AGj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Jun 2014 20:06:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/w5bl/3s3M/vCt8eeoKK7g4I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ted,

I noticed commit 14b02deff1ae ("[regression] fix 32-bit breakage in
block device read(2)") in the ext4 tree today.  This commit is commited
by you, but has not Signed-off-by from you ... it is also in Linus'
tree today.

Commit e43bb4e612b4 ("ext4: decrement free clusters/inodes
counters when block group declared bad") also has no S-o-b from you.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/w5bl/3s3M/vCt8eeoKK7g4I
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTrLWNAAoJEMDTa8Ir7ZwVK8sP/i46yyHCmi+SoD1IYlzNBqU+
DWyZ+aUd2skIJy39Mcvx+u0GuutM8+b4pJIZyurkzIJH2l7wrms9dqvp6hXNltLd
+Y4Ls+Gq6JCXxHTioANlGO3TiUF7wfT90fiWIUI485uRXHfCKdoWEN9S6Ss/Ff2q
GL1YQk341rF2osuPx7W60+9kyWn5NlKeSdBUx2f1La/jD6zKrO9lLPdtesdLUfQY
6DEekYYj3LZ+nVxSSZf4vptGUafkNZROHDdbzYmf7toEqsPeJTVjFvuaghbHSOnR
+SE5ii731KBCidSk6qDu73wRuAFpCWS0cRoJ6aY4m3fCf+/Kod++/7qr7NM8JhLU
2cEYe8MrM0kA+m2Ehomiqi+zjF8AmNVDfgt/tG8we/WqGBMMYSKfnHmM87ycqbS2
P0LSU9+e2TaY7hJG6iAZRMx1toyHSLNNdyb10y6o8ExzNLlg16BR1uctBviwa8FJ
ljADd2p8nbrzuVYEmQAT9gH3roXF1iTfAj+7HRhPICrkvQkjQbrLSj5oeZfZ3Kzn
6zMhStnJx5YTmxphiMkrjorhpjx0qE3eAu8stOmV5OkmFRfr243xhd39x1qaC61K
Q8f4t2FIB0kwDFPC1uZfpgiyVpL+cpABkE2vdbHPTLqxBP4r70b+IKPb4LYNq4tZ
CASHY759hZh9ON2llSUq
=k+Bs
-----END PGP SIGNATURE-----

--Sig_/w5bl/3s3M/vCt8eeoKK7g4I--
