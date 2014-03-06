From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request inclusion of HYP mode cpu_resume fix into linux-next
Date: Fri, 7 Mar 2014 09:37:55 +1100
Message-ID: <20140307093755.48783e33d163e0a900323a53@canb.auug.org.au>
References: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__7_Mar_2014_09_37_55_+1100_GDnIB6HhhIKQYIxv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:59063 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750875AbaCFWiG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Mar 2014 17:38:06 -0500
In-Reply-To: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christoffer Dall <christoffer.dall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@arm.linux.org.uk>

--Signature=_Fri__7_Mar_2014_09_37_55_+1100_GDnIB6HhhIKQYIxv
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Thu, 6 Mar 2014 18:43:03 +0000 Lorenzo Pieralisi <lorenzo.pieralisi@arm.=
com> wrote:
>
> can I ask you please to include the following branch into linux-next:
>=20
> git://linux-arm.org/linux-2.6-lp.git arm-kvm-cpuresume
>=20
> It contains a patch touching ARM PM core code that requires wider testing
> coverage before I request a pull. It has been already publicly posted,
> reviewed and tested.

Added from today.  Please make sure you tell me when it is no longer needed.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Fri__7_Mar_2014_09_37_55_+1100_GDnIB6HhhIKQYIxv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTGPjHAAoJEMDTa8Ir7ZwVw+oP/RSlzg9GS4r2sRYQwGPqaNoL
s/BhJhHK38eT+PRLs4df4ldsuIxTMRGlOv6YR48NIpXQsHh0MV7QGBdmOBSAD9tN
R3s0LeEB/3Ur5x0R6Cmh6ron+SBm40Z4o5UU785lQgajfgigZ0cWh/a7H4RI0Eyc
z9eZjJ9mGG4tAMDNys97SnnWEPVIv9aV2TBD14kpbUA/zCa8+UYCNkQ4robyjv70
kJmaA4pafyY51QDKvYjR/CNnF59y4NoKqE9Ki0sBNY2/hymiWxg/kvzMUxiwkeIT
v7VDiwfcbhI+jB59YY1v7FAqrhOnlte7CMAh5umqGBuJNGe+fZT4C/vb29IbhN+7
scvbH3QROFwi6YgKkKppEhmytNOvl0uis0tYGhJLf5v4Pyq4PeYd3NJN5jaMivlk
5JhKcwWN6oNMU/JzpupVWKJashnQfEF+D2aFXvU9INIiNRfM68w7CiSOUAwIyZW6
s0ze+XV4L/KYyc+tATxrGidppusuxtl/ByYsOO16wZNho14MXunRkovx/5B6BY/v
5nLjkqKCwjBSKgX1fLsKM3gBO9l3lKXbXDX/X2/kRzzBDSdePyRy644I6IYo+tnH
nFvgUNc/c2r/ZQfYSgeYoPM9CZu1cFBaIZB6Ctl+UgV/nfaE9Zm0bVqaMOzC9rvh
AwJ8bcJi4MYSuaihUviM
=4FXB
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Mar_2014_09_37_55_+1100_GDnIB6HhhIKQYIxv--
