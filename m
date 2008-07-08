From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Tue, 8 Jul 2008 10:52:01 +1000
Message-ID: <20080708105201.c8375a62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_10_52_01_+1000_5jZ2Em9vXz32eiZ/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39323 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754842AbYGHAwH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 20:52:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__8_Jul_2008_10_52_01_+1000_5jZ2Em9vXz32eiZ/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/kernel/entry_64.S between commits
16444a8a40d4c7b4f6de34af0cae1f76a4f6c901 ("ftrace: add basic support for
gcc profiler instrumentation"), d61f82d06672f57fca410da6f7fffd15867db622
("ftrace: use dynamic patching for updating mcount calls") and
395a59d0f8e86bb39cd700c3d185d30c670bb958 ("ftrace: store mcount address
in rec->ip") from the ftrace tree and commit
5cc8bd8f5d31bc08341deb666cdf2404262fc3e5 ("x86 NMI-safe INT3 and Page
Fault") from the x86 tree.

Just overlapping additions.  I took both and can carry the fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_10_52_01_+1000_5jZ2Em9vXz32eiZ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhyujEACgkQjjKRsyhoI8wsuACfVYP8qcuVAojwNdSDbT5kmKo0
8PoAn123LJOd8PjpQciEv1rta2p+6uyj
=fe0C
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_10_52_01_+1000_5jZ2Em9vXz32eiZ/--
