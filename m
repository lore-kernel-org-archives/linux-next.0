From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the pm tree with the mfd tree
Date: Tue, 23 Aug 2011 12:58:25 +0300
Message-ID: <20110823095824.GI1341@legolas.emea.dhcp.ti.com>
References: <20110823135619.be8b64d2eec7cb78bc0160a8@canb.auug.org.au>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110823135619.be8b64d2eec7cb78bc0160a8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org


--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2011 at 01:56:19PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the pm tree got a conflict in
> drivers/mfd/twl4030-irq.c between commit 99efe0d4c992 ("mfd: Drop the
> twl4030-irq kthread") from the mfd tree and commit febab68efa45
> ("freezer: don't unnecessarily set PF_NOFREEZE explicitly") from the pm
> tree.
>=20
> The former dropped the code modified by the latter, so I did that.

if you guys need me to rebase on top of something else let me know

--=20
balbi

--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOU3nAAAoJEAv8Txj19kN1918H+wdJCBzZ8OzRvtcyQ/v8FFB4
KSozjcXTZo+LA8xGtoOGUIIE/X9eI8uXT+aBpXxNp0wkODWBzucJDXCcqdi/Z1BF
rHl6F7lycrQ5XI0Mj66jtpv54hIVmFAjo36a3hOFZllJ8uUb4TdJCEWCxbVuAjOu
AZ4fgGCQ18T9SM4PHCjCjoEjEAb3pY2nAu5Cm0wxJzazLl9jMDywqwQaBmdzYj3z
b8GPYnFlcXModsQKzy3hABmhHMLpMrkvMHWyisSMRA9IGVk/6NRGnWFVR+mTzlZB
QMcnIlOS28xa/2Mc9Kx67EXwQnGmUrCmBdkEydkiycrQlKSdV4MTx2dbdpeVYV4=
=wYOA
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
