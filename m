From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: rebase of the jdelvare-hwmon quilt series
Date: Fri, 12 Jul 2013 10:36:01 +1000
Message-ID: <20130712103601.69fe5dd208fa562944a8af10@canb.auug.org.au>
References: <20130711102724.51608a4ace419b6d42591257@canb.auug.org.au>
	<20130711075700.21d8482c@endymion.delvare>
	<20130711165343.f921e147403570508939f2df@canb.auug.org.au>
	<20130711093928.24490f06@endymion.delvare>
	<CAP=VYLrNH8pZJUPyfZCtLGGQn_ZcBWbNynSHrwYpeKmqqE6Bsg@mail.gmail.com>
	<20130712102759.7bc9e68271b1b0ad6b0f4fdd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__12_Jul_2013_10_36_01_+1000_ZF5VjpI46FJ2E6L0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36684 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756613Ab3GLAgD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jul 2013 20:36:03 -0400
In-Reply-To: <20130712102759.7bc9e68271b1b0ad6b0f4fdd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@gmail.com>
Cc: Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__12_Jul_2013_10_36_01_+1000_ZF5VjpI46FJ2E6L0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jul 2013 10:27:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> As Paul said, new material should not enter linux-next until after -rc1
> is released.  In fact, every time Linus opens a merge window, I send an
> email to lkml and the linux-next list saying just that.  I also often add
> that message to the top of my daily release announcements (though I
> forgot during this merge window).
>=20
> This restriction is imposed so that maintainers still getting their code
> into the current merge window are not distracted by reports of problems
> in linux-next to do with code that will not be merged in this merge
> window.

Of course, this does not apply to bug fixes etc.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__12_Jul_2013_10_36_01_+1000_ZF5VjpI46FJ2E6L0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR309xAAoJEECxmPOUX5FE2PQP/2g7BAI4AKg/aorX5F7ij7fn
MKicjAxd69y4Zyy3wRpBHY07CcbbjoRhNleY0wsQVTm9N4VpaGmZA72+O68FHcmn
1vsZMR3uQf0BkfAjdK0ARoAg2Nsxr84L6NzhDCNZ6qe7oHmrOeNMNjpI1pGuSshV
hE+2zwB4hdY2GBkP3xkF2/KMvDcl50E7Z3nhy69bbnMe8HntKZ4bix89IwPgGLsF
OtJYjpGRfbMMBrpeouyt2emXq+Q8G1QaWbDmOmbZv9mYIjRDdRA2taZckTLqiVLs
Q9P6xbYrPUcM6sJxLVgTNyvGsG0lQKyoXREfhrQdfBJ2S87eXRTqlwFUwrINv/O0
Igiv/qUQKysa1zD1h1FaGciWrp8cB5lBgkH8jRnflPskT1qXMITdqRGlmhNerUa/
yTl9ggKKMiXrkyXXugxb90WQTWWxoM+5cBqLfHg05qsGv73LE0isvS1q/nkFL7Ee
HZDrFgVRzSx0goUXZWDVnQzZgLZxwEMhpvjgzEFuF6ipqT6DRxtuNIoP2d8DMpFv
Kkc86/TKBGGjzmG1ZkaPuHu6kgbsymSALr7h9Dmi0ok+W6YcKRkV5P4Hl8qFRKO4
T564I3+Vu0hDHSEPi7X8O1nya3yWu6JClx3KGxUz+O44RoLM+kn1PzB6Gx2PDjz3
va/0Lr+KMWkuQuiiMC8B
=79Q4
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Jul_2013_10_36_01_+1000_ZF5VjpI46FJ2E6L0--
