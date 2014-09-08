From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with Linus' tree
Date: Mon, 8 Sep 2014 08:28:14 -0500
Message-ID: <20140908132814.GD22409@saruman.home>
References: <20140908171311.414b05d2@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:45483 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752973AbaIHN2e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Sep 2014 09:28:34 -0400
Content-Disposition: inline
In-Reply-To: <20140908171311.414b05d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jg1.han@samsung.com>

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 08, 2014 at 05:13:11PM +1000, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/phy/phy-samsung-usb.h between commit bbc66e140bab ("usb:
> phy: samsung: Fix wrong bit mask for PHYPARAM1_PCS_TXDEEMPH") from
> Linus' tree and commit ea2fdf842365 ("usb: phy: samsung: remove old
> common USB PHY code") from the usb-gadget tree.
>=20
> I fixed it up (the latter just removed the file, so I did that) and can
> carry the fix as necessary (no action is required).

Thank you. Guess I'll just merge current -rc in my next branch :-)

--=20
balbi

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUDa7uAAoJEIaOsuA1yqREewQQALKe53JAMZInuFs96LQzUDC4
phI8DhtcYOsyj+BGr+EWsjL1caXJFSg3e14OZFitccFk5QNWru0JHQbfJ1Bynj0Z
K0dSZqOCnFLAIBASYPdn9oGEXyLwuvlT30WwdQbS5FfDVtkL1SALNebKCF8xDIPg
7uIMdJFWLXJv+m0M9iUz+leXYkDgr5s1P1oMIPWQUT2BR6BhUdWdGCCrhl2H2TNb
LVoiHNX6vuln65vaA7G/7fKTjNhWWf9VA83QwSeV+GDtv3n64ZTMXYi9yYKngFyJ
/+Fub2sJO1fNwQzJORDvjuTRpHF9fr2dIVQYCNT+X/8r3GdNA5VI6AqFdkPnXAHW
vEJQmbfQCc486w/FqBBw5zFsAg+cx30ztYqG7B4ph0VhufRDrZKyMZuPlkuLBG5Q
OeM6UujBAM3cJZus7T3T4hfyL5sPJz7j0S7/Gv3hPlf56ua7ls0PhRijCrg/zfVL
UKdcrWIij/cf+sf3a4kGncPLpeVLIOir9yZ6Y29i7b1W+jhxdK9PZVXzuKmpkINz
4crKGJRBPHWdpZVifMSCaHNvqUr/selydxmG0OKLnhkV5oCWGUUM4EqOt3YJGwz6
9gR56grLSvxpi+PBAZeLDzd3K28fHfIEWzJFcd6xpnsAt0GzJRlm+9jtZGuKe0T9
Lb4euzIV5mI4ntOtMeTk
=u6Vn
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
