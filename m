From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the v4l-dvb tree
Date: Sat, 20 Jun 2015 23:49:10 +1000
Message-ID: <20150620234910.0f543ee6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aH6MJ.aE8j3KFCVp2DSs820"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54979 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753806AbbFTNt1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 09:49:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Jan Kara <jack@suse.cz>

--Sig_/aH6MJ.aE8j3KFCVp2DSs820
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/media/v4l2-core/videobuf2-dma-sg.c

between commit:

  511a1b8a4c81 ("[media] Revert "[media] vb2: Push mmap_sem down to memops"=
")

from the v4l-dvb tree and patch:

  "media: vb2: convert vb2_dma_sg_get_userptr() to use frame vector"

from the akpm tree.

I fixed it up (I just used the akpm tree version) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/aH6MJ.aE8j3KFCVp2DSs820
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhW9jAAoJEMDTa8Ir7ZwV80MP/jqlVr2jtKW6p+jHafSaPu3X
86Gq6UDBPnEwqjdcUk8A4DUICD5ufKZO2KmNM8/So+AIDH/M6XUK+9yBbKP7OPb8
OHwA7/60uZHaPEGS8o0YFk5dMRFf50IGt141orpfP0gBKOhluuVj+yx8YrKP56hR
jx9zRGbnVLv+GjhJZ8cEgFjKWja0BzZHt1JW9DQt9ZULL3gkgTnyyw3xLGVI7Pba
vZDZ+/hartq4F8j21j7K8vK2zd6X+2lkxTYGQgiYTxhJ6hgpsJaXENYkUJOEKKCL
oBbGFaw0KwnlYmOw/2m9CByE6CjpjjoTr0uHLy+6HeCE4VfdTM9xKrJsLDeSM3p4
dnWwpCNBKLlPRURpBRcPI3q4zvQyTBI8VKdDRBTHuLtonT06pirUAtav/n1bUXTM
szOpNSOOoYVyEyJAVM2AAMeP8Uqp+dwjeu+QC82Z+4AExwK3vxfVmr5XKfgEUpZO
b5ltR3bNKzjuUA26vOP6ftH5gtEC8RjSLR7G/KsKXeA9iJorLDrPS3WSDKckFISp
iky84rBu7lLLuqKGvTQYP/yBE/PIGT7olIHEoQWHjncRP56kXMTQ0xe3cUKp5ayF
v1AoQyVZLDRqQoQG8lu6VXJesg6ggOocPOYj5rBg7rsiYfPr0ipe3M1ycK57fCym
KZwxhq5iYQ8ABiDWnLDd
=0BDx
-----END PGP SIGNATURE-----

--Sig_/aH6MJ.aE8j3KFCVp2DSs820--
