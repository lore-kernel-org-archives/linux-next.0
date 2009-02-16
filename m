From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: next Feb 16 build break [usb/host/fhci-*]
Date: Mon, 16 Feb 2009 21:13:10 +1100
Message-ID: <20090216211310.5513de1a.sfr@canb.auug.org.au>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au>
	<499929CB.2030004@in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Feb_2009_21_13_10_+1100_TqEd_u.lQ=vsPHs1"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <499929CB.2030004-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Sachin P. Sant" <sachinp-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>
Cc: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__16_Feb_2009_21_13_10_+1100_TqEd_u.lQ=vsPHs1
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Mon, 16 Feb 2009 14:24:35 +0530 "Sachin P. Sant" <sachinp-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org> wr=
ote:
>
> Feb 16 next tree randconfig build fails with
>=20
> drivers/usb/host/fhci-hcd.c: In function =E2=80=98of_fhci_probe=E2=80=99:
> drivers/usb/host/fhci-hcd.c:586: error: =E2=80=98struct device=E2=80=99 h=
as no member named =E2=80=98bus_id=E2=80=99
> drivers/usb/host/fhci-hcd.c:653: error: =E2=80=98struct device=E2=80=99 h=
as no member named =E2=80=98bus_id=E2=80=99
>=20
> drivers/usb/host/fhci-dbg.c: In function =E2=80=98fhci_dfs_create=E2=80=
=99:
> drivers/usb/host/fhci-dbg.c:111: error: =E2=80=98struct device=E2=80=99 h=
as no member named =E2=80=98bus_id=E2=80=99

That would be the driver-core removing bus_id from struct device.  cc's add=
ed.

fhci-hcd appeared between 2.6.29-rc2 and rc3.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Feb_2009_21_13_10_+1100_TqEd_u.lQ=vsPHs1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmZPDYACgkQjjKRsyhoI8xBIQCeNJrwIAuqISX0YJ/BoldOq4r1
yVAAn1Qs2FK31zyGV6jsFYprIr7jNoB2
=bsbL
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Feb_2009_21_13_10_+1100_TqEd_u.lQ=vsPHs1--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
