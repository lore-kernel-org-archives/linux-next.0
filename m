From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Wed, 18 Mar 2015 11:32:34 +1100
Message-ID: <20150318113234.6e74c175@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Fimu08PTnDPVGHWFFcxiBM="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43222 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753500AbbCRAcl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2015 20:32:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabian Frederick <fabf@skynet.be>, Christoph Hellwig <hch@lst.de>

--Sig_/Fimu08PTnDPVGHWFFcxiBM=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/udf/file.c between commit 13f0c2b0f67d ("udf: remove redundant
buffer_head.h includes") from the ext3 tree and commit 52858684778b
("fs: move struct kiocb to fs.h") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/udf/file.c
index dda8ea7012c6,7f885cc8b0b7..000000000000
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@@ -33,7 -33,8 +33,7 @@@
  #include <linux/capability.h>
  #include <linux/errno.h>
  #include <linux/pagemap.h>
- #include <linux/aio.h>
 -#include <linux/buffer_head.h>
+ #include <linux/uio.h>
 =20
  #include "udf_i.h"
  #include "udf_sb.h"

--Sig_/Fimu08PTnDPVGHWFFcxiBM=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCMenAAoJEMDTa8Ir7ZwVkJsP/RkP5RMs56YH48Kfmc9w8Fkf
tLOICfchGIjNYCXEiOJBtbGn6GLbOskAiFuAfAcSPZDWzCPYePQnvAUy7sKiBoEW
cGSb0+vzYCt2woFD39pJooJjEDDoz3NoSqnqSKibzL9Yh6N3tAb/IPyxtfs3+aGP
bI+3nQc1DZ9AMP2PURiX8vK8yjfHkrkFu4iWmfD7qLHRvr0f2XaGqlafjomhjeKP
PaSph0VkWxBCUQvyOvr3xLyqvoZvOMYN8nvHiyh1ViJ2F9fyYjdIqdpgcE18lG6H
nMI3BeKP2OK8XWFUR3sxCxjUpDFFgLHqGL4tA2OeobFugnT0seLDo4aZRJe0G55N
dDukjoREEWq/dEcVv18hvs+aiPzCbi0SxSYFd7OmV6BqzqanvGgldLxI5mpLa2Ps
5WVby3VHFrIcddVoyk2PuiaSJKKbS2SFAhUs0DNRRqKMQTEHzWVFseUglQBig3Z1
fZSf95pRxTgNvdfC4HVl5m/VA+7oknOjywTu+MFmrdkL2jEzbo5rxnn279GCuRo4
Fw2qc+ID1fdBEKkAnKoR21uoiZHjINUAo5G5rPW/WbqCZOvJ8Y6SVuaDFsembpMb
G98vFMZgnrbM5dBvDBf2fMI4X6eWDjMRyDjzWipZc9H20Y81/q87Q7tMdIyiQNaR
Opuy2+840nbFWCeDdyqL
=Fydh
-----END PGP SIGNATURE-----

--Sig_/Fimu08PTnDPVGHWFFcxiBM=--
