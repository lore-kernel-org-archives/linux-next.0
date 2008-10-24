From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warning
Date: Fri, 24 Oct 2008 13:34:07 +1100
Message-ID: <20081024133407.8c4df5f6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__24_Oct_2008_13_34_07_+1100_vs0OWH.tL+CZro.U"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44050 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751572AbYJXCeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 22:34:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__24_Oct_2008_13_34_07_+1100_vs0OWH.tL+CZro.U
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) got this warning:

kernel/workqueue.c: In function 'work_on_cpu':
kernel/workqueue.c:1009: warning: passing argument 1 of 'flush_workqueue' f=
rom incompatible pointer type

You are passing a "struct work_struct *" to fluxh_workqueue which wants a
"struct workqueue_struct *".

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__24_Oct_2008_13_34_07_+1100_vs0OWH.tL+CZro.U
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkBNB8ACgkQjjKRsyhoI8xmugCgjeQkZnaBpldP6yyZWz4uiF/Q
qjgAoKPTM1qF9KWlHzfOc3BHQsIxi1rF
=j28c
-----END PGP SIGNATURE-----

--Signature=_Fri__24_Oct_2008_13_34_07_+1100_vs0OWH.tL+CZro.U--
