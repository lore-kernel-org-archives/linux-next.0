From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH -next] usb/gadget: fix langwell printk formats
Date: Mon, 11 Jul 2011 09:30:13 +0300
Message-ID: <20110711063011.GB2680@legolas.emea.dhcp.ti.com>
References: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
 <20110710114127.ebb0d803.randy.dunlap@oracle.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110710114127.ebb0d803.randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 10, 2011 at 11:41:27AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>=20
> Fix printk formats to use %zu for size_t args, to fix these
> build warnings:
>=20
> drivers/usb/gadget/langwell_udc.c:3274: warning: format '%d' expects type=
 'int', but argument 4 has type 'size_t'
> drivers/usb/gadget/langwell_udc.c:3289: warning: format '%d' expects type=
 'int', but argument 4 has type 'size_t'
> drivers/usb/gadget/langwell_udc.c:3473: warning: format '%d' expects type=
 'int', but argument 4 has type 'size_t'
> drivers/usb/gadget/langwell_udc.c:3487: warning: format '%d' expects type=
 'int', but argument 4 has type 'size_t'
>=20
> Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

already on Greg's queue:

http://git1.kernel.org/?p=3Dlinux/kernel/git/gregkh/usb-2.6.git;a=3Dcommit;=
h=3Db9af9ea45a8dc1c3e7a98319bac90199807cc258

--=20
balbi

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOGphzAAoJEAv8Txj19kN1230IAJFW5kY3vb9erzst0SudAq7K
aB/fHjvC3Wpq7EtdHAmpXrtKoVZPzo5IBF8sBPbOQE1lwgiDHm2S1AXfnqnbbDyi
P/x7/UWVf1e9EXH3utRpXMiOJmfaG9lHR7GStQZtmx8KtFQMXmCzgqJLrfjfGDXa
4hBnLtrOCN7M06O3QsvpbK1FFqGth5XyH64POhVtsryX4TWaJhQRQYud8StRiAZc
AYCmhEeNUywsmmDco1hmnfi8bgbY5/fOo7JvJpCXK9/Q+aUh3gBEktQrBOHu6eDR
0HVlt09X9CQc5y9Q96scxgFDqgNpafbRgsm/0IQogZjWJDAwgAJyhZab4jYcRlw=
=mA7c
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
