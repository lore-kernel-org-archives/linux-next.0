From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: x86/driver-core merge failure
Date: Mon, 19 May 2008 11:33:28 +1000
Message-ID: <20080519113328.c98700c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__19_May_2008_11_33_28_+1000_p2k_gEZR_t=eEws5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59970 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753183AbYESBdn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 18 May 2008 21:33:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

--Signature=_Mon__19_May_2008_11_33_28_+1000_p2k_gEZR_t=eEws5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg, Ingo,

Today's linux-next merge of the x86 tree got a conflict in
kernel/power/main.c between commit
7c6e17af5dfa9e70e1eb32981f3f608ef1d0eca5 ("PM: Introduce new top level
suspend and hibernation callbacks") from the driver-core tree and commit
338e075309d960eb91cc8540f69b9cb5b2967d3e ("sleepy linux self-test") from
the x86 tree.  The former added a parameter to device_resume() while the
latter put a suspend_test_start()/suspend_test_finish() pair around the
device_resume() call in the error path of suspend_devices_and_enter().
It is a trivial fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__19_May_2008_11_33_28_+1000_p2k_gEZR_t=eEws5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIMNjtTgG2atn1QN8RAiV0AJ4qEx3p95+jOTrg5AhGBXTUM6Jm8QCbBxEy
+Q9ifbUTPpH+XnWEjg5hB8w=
=68XA
-----END PGP SIGNATURE-----

--Signature=_Mon__19_May_2008_11_33_28_+1000_p2k_gEZR_t=eEws5--
