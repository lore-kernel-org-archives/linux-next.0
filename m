From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the arc-current tree
Date: Fri, 18 Jan 2019 07:56:30 +1100
Message-ID: <20190118075630.472a57b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xcrnq_RottRplPsistdvTPw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Xcrnq_RottRplPsistdvTPw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

Commit

  8bfa90f936b3 ("ARC: adjust memblock_reserve of kernel memory")

Fixes tag

  Fixes: 9ed68785f7f2b2b ("ARC: mm: Decouple RAM base address from kernel l=
ink addr")

has these problem:

  - Target SHA1 does not exist

Looks like the "2b" on the end was repeasted accidentally.
--=20
Cheers,
Stephen Rothwell

--Sig_/Xcrnq_RottRplPsistdvTPw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxA6/4ACgkQAVBC80lX
0Gyl5Af+OoG4Cmj5LzinT0rIHCnkSZ2OKkhYnrGwFsW2AqJfOrxH+QgwoKbhNKk9
HWBcgw5Cx9rMN3CeIaFAXlqeLRlB0ha9P6LFifVw5b6Y6Wxr0qi6Yf2+px2TLe48
GlGDfdyhDQjWzl4BmCyJs8KexkMw/clY2ri/KEzmpUziG7MxI1BEkovAq+qTxjsO
AkDPLLx+YY61MVcL1SnLuqBP7OARtL3MqiPP91yNvXCeGc3xBsw6G5uerllMbFSQ
EJkqK9cwbDu3K+DCyEl5dbcyRT21R08G/X50goB2lLkjCnaeTVEJ0Kv1WRsXHohj
shx5PZ/zdYbq5HYpMuLyH2dk4FKtXg==
=uFi/
-----END PGP SIGNATURE-----

--Sig_/Xcrnq_RottRplPsistdvTPw--
