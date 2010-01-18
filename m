From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: merge fixups relative to the vfs tree
Date: Mon, 18 Jan 2010 18:28:52 +1100
Message-ID: <20100118182852.9820b770.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_18_28_52_+1100_7mKx.dZFhOOxlmw8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48180 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932091Ab0ARH26 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 02:28:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?IkrDtnJuIEVuZ2VsIg==?= <joern@logfs.org>, Sage Weil <sage@newdream.net>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__18_Jan_2010_18_28_52_+1100_7mKx.dZFhOOxlmw8
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rn, Sage,

Al has now created a "write_inode" branch in the vfs tree that just
contains the changes that your trees need to be fixed up for.  Al
promises that this branch will never be rebased.  So the best solution is
for you both to merge that branch into your respective trees ("git pull
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs-2.6.git
write_inode") and then apply the patches I sent (assuming that they are
correct).  If you rebase your trees, you will need to repull the above
branch, of course.

[Alternatively, you could create a remote in your trees for Al's
write_inode branch:

git remote add -f -t write_inode write_inode git://git.kernel.org/pub/scm/l=
inux/kernel/git/viro/vfs-2.6.git

and then merge it using

git merge write_inode

That way if anything is added to that branch you can just refetch it and
merge it again if necessary.]

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_18_28_52_+1100_7mKx.dZFhOOxlmw8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktUDbQACgkQjjKRsyhoI8zV6gCfXzOd3uBQZsNUiA9XsWX9BlSH
kCcAnR7VO9ebGGE5cYNpzhcsZ/SSOcQU
=lRQa
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_18_28_52_+1100_7mKx.dZFhOOxlmw8--
