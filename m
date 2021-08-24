Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1141DC4338F
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 23:51:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E095A6125F
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 23:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbhHXXwg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Aug 2021 19:52:36 -0400
Received: from ozlabs.org ([203.11.71.1]:38083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231552AbhHXXwg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 19:52:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvQr54nLDz9sW4;
        Wed, 25 Aug 2021 09:51:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629849110;
        bh=63d7GRj7v+w0BCripYHkLfK2Q6sS1tGG20uSv7wKGRU=;
        h=Date:From:To:Cc:Subject:From;
        b=c/+05zGj9p4mzI8jWgDmC7GXqf4Ka3djv6eSs165cO48GaHVL67QY0b280jsBKI0d
         AUBJAk05iUEOoMmbviK3lC6DUz66IaCzsl1HkINbVLyfToUk9GV9ediAyL9udt5JCc
         Ug1vQj7InhUFofw8Oong6TQkH6oYMmcUP3Lsepp8NUKvGkXnlsbSf/GcnXNnVbtawp
         SuJaik9doVFgEZsJwnX2HO+ta7f4XCf539LACA5waZhycPSHbmx5DNLePYaCzjyC+r
         cXmjJhLQf5YiJxdpza1tg32sBSz1g2L2rhPkkYBplQZPU9tUQ3NJC0AIMfCd9LvpI4
         DaCLG0e46S4yQ==
Date:   Wed, 25 Aug 2021 09:51:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>
Cc:     Chao Yu <chao@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the f2fs tree with the ext3 tree
Message-ID: <20210825095148.1eb9bc54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ga+cSpzEGhqgc9OA2W9.e/.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ga+cSpzEGhqgc9OA2W9.e/.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/file.c

between commit:

  edc6d01bad73 ("f2fs: Convert to using invalidate_lock")

from the ext3 tree and commit:

  4817758c80ad ("f2fs: adjust unlock order for cleanup")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/file.c
index 1ff333755721,3330efb41f22..000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -3473,8 -3496,8 +3494,8 @@@ static int f2fs_release_compress_blocks
  		released_blocks +=3D ret;
  	}
 =20
- 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 -	up_write(&F2FS_I(inode)->i_mmap_sem);
 +	filemap_invalidate_unlock(inode->i_mapping);
+ 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
  out:
  	inode_unlock(inode);
 =20
@@@ -3626,8 -3649,8 +3647,8 @@@ static int f2fs_reserve_compress_blocks
  		reserved_blocks +=3D ret;
  	}
 =20
- 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 -	up_write(&F2FS_I(inode)->i_mmap_sem);
 +	filemap_invalidate_unlock(inode->i_mapping);
+ 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 =20
  	if (ret >=3D 0) {
  		clear_inode_flag(inode, FI_COMPRESS_RELEASED);

--Sig_/Ga+cSpzEGhqgc9OA2W9.e/.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmElhhQACgkQAVBC80lX
0GxcHQf+MjxGIVXZ+89/gBg/PnoRPwmURLWYXA5jgreViSEdbXE5M7HfZerT5uw2
A0dPcYMUPS55IrqoxPmTdKVnP2ENWobqLYrVUp4w9a0vnQKTiAPOVD7R8efOj8dq
e3dSncF6ZKvdHrcjfQSxxMu6XYko+vcq8qU2glTBIPJgC2QpyV3NgRYUQV7HhXRo
pBIiy8UORIhyjUOVVwI15jJ33NIYoSNX7MG6NHGTgOBJE8XqXzQvHmS6TEX0v43I
5OYx0nCmovvQ7obJVwTfLTxMSjOKY5TNpG2zSuypGreogxT2jSEQcMY+vQgSPTud
4KPAwvHBdOMyAKvmVWyP2y7DpqA9oA==
=Cwia
-----END PGP SIGNATURE-----

--Sig_/Ga+cSpzEGhqgc9OA2W9.e/.--
