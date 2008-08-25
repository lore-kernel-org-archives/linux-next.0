From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 13:01:17 +1000
Message-ID: <20080825130117.33fe34bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_13_01_17_+1000_D5v.KxZmFoh_3u.7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43453 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751727AbYHYDB2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Aug 2008 23:01:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

--Signature=_Mon__25_Aug_2008_13_01_17_+1000_D5v.KxZmFoh_3u.7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

x86_64-unknown-linux-gnu-objcopy: unrecognized option `--globalize-symbol'

Introduced by commit 46483cdbb5dc06d84d9572bac1b90f6744c7fc95 ("ftrace:
create __mcount_loc section").

The currently documented minimum requirements for binutils is 2.12.

$ x86_64-unknown-linux-gnu-objcopy --version
GNU objcopy 2.16.1

For now I have reverted commit c2ffd56692cc4b762c175fad69b70a4ec0dfca3f
("ftrace: enable using mcount recording on x86") since that is the least
intrusive thing to do and the above change depends on
CONFIG_FTRACE_MCOUNT_RECORD.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_13_01_17_+1000_D5v.KxZmFoh_3u.7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiyIH4ACgkQjjKRsyhoI8x0igCZAb+sghFfhbzad/TJjP2hLh3i
PaoAniK1FdVIkQVEqj7qZ0DU7UZZui3v
=OrXz
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_13_01_17_+1000_D5v.KxZmFoh_3u.7--
