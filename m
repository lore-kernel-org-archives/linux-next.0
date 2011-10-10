From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH -next] usb gadget: fix langwell_udc.c build error
Date: Mon, 10 Oct 2011 08:10:01 +0300
Message-ID: <20111010050959.GA30935@legolas.emea.dhcp.ti.com>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au>
 <4E8F67C6.5020603@xenotime.net>
 <20111008100326.GA24633@legolas.emea.dhcp.ti.com>
 <4E91DF00.8060107@xenotime.net>
 <20111009223638.GA29776@legolas.emea.dhcp.ti.com>
 <4E9228CA.1060904@xenotime.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E9228CA.1060904-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 09, 2011 at 04:05:46PM -0700, Randy Dunlap wrote:
> On 10/09/11 15:36, Felipe Balbi wrote:
> > git log --pretty=3Doneline -S'lpm_device_speed' HEAD --	\
> > 	drivers/usb/gadget/langwell_udc.c
>=20
> e538dfdae85244fd2c4231725d82cc1f1bc4942c usb: Provide usb_speed_string() =
function

Aha, now I know why, that went straight througth Greg.

Greg, can you pick this patch ? It's clearly needed. Meanwhile, I'll
cherry-pick that commit from your tree and apply Randy's fix too.

Here's my ack for $SUBJECT:

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

--=20
balbi

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOkn4nAAoJEAv8Txj19kN1NpMH/1N4iNiL/LLh+qBIwemM9kqC
0uga5Hd609oxBkD6qCSLBj6QDJ+ekvCNIFvRC/10izJCeoTQ7ioIlDJpMJFMRNFD
Y6ncYkUPTSBQc8Y+SEYJuMIVozPglKQpBp4POO5hwe1j5edsW4gPkL37g9rsSvs8
dn0u7DuPupReeHC+P8X4T39EiwJr9jssFe+zvuOLfM3nWvVA45SR5AfqpuCuZTco
4cPD/KSUFjXK6rFSjUlPNFFltOkxq1GSy3LLz+Z6y0oUh8q+lqZAFNG4tmIW4fxu
rBw7TEHHBTpOZ5hffMFI0/H/QePEcQDmILyM2zSC+gClwgns1D7kR+QT6o++KB8=
=e5UV
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
