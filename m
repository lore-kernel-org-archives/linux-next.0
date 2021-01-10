Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B5CC433DB
	for <linux-next@archiver.kernel.org>; Sun, 10 Jan 2021 22:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8844D229C7
	for <linux-next@archiver.kernel.org>; Sun, 10 Jan 2021 22:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbhAJW3u (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 10 Jan 2021 17:29:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbhAJW3u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 17:29:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDWhz3QcSz9sWj;
        Mon, 11 Jan 2021 09:29:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610317748;
        bh=hgFegXw2fumJ+1g6CP92kYW3WXmjcCqoeLU3CJsYOgk=;
        h=Date:From:To:Cc:Subject:From;
        b=VEbV5mDRZXWvlWl+a92wwokfasU1iWDUEqVLJq712dJS0vClb46kRxzDcBiBMd//c
         2oEXbiHobZ1BAjLBifFqye+gPhSNVwCRbCB2f50b3u8StmQWL4lomhnx5CLxjY7yiU
         /FvOlKoAjQFFPw2MnrGIhnU6MVhUlRmzYV6IzQMl5hOIRXFtYxDSnVkc3SKVNfXdgZ
         y8V9SO2vEOoERNRsf2DlHGDUOhuEtVdZRpLLNG54AzgE+eX98qBL2kHdBzvSN1Ll2b
         I9/l8hLfIZXtfD4ACCEXI47QMpoMMQmGT4XQXrhgHOsZ4/3J6mM7ULVAvXH/HNxhOl
         0twX5bBy3/ubw==
Date:   Mon, 11 Jan 2021 09:29:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20210111092906.3a0ec8c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ffxc=el3vUyY9L=P24nX6h7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ffxc=el3vUyY9L=P24nX6h7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got conflicts in:

  fs/btrfs/inode.c
  fs/btrfs/space-info.c

between commits:

  3d45f221ce62 ("btrfs: fix deadlock when cloning inline extent and low on =
free metadata space")
  e076ab2a2ca7 ("btrfs: shrink delalloc pages instead of full inodes")

from the btrfs-fixes tree and commits:

  50f2ad0e64bd ("btrfs: fix deadlock when cloning inline extent and low on =
free metadata space")
  123b5509410e ("btrfs: track ordered bytes instead of just dio ordered byt=
es")

from the btrfs tree.

I fixed it up (I used the former version of the conflicts in inode.c
and see below) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/inode.c
index a8e0a6b038d3,070716650df8..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
diff --cc fs/btrfs/space-info.c
index e8347461c8dd,80f3edd6a391..000000000000
--- a/fs/btrfs/space-info.c
+++ b/fs/btrfs/space-info.c
@@@ -531,10 -527,8 +527,10 @@@ static void shrink_delalloc(struct btrf
  		wait_ordered =3D true;
 =20
  	loops =3D 0;
- 	while ((delalloc_bytes || dio_bytes) && loops < 3) {
+ 	while ((delalloc_bytes || ordered_bytes) && loops < 3) {
 -		btrfs_start_delalloc_roots(fs_info, items, true);
 +		u64 nr_pages =3D min(delalloc_bytes, to_reclaim) >> PAGE_SHIFT;
 +
 +		btrfs_start_delalloc_roots(fs_info, nr_pages, true);
 =20
  		loops++;
  		if (wait_ordered && !trans) {

--Sig_/ffxc=el3vUyY9L=P24nX6h7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/7f7IACgkQAVBC80lX
0Gz0UAf/TVrzfJ4DDqA+zBTuytGs44ucvH8+WAWEZDGQiv4CjgB9peT3uXCiaaJa
fSESUnlgtay2WBM7JkOCVIVKVt4xQ1+BtNnGUFoX5Q7mRUreJL2tdA0iE91pmXk1
Fzgi3ElL3NPfpqwcMc2rHbj4NfYWoLbu+Cos+tqUIDbMrZ+bdvXI3LWttw13J7jO
vcIyoC3HhwqUQJUd6wwKFB3YlPLrcoDr58U5Y+8H/udzFpIdDnMIs7+2q14EEeyV
LKS9OGyzmDNJEMPTNb/O6b2IMlzuB0ZjPkN1nXT98rQQJ1sZaZ32Qlcu8BFqS7Cr
UVjQmz7Ycc9WzOMRJmbMXERQWBfU7Q==
=IJ1R
-----END PGP SIGNATURE-----

--Sig_/ffxc=el3vUyY9L=P24nX6h7--
