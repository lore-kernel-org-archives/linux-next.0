From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: mfd tree build failure
Date: Mon, 23 Nov 2009 15:03:46 +1100
Message-ID: <20091123150346.e3948feb.sfr@canb.auug.org.au>
References: <20091123144103.73b4d64c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_Nov_2009_15_03_46_+1100_XBWu2w3ErxsqzBhH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56208 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756157AbZKWEDw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2009 23:03:52 -0500
In-Reply-To: <20091123144103.73b4d64c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

--Signature=_Mon__23_Nov_2009_15_03_46_+1100_XBWu2w3ErxsqzBhH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Mon, 23 Nov 2009 14:41:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> ERROR: "irq_to_desc" [drivers/mfd/wm831x.ko] undefined!
> ERROR: "handle_edge_irq" [drivers/mfd/wm831x.ko] undefined!
> ERROR: "set_irq_chip_and_handler" [drivers/mfd/wm831x.ko] undefined!
> ERROR: "set_irq_noprobe" [drivers/mfd/wm831x.ko] undefined!
>=20
> Probably caused by commit 8fc686c7369173519817f0cfbb2df9a3671d5b8d ("mfd:
> Move WM831x to generic IRQ").  Maybe a Kconfig dependency is missing?

It actually looks as though set_irq_chip_and_handler (at least) is not
exported to modules.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_Nov_2009_15_03_46_+1100_XBWu2w3ErxsqzBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksKCaIACgkQjjKRsyhoI8x0jACeMLfWXCOBU+kMLNt1Rskq5AhI
LLMAn3MnRmrMS37NxoSFQUR7Khl+IQTx
=LmuJ
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Nov_2009_15_03_46_+1100_XBWu2w3ErxsqzBhH--
