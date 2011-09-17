From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: git tree URL for IEEE 1394 (FireWire) kernel subsystem
Date: Sat, 17 Sep 2011 19:47:57 +0200
Message-ID: <20110917194757.2f561324@stein>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/yvNUBuTSe.W+h=Mip48AavS"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from einhorn.in-berlin.de ([192.109.42.8]:44668 "EHLO
	einhorn.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277Ab1IQRs3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 17 Sep 2011 13:48:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org

--Sig_/yvNUBuTSe.W+h=Mip48AavS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Stephen,

please switch the ieee1394/for-next pull URL to

    git://git.user.in-berlin.de/s5r6/linux1394.git for-next

until kernel.org springs back into action.  Thanks.
Current contents relative to mainline:

Ming Lei (1):
      firewire: ohci: add no MSI quirk for O2Micro controller

Stefan Richter (3):
      firewire: sbp2: remove obsolete reference counting
      firewire: sbp2: move some code to more sensible places
      firewire: sbp2: fold two functions into one

Stephan Gatzka (2):
      firewire: ohci: Move code from the bus reset tasklet into a workqueue
      firewire: ohci: Add support for TSB41BA3D phy

 drivers/firewire/ohci.c |  206 ++++++++++++++++++++++++++++++++++++--
 drivers/firewire/sbp2.c |  256 +++++++++++++++++++++----------------------=
----
 2 files changed, 308 insertions(+), 154 deletions(-)
--=20
Stefan Richter
-=3D=3D=3D=3D=3D-=3D=3D-=3D=3D =3D--=3D =3D---=3D
http://arcgraph.de/sr/

--Sig_/yvNUBuTSe.W+h=Mip48AavS
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk503VIACgkQLjmasfpVluyKegCffd6ThUIH1UmKw7n2kRFmH9NJ
9zoAmgLQYXIVZYUruu5v5K9jwdAGa8nw
=qB2S
-----END PGP SIGNATURE-----

--Sig_/yvNUBuTSe.W+h=Mip48AavS--
