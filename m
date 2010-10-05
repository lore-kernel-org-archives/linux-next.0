From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 5 Oct 2010 15:11:26 +1100
Message-ID: <20101005151126.eadae817.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__5_Oct_2010_15_11_26_+1100__QNjze5DE92B5/uq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52131 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760Ab0JEELh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Oct 2010 00:11:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Len Brown <len.brown@intel.com>

--Signature=_Tue__5_Oct_2010_15_11_26_+1100__QNjze5DE92B5/uq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

make[4]: *** No rule to make target `drivers/platform/x86/ideapad_laptop.c'=
, needed by `drivers/platform/x86/ideapad_laptop.o'.  Stop.

Caused by commit 9efe5c1540a1e03cb2e0fca85e49fc4c57c6e771 ("ideapad:
Change the driver name to ideapad-laptop").  The commit renames
ideapad_acpi.c to ideapad-laptop.c but the Makefile uses ideapad_laptop.o
(note underscore v. dash).

Presumably this was never even build tested :-(

I have used the drivers-x86 tree from next-20101004 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__5_Oct_2010_15_11_26_+1100__QNjze5DE92B5/uq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMqqVuAAoJEDMEi1NhKgbswVAH/iERIV5ZuXqtJD9xhwf4k+1t
WaAkdNaVYAs6MUOiM9TmMzCTiKsbXHG8PS0UQM42njE7d8BAJalO5g/YEzbzVjWS
G1ishVOuggXNq2P1aXQV0LWq4dTk8wNMa1Bk2UNg6yjGa3LO4ay5fKe9YUrCoYB3
QRVSTEsTDBQw2Pg3VmI63XQQqiBFqtM5sQjPMVwfcG0DGf28+Z7qiU/EK/pa13uo
cwvi3rywjUh0HNoDZ0qX8reTP+FzIvfTeOlFM+kZQO86NP2k+f07L7dsmdfVQWf/
bwDsg+F2FJCRRTtqSo9QRB2DCy4AXCURWt7Dqe3yEe63rXsm2fuXesn3uqutupg=
=jnw8
-----END PGP SIGNATURE-----

--Signature=_Tue__5_Oct_2010_15_11_26_+1100__QNjze5DE92B5/uq--
