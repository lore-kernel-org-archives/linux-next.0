From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build error
Date: Tue, 17 Feb 2009 16:12:52 +1100
Message-ID: <20090217161252.ef44979c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Feb_2009_16_12_52_+1100_yo1pg1wJF4443XgD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55200 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751100AbZBQFNC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 00:13:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Anders Kaseorg <andersk@mit.edu>, Jeff Arnold <jbarnold@mit.edu>, Tim Abbott <tabbott@mit.edu>

--Signature=_Tue__17_Feb_2009_16_12_52_+1100_yo1pg1wJF4443XgD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

In file included from kernel/kallsyms.c:15:
include/linux/kallsyms.h:22: warning: 'struct module' declared inside param=
eter list
include/linux/kallsyms.h:22: warning: its scope is only this definition or =
declaration, which is probably not what you want
kernel/kallsyms.c:164: error: conflicting types for 'kallsyms_on_each_symbo=
l'
include/linux/kallsyms.h:21: error: previous declaration of 'kallsyms_on_ea=
ch_symbol' was here
kernel/kallsyms.c:181: error: conflicting types for 'kallsyms_on_each_symbo=
l'
include/linux/kallsyms.h:21: error: previous declaration of 'kallsyms_on_ea=
ch_symbol' was here

Caused by commit eadcd635def320c8f057f32dd3531638ee99e50a ("Ksplice: Add
functions for walking kallsyms symbols").

I have dropped the rr tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Feb_2009_16_12_52_+1100_yo1pg1wJF4443XgD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmaR1QACgkQjjKRsyhoI8xxagCfcR2tgwjF5Zac3A2dMyEcFfj1
EuQAn1fIgqdvPzecnj9gds2avirDEdFU
=pbCt
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Feb_2009_16_12_52_+1100_yo1pg1wJF4443XgD--
