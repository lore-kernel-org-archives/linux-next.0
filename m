From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: linux-next: manual merge of the btrfs tree with Linus' tree
Date: Wed, 29 Jan 2014 14:07:35 +0100
Message-ID: <xa1t7g9jym08.fsf@mina86.com>
References: <20140129115403.4d2772c096a4fc7a4c9cb156@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:63146 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbaA2NHw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2014 08:07:52 -0500
Received: by mail-ea0-f175.google.com with SMTP id z10so908460ead.34
        for <linux-next@vger.kernel.org>; Wed, 29 Jan 2014 05:07:51 -0800 (PST)
In-Reply-To: <20140129115403.4d2772c096a4fc7a4c9cb156@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Linus <torvalds@linux-foundation.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29 2014, Stephen Rothwell wrote:
> Today's linux-next merge of the btrfs tree got a conflict in
> fs/btrfs/acl.c between commit 996a710d4641 ("btrfs: use generic posix ACL
> infrastructure") from the  tree and commit cfad95253440 ("btrfs: remove
> dead code") from the btrfs tree.
>
> I fixed it up (I used the version from Linus' tree) and can carry the fix
> as necessary (no action is required).

That sounds correct.  My commit [cfad95253440: btrfs: remove dead code]
can be dropped, since Christoph's commit completely rewrites
btrfs_init_acl function.

--=20
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
..o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarewicz   =
 (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain


--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJS6P0YAAoJECBgQBJQdR/0rdQP/1nGJKzJxKlQcHjHWC+LjBTu
5pjMOuu6ydBULYF+VXFKILwKhS5R2qY0AHVp0ApsU/MFDimbj20i8+tbAzPaTIaD
XNKMV/xp4VZvAQAwkr295VdlO2hBUOypHcwik7zs7Z70FE4quRbaUNK5FmdWjJ1d
tMpcZ7L9jZCTNFa//DCLsO7OBg8hfPcB7verRMtpyWbQnGsBvgzJhRXbt5bQchwn
fdKg6WHaHr9zObvjHEn/oiaPm3aZEVajCkfaTRHsH43sl9g4dGfTbZdDP8PzL+bf
0R4NnHUDdlu+lhMjSrztG7hKWQhwVGAokZivm8ytltuBzpjW9IHTwFEeyQtsFdky
Y1cskKeaduL0seO2YOeZ3Q6Csz8g72HryEO6szeRRoPf2KDV+8fHp6CaEqqr5zVj
ONMAzVd2jXj0FV0Jpmb4c4ge1x5Khu1fBXP3fZMfAT2HXImZxy16nGlGH3WEbl8q
7TzZzi+7O9ilv+MKB+se+x5yGGjaDqCPNI8O4cEm7BdVhlE0OzvcKqdPg7VXWDtF
L9aOZbp0acPnU9dO1syyyrfj5nJZCFnbMM34VZT2ci8UQyJw5rMINXZnpzpNCF/b
uA0nDbZz+zR7fbObRNDkZSZv3LuVx/ySdz1ZjcyjoHoST4UTtxVODlID+vj3R/hl
wYdVCXm41fCCRc0lR/Mw
=E5JR
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
