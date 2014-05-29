From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the  tree
Date: Thu, 29 May 2014 19:04:47 +1000
Message-ID: <20140529190447.42547aba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8/VoqhjQUtJT/8mbVfBtJ6h"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>, Preeti U Murthy <preeti@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8/VoqhjQUtJT/8mbVfBtJ6h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
arch/powerpc/include/asm/topology.h between commit 4750afa2c568
("powerpc: Fix comment around arch specific definition of
RECLAIM_DISTANCE") from the powerpc tree and commit ba5b7fb4aebd ("mm:
disable zone_reclaim_mode by default") from the akpm-current tree.

I fixed it up (I use th akpm-current tree version) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/8/VoqhjQUtJT/8mbVfBtJ6h
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJThvgzAAoJEMDTa8Ir7ZwV8hsP/jAl5XqweaX95XRd0MUMEa4L
Z/Yyw2lkN7Igbpi6GbRkCAMRmMCxObOXNIY3C1qJva7PMxR9ENliKOpNZBPkEHtC
9a4ucBCSqovx77zqwucqsFIEQuARuTpV+bcFxYiFyJ2VWDXOxW4B5D/jYqe53NLr
PlvJcDKbNXp7VnZqJiZuMFkCBcKmxkdgueVeJRfiebUtj8Ju6CRfFW0TAInrtJxB
H7AjCInnUPfQ8Eu++ajqY1qgZk2eLIpPlNAe2gbmhggLddMg3mZTgJoCfYcKNS4t
jnj78zXzFLuXLcRUwrGeL3exJbFD6dgiT2jaMJ7yzaW/bYfpKUCWR3UywnJ5gy9M
nwLCWykp52wEES5Xxrgvw9E081EHjrzkt/tA7nWbFJ0ZLYAAQlSYJe73PPNE8aIZ
AyJ11nBhxQn31crf7L7aoECrNC1YXzM82fwnmNpZdHChU/FtAEP2JILWwcRW0IdB
hA+omRMXiiclwOBzpUR8jfHCs8vv6GYzDaXl3TqdQoZf4TbSBXqRRBoHA9u8DhzJ
EoLiccLrRKGGZe+Z3Vk6fr+AdWCEBRE33ZUyQBACdXa24Vaq8B5nM7IUt6QfvweQ
rcIwYw//QI5oCBN7+O7PLxgk+iXMttEGoxNvnlOp0epTtrqbsoTR/7wqoE9+HMRl
E4PyOF7rpej0UYEGg928
=UL5c
-----END PGP SIGNATURE-----

--Sig_/8/VoqhjQUtJT/8mbVfBtJ6h--
