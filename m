From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Thu, 2 Aug 2018 01:07:05 +1000
Message-ID: <20180802010705.24a72730@canb.auug.org.au>
References: <20180730161622.3837cb15@canb.auug.org.au>
        <559c49b8-9d58-e242-20c2-fe1b491664dd@huawei.com>
        <7152b6ba-9ad6-4a9c-3b13-2d5310266ccd@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6gHwjK/X8hKbAfmFlwPSlMJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7152b6ba-9ad6-4a9c-3b13-2d5310266ccd@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Yu <yuchao0@huawei.com>
Cc: Gao Xiang <gaoxiang25@huawei.com>, Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Miao Xie <miaoxie@huawei.com>, Linus <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6gHwjK/X8hKbAfmFlwPSlMJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chao,

On Wed, 1 Aug 2018 17:09:13 +0800 Chao Yu <yuchao0@huawei.com> wrote:
>
> Xiang has submitted several patches as below to fix compiling error on -n=
ext
> tree, could you consider to merge those temporary fixes into -next after =
merging
> staging-next's updates, and reenable CONFIG_EROFS_FS for further integrity
> compiling and test?
>=20
> staging: erofs: fix superblock/inode flags (MS_RDONLY -> SB_RDONLY, S_NOA=
TIME)
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000282.html
>=20
> staging: erofs: remove RADIX_TREE_EXCEPTIONAL_{ENTRY, SHIFT}
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000283.html
>=20
> staging: erofs: update .mount and .remount_sb
> https://lists.ozlabs.org/pipermail/linux-erofs/2018-July/000285.html

OK, I will apply those tomorrow (actually later today :-)) and and stop
disabling CONFIG_EROFS_FS.

> BTW, for this condition that erofs was not covered by some common vfs
> stuff changes in other one's tree, who should take care of those
> missing fixes during coming next merge window?

It might be easiest for Greg to add the disabling CONFIG_EROFS_FS patch
to the staging tree itself for his first pull request during the merge
window and then send a second pull request (after the vfs and maybe the
Xarray stuff has been merged by Linus) with these patches followed by a
revert of the disabling patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/6gHwjK/X8hKbAfmFlwPSlMJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlthzJkACgkQAVBC80lX
0Gwe9Qf/SDpVeOnYLrCqQSPYNt8Fx4fD82J43kv746+qqMsN6sSfgXqUm6KdONYD
2dXVGwMhp0XGabf48uw35X7kNl76KwXh1BEMSkBuXIcJrUXNF3sUAa8q1+Tl2kPM
DA/su1F6MElnDaOJ88mj2oJd0PN/1PA5RMBcdXRLQLdLBDgenonQm2yzZ9j2+REg
qEdHvyfGzxhx3rk4t11mVfQbQwvYW36LcIFRO3owqN/42hNEGxcyF4ouxBsIoDPM
XQOcthold2IirqH18ZXL6yO0EZWR1PzSJwCh+5svNPd+Z5kQT6gqzgfCtc9XGKqR
mMw8GoUPqN14ojmKIu9ZC2esBLXD1Q==
=cYYy
-----END PGP SIGNATURE-----

--Sig_/6gHwjK/X8hKbAfmFlwPSlMJ--
