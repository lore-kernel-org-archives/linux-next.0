From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning from Linus' tree
Date: Fri, 3 Jun 2011 11:10:49 +1000
Message-ID: <20110603111049.d5967bb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Jun_2011_11_10_49_+1000_ReRWSv_.x2C/K2EC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37242 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753445Ab1FCBKw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jun 2011 21:10:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <chris.mason@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miao Xie <miaox@cn.fujitsu.com>, David Sterba <dave@jikos.cz>, Tsutomu Itoh <t-itoh@jp.fujitsu.com>, Itaru Kitayama <kitayama@cl.bb4u.ne.jp>, Linus <torvalds@linux-foundation.org>

--Signature=_Fri__3_Jun_2011_11_10_49_+1000_ReRWSv_.x2C/K2EC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

With Linus' tree, today's linux-next build (x86_64 allmodconfig) produced
this warning:

fs/btrfs/delayed-inode.c: In function 'btrfs_batch_insert_items':
fs/btrfs/delayed-inode.c:670:6: warning: 'nitems' may be used uninitialized=
 in this function

Introduced by commit 16cdcec736cd ("btrfs: implement delayed inode items
operation").  I think this is a real bug.  This variable is not
initialised, only incremented and tested.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. Chris, time to get a tree into linux-next?

--Signature=_Fri__3_Jun_2011_11_10_49_+1000_ReRWSv_.x2C/K2EC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN6DSZAAoJEDMEi1NhKgbsrsgH/3cW7xz/958Ml+01AuL5tJNK
VLT03P6cw6AczMOYKdSY37BlQ66w+emE0nqk0ZW0KSbognvpUKxwb972QYEx5d3c
Hfy0Wle334n42UDXFYKjIM0de8ooxMBSp+HT+HrD4q5ZgdMGojFRdIdZ6pH4rZpa
jzEyTg2H8XH9OI3ygfRq4k3LeCQ6OEKaXxN1Kb5j8HpugM4vlJhAA0OMtWqD17Io
YXfJZduXzb/iJL9QQiaLDfpq4cnybcnWKx8BSVKItkp1+LblpyaTiAyJTUk3QGt/
9IWwlgO6tJ53eKNjePl2rmvjgpMjac4oblvWOQFdgbbMcb8Eu3ilgvI5MUTcSDo=
=Ge9K
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Jun_2011_11_10_49_+1000_ReRWSv_.x2C/K2EC--
