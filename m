From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with the vfs tree
Date: Sun, 22 Feb 2015 12:41:30 +1100
Message-ID: <20150222124130.56c0ff7f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_9n/Ob_yU2._nJgcRJ_ReE4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44755 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751707AbbBVBlh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Feb 2015 20:41:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Sig_/_9n/Ob_yU2._nJgcRJ_ReE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

Today's linux-next merge of the ftrace tree got a conflict in
kernel/trace/trace.c between commit 2c13b111e15c ("VFS: (Scripted)
Convert ->d_inode to fs_inode() in kernel/trace/") from the vfs tree
and commit eae473581cf9 ("tracing: Have mkdir and rmdir be part of
tracefs") from the ftrace tree.

I fixed it up (the letter removed the code modified by the former) and
can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/_9n/Ob_yU2._nJgcRJ_ReE4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU6TPOAAoJEMDTa8Ir7ZwV+xcP/0l4NVO3QL3ktPi4HqEZjhHH
l1sXpeRhOQfMgjC7OMfpanWGCBLZKdcIOHe4Es/mqusJk39CVXii2L6PpOpQ80Pc
1CsqNWX3kZA20kE5dkhERpp3cszFL48GfeGrCFe77il6A0k42p+YYQh7Wh9tC9T9
5WmXbrdGNfTXPGsK//zOJ2lrHyUM7D8mKHYWGgCaF/ltqICWuVNaFxv42z6mVBxD
gpcvcJx1syM5yx/a3EShzp4LBDtAvO/932GivSmu6R6/zwlv7R4QKZ029iokmg0Q
RFHnoEN0qJzT/lXJuifGzj758/hJAraq/xooGumr+BbOXM4zgiYfXT0Aiv5fn9JU
zSEhd1pl/94gxUMnWHu05tl7HTF9Z6WHtKx0T3y9iTH/8vkg/SNWBFSFjfmKfK7s
nd4/6LCREMwppJzQYVtKOKUuTMamFkAX9IUq5OBqEllGIZo6sxD4zxX1HoBqkrrs
IVRyVY7DUk27r9gm9a+/Vom/qFSvcmSd1iyYIS1hh5GCiQXRmfpy6KtBQ7jNpWoh
f/yyXC4txU9QXc0HsuUlb0uD9P581JbBtS/caKy8qwAYPvyW0GYiaHGu4bW9YvAk
Mjh3WwJOkXofJZFgtU4xxSPFlLIz0T5DrqE4Pue+kGKRUuKrUabTB/240MlVEBoY
r09oj1B6hT93cxE/Ob5R
=bA7d
-----END PGP SIGNATURE-----

--Sig_/_9n/Ob_yU2._nJgcRJ_ReE4--
