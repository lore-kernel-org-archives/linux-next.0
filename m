From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the pci tree
Date: Wed, 11 Feb 2015 03:03:49 +0100
Message-ID: <4805506.yPQhhiqbXU@vostro.rjw.lan>
References: <20150211120755.50217078@canb.auug.org.au> <1544592.4ITKEDgnAg@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1890298.m9iniWUUOd"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:54705 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751075AbbBKBkv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2015 20:40:51 -0500
In-Reply-To: <1544592.4ITKEDgnAg@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--nextPart1890298.m9iniWUUOd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, February 11, 2015 02:41:35 AM Rafael J. Wysocki wrote:
> On Wednesday, February 11, 2015 12:07:55 PM Stephen Rothwell wrote:
> > Hi Rafael,
> >=20
> > Today's linux-next merge of the pm tree got a conflict in
> > drivers/of/of_pci.c between commit d2be00c0fb5a ("of/pci: Free
> > resources on failure in of_pci_get_host_bridge_resources()") from t=
he
> > pci tree and commit 5c493df25a0d ("Merge branch 'pci/host-generic' =
of
> > git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci into
> > acpi-resources") from the pm tree.
> >=20
> > I fixed it up (I just use the latter version, please check when it
> > comes out) and can carry the fix as necessary (no action is require=
d,
> > though someone might want to tell Linus how to resolve it - includi=
ng
> > the removal of the "kfree(bus_range);").
>=20
> Sorry, I messed this up.  The commit that supposed to be a merge ende=
d
> up as a non-merge commit in my tree, just because I tried to modify
> the changelog of it without doing the merge again.
>=20
> Then, I should have noticed that when I was putting together the pull=
 request
> for Linus earlier today, but then I didn't.

Linus merged my tree and the PCI one already, but his conflict resoluti=
on
didn't remove the kfree(bus_range); line, so it looks like we'll need a=

separate patch removing it.

Lorenzo, will you send it or should I prepare one?


=2D-=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
--nextPart1890298.m9iniWUUOd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJU2riKAAoJEILEb/54YlRxyRIP/0Ue0c797jHM94ffBassFS3t
yws0qOIO+Akq2QWMXGsGf/3nqlE4icHwxQP8GvWkumknH+zCpFRQUrNQlbwc0KWe
qXmcYMIe20GwfVRbG2ErXIz6+s1N6wELzhJN8Jn4pwFgyaUTkaXv5f6gOTB8gbUQ
JZac3OrPqQABYwI/xQZAwElgT/QvoLD0NfAPf6H+91YZ1WjMGeYdoiGGfikPTdrr
xyOMLQilr1DPW8U/PU9bfRRTnD5CsPy6QImTiPhCwO9GNgu4biX4aQliQVgWn6qz
KExwrPiwwO82Cf4ZW/fxbRsj242ndwbYCzjGusT3xS6ua+8Rk0Q2uBK82gQh+ob1
ZWyR2VcM2pd/NC4tUFFj9j2xx362ubitMlBXvGQk6PVV+69m1o9NFqlXWatJKUW3
547PNwGC0LZXvu2QMCiBJ0aMUWENjKFccDIJvzZ5S7o7cholIQv4isdWrK7bvoYH
L2x5RZt/4zT5tsauW2d7jT4BHQ71kcVR5pLVQA2e2NR2Y4ZLUUPtU4rQa4jSAD2f
ms/E8Ob2ripf+/QU9xfp/NnFALjK4DUCFMrOlzCL/XVKuN4QafuvfUj5S4MIkK7L
BqUAN7ibjixvTvBUyj/qMJc3Iok06Rdl0v2El9VtrkpOn0qbCnRzFWpYFWk6I//T
1HGG95aSMVjMs4Zu0fR8
=QopL
-----END PGP SIGNATURE-----

--nextPart1890298.m9iniWUUOd--
