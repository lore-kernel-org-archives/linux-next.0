From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the squashfs tree
Date: Fri, 1 Nov 2013 11:57:23 +1100
Message-ID: <20131101115723.8faa858bf8a5dadf17d251fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__1_Nov_2013_11_57_23_+1100_wRfaJ6g_UIc63bH6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:46870 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753678Ab3KAA5g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 20:57:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__1_Nov_2013_11_57_23_+1100_wRfaJ6g_UIc63bH6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

After merging the squashfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/squashfs/decompressor_single.c: In function 'squashfs_decompressor_creat=
e':
fs/squashfs/decompressor_single.c:40:2: error: implicit declaration of func=
tion 'free' [-Werror=3Dimplicit-function-declaration]
  free(comp_opts);
  ^
fs/squashfs/decompressor_single.c:40:2: warning: incompatible implicit decl=
aration of built-in function 'free' [enabled by default]

Caused by commit 99d59ddb8a06 ("Squashfs: Refactor decompressor interface
and code").

I have used the squashfs tree from next-20131031 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__1_Nov_2013_11_57_23_+1100_wRfaJ6g_UIc63bH6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJScvx4AAoJEMDTa8Ir7ZwV7E4P/i2TdoiyCAvDGx/I9EsQN5ix
5KeUIJQTeQH+DrIUQlTH+0aJGq/kB3Glh9HbRiq37iJo7ttHINlKiRSzH1EPQ8jQ
ra9bjRiRoNeyhHDGHsQ8GFO6myi28whWwiBitk+zO9ROKHYA9jDRzkzWFgzZQN+p
9AOUpHozNLk+RrJVaitmvacDF/Hvpz7K2jesP2Qb8VAV1GPFNPIRw1l99VCcJpxU
ycMzXln7V2OlAowr0tyT+ba3nwCoFPhzJ5oGT44+1t/R6TmWi1sqTVt/Rc7eZZ8B
91R0svtezrSEgFVDzSenKPpYTt5QSbYgn5W9td+HANnbZHSH0lZHbqlo8g+V2EaC
OmrAjPC9qkXBKuMpKpdgJwsrV3rnKWO97UAvqaZl+2SNVlMvmxx1vfp+15xJJn7W
uH3T+FNtbFR+UQjLfvQHQvmhMS7+T6pUM3jXn7BF7mqL4QHerb7ml8l0McZ6lSiL
CTpycCqw2UMcvSpHzHh+Yjt1LB2DWIUl35E/6RDpL+i2Db5EHgk4UtIfS4PaR5qw
RsxROHCeNqgkcb2RcJOgnLVQZl5XZyi+fHFH1EphS+3lTl4LE9uWn4NIKmFmRN50
CHPvPOWdqan9Fjum+Z51TsT8Rxa37EqiY+wXsxa6gpd7JuFjQxFpwqqqIBBZl9Kd
ebAhCBMmE0+a2IDyBnub
=chje
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Nov_2013_11_57_23_+1100_wRfaJ6g_UIc63bH6--
