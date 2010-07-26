From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 26 Jul 2010 13:39:03 +1000
Message-ID: <20100726133903.a050ec49.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__26_Jul_2010_13_39_03_+1000_pc5Ubkcxqk2qErrf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59474 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753387Ab0GZDjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jul 2010 23:39:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Conny Seidel <conny.seidel@amd.com>

--Signature=_Mon__26_Jul_2010_13_39_03_+1000_pc5Ubkcxqk2qErrf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
tools/perf/Makefile between commit
8a4fd31e0e8dc33f00b8949a12ac56310bac57bc ("perf tools: Fix fallback to
cplus_demangle() when bfd_demangle() is not available") from Linus' tree
and commit 167a58f10d9cd1bdf6a911aa1eecbdff596de156 ("perf tools: Fix
fallback to cplus_demangle() when bfd_demangle() is not available") from
the tip tree.

I assumed that these commits were meant to have the same affect (I only
got a conflict because of earlier changes in the tip tree) and so used
the version form the tip tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__26_Jul_2010_13_39_03_+1000_pc5Ubkcxqk2qErrf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMTQNXAAoJEDMEi1NhKgbs6tAH/iwNteaim9Nxr8bKzfryQLLh
t8jG49OT/x93EtDFLeKhDZVq9Pt8eIqTvXAQjUtOTMCIu/RAAZ5WPpdJ7Zt3QyFa
OCyEQr8qvb6p55WpypNPNfZc9n6i4uUnz0RqZ50lgZiNJHUFdiitm/kX5eqZB0+C
NGtdmRaDhL/UL9Is22HjU8jKQsxDhsSNptLGJhJR+rhB7JpcqCxkOQH7rUwpPiVF
nWXZmw95TMDwlSuyC8xFglrElA7n4VagsdQcXYHmkNOab3IAu8Ad9HQuVNSvib1g
niU8XIX82ZlvVAmDPlAA6ITPBoV+CIQNLMwFSowiVZ8cBD7UkbMhRzGY4Cid/Sc=
=GOW7
-----END PGP SIGNATURE-----

--Signature=_Mon__26_Jul_2010_13_39_03_+1000_pc5Ubkcxqk2qErrf--
