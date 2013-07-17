From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (aio tree
 related)
Date: Wed, 17 Jul 2013 13:41:24 +1000
Message-ID: <20130717134124.23192f8c9bcc29b07f57743f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__17_Jul_2013_13_41_24_+1000_yI+hclESUx2fwQl4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36084 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab3GQDlg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Jul 2013 23:41:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gu Zheng <guz.fnst@cn.fujitsu.com>

--Signature=_Wed__17_Jul_2013_13_41_24_+1000_yI+hclESUx2fwQl4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allnoconfig) failed like this:

fs/aio.c: In function 'aio_migratepage':
fs/aio.c:196:2: error: implicit declaration of function 'migrate_page_move_=
mapping' [-Werror=3Dimplicit-function-declaration]
  rc =3D migrate_page_move_mapping(mapping, new, old, NULL, mode);
  ^

Caused by commit 36bc08cc0170 ("fs/aio: Add support to aio ring pages
migration"). The declaration of migrate_page_move_mapping() in
linux/migrate.h is protected by CONFIG_MIGRATION - its use in fs/aio.c is
not.  So the usage needs to be protected, or there needs to be a dummy
version in linux/migrate.h

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__17_Jul_2013_13_41_24_+1000_yI+hclESUx2fwQl4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR5hJoAAoJEECxmPOUX5FE90MQAKTWH0JLN2puswvX2lrBsDFO
rPbcYTpvVn4GejALMUP7OISLJzIY+NF8jVWcEIYlgbtCYdNi4aKsVrBYpAsuWiT5
gPaPfFtKvTMbAlRWIZChwEXI4ZuwkH+hAa5G2z0a30+snUMxBuD/UCWRjrz/Twsj
Iji6AoPMwNGRhGDmkm/nJyqagcnB2n5OhRnGVmvROwSViivaqZh1Nv/Kzeq29q8Z
VhirrwQzY3PQich2IdxIhWL2agTCZxW/WP2q0WgZCXsxqoFLWDjjM5ZweNowZjuX
i0U+c5Ibk+orJVnCZMYI5rba+u8kzcou7yZrt8Bw0UQP77l0Tu3DBDXkrn59HGqJ
QjPNiRjQLN0JlZIlsO2DRq/PZQFKBz3I4CUAiplF/nDT9IL7FXUEfZGumbA8o6cF
bOU4nyEsfTBNPpHEvNsHZDca7yK43/QAtwzgFz0EENh+xGq5nUy7RKDtfKcqfJ72
tf44abx+MRnOEUld1CMIiwu/cJHu/tb5g7oVJ460e84a7CRrJUHpngBeMb+0+kWE
PIJGAzIcG8lruqekFM2bxbVQjqr1wGwoIn/q4IfdE5e8CRveKEnXSMpKn2vAbygT
k+khruvVh7H5YuWxerqHdUmcrbnFOYgQlQKnyz60gvdtQLqPB0EmehmnReZM773Z
tYMpJkmi3VdQ9nTdLdPz
=8k4B
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Jul_2013_13_41_24_+1000_yI+hclESUx2fwQl4--
