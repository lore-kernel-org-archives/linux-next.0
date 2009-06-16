From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ext4 tree build warning
Date: Tue, 16 Jun 2009 11:08:44 +1000
Message-ID: <20090616110844.65254bc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Jun_2009_11_08_44_+1000_cy6aCANALnyp.FOW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51257 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753146AbZFPBIr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 21:08:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__16_Jun_2009_11_08_44_+1000_cy6aCANALnyp.FOW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

In file included from include/trace/ftrace.h:262,
                 from include/trace/define_trace.h:57,
                 from include/trace/events/ext4.h:720,
                 from fs/ext4/super.c:51:
include/trace/events/ext4.h: In function 'ftrace_raw_output_ext4_free_inode=
':
include/trace/events/ext4.h:12: warning: format '%llu' expects type 'long l=
ong unsigned int', but argument 8 has type 'blkcnt_t'

Introduced by commit a6e130e94db16b324fbf2eeed2b310273625acf7 ("ext4:
convert instrumentation from markers to tracepoints").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Jun_2009_11_08_44_+1000_cy6aCANALnyp.FOW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko28JwACgkQjjKRsyhoI8yodgCggIfWK4avO15pCM0w9kbwmIFV
ekIAn2LagypDcMQ1dtnej3p5HMPCh5Ez
=Cx1c
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Jun_2009_11_08_44_+1000_cy6aCANALnyp.FOW--
