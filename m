From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: pci tree build failure
Date: Tue, 19 Jan 2010 14:19:17 +1100
Message-ID: <20100119141917.ff3a2ed5.sfr@canb.auug.org.au>
References: <20100118194050.7ea0c406.sfr@canb.auug.org.au>
	<201001182224.44223.rjw@sisk.pl>
	<20100119023534.69a7790a@jbarnes-x200>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__19_Jan_2010_14_19_17_+1100_MVlRBOyVdlYuGQS/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58173 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752332Ab0ASDTX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2010 22:19:23 -0500
In-Reply-To: <20100119023534.69a7790a@jbarnes-x200>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shaohua Li <shaohua.li@intel.com>

--Signature=_Tue__19_Jan_2010_14_19_17_+1100_MVlRBOyVdlYuGQS/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Jan 2010 02:35:34 +0000 Jesse Barnes <jbarnes@virtuousgeek.org> =
wrote:
>
> On Mon, 18 Jan 2010 22:24:44 +0100 "Rafael J. Wysocki" <rjw@sisk.pl> wrot=
e:
> >=20
> > Thanks a lot, this is the right fix IMO.
> >=20
> > Jesse, do you want me to resend the patch with this fix included or
> > are you going to take the Stephens patch to your tree?
>=20
> I'll pull in Stephen's fix, thanks.

OK, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__19_Jan_2010_14_19_17_+1100_MVlRBOyVdlYuGQS/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktVJLUACgkQjjKRsyhoI8w1wQCfcoX112hanrAUfKvKRqbfz8hU
8w0AnjYi//D5Du2+Yji8KqX0yc4nvz8F
=RTVN
-----END PGP SIGNATURE-----

--Signature=_Tue__19_Jan_2010_14_19_17_+1100_MVlRBOyVdlYuGQS/--
