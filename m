From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the arm-soc tree
Date: Wed, 5 Oct 2011 21:51:33 +1100
Message-ID: <20111005215133.14e6afa68aae2527f5a5c090@canb.auug.org.au>
References: <20111004165030.ab90295677251fc80bf843a2@canb.auug.org.au>
	<20111004152611.GC29994@kroah.com>
	<20111005085237.GB24472@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__5_Oct_2011_21_51_33_+1100_ZP=cCNrD/sM8qGcU"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111005085237.GB24472@legolas.emea.dhcp.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__5_Oct_2011_21_51_33_+1100_ZP=cCNrD/sM8qGcU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 5 Oct 2011 11:52:39 +0300 Felipe Balbi <balbi@ti.com> wrote:
>
> looks ok, but I don't see omap_phy_internal.o being added anywhere.
> Maybe this hunk doesn't show...

Yeah, it didn't conflict, so there is a

obj-y                                   +=3D omap_phy_internal.o

line a bit further down.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Oct_2011_21_51_33_+1100_ZP=cCNrD/sM8qGcU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOjDa1AAoJEECxmPOUX5FEhm4P/A2LBD0YeZYOtvRWOYLl/ZuS
x/tD4nAWUf/7vW8wejifd+yVPw4Spzodw1CL7xRjGM+GM1dEN8jFHrZCreHHqNuP
ivnXRtB9xqB1A0LwCvcVQwSMWGShzV8swVpZZJTrotSYrPOnEro3nfj4PJbJBqb5
GjkmFaFQQrC7ILW4vIlR1IPEe/fSKZk2SbqqXlxrCyOCurlt+xCZgScfu0YdvWBx
SnFtGyfG/MjnRYFq8bYsfpmF/MNvxoOkj5xzvjQ7kHTymWDx4VhaTWL7b0DQ6no/
o6zvWaejF7tldldN+P/6Qpo4jsynFHiH6VIt3QrSN3EUv9j6MQCZxDpqK8AOjd7p
ZpuhTQztq4vbmlfB2UJtBk6Ofxro9KHFdWZlfeoBQC36w79mR2WNt57ySHnzu6YS
WxadSs73VE0njqbVf55sAJz9pZ7S1RcVLkw1C8OynuwMpEnJAW3iogQ8YEJlRTQr
z0ROT9wm1/k+z5DHo6UPn5W7OBfxnpyFu2VGgS0A0teetPXepEvvr6ykVZ92Rw59
NI//7Mk6qrBVe5b26XJo2iJ+7OyFWRME7iVJdx6Tig6S9zu+I+m773EGM3+euQQ4
kdu5tPa/F29ODJrR6/+CUKWsRPTBLH2WCa20rHD9vZcCrOdcEXm9cljHpSUm/ZUQ
EbTu90wEArFkUyLyqMgF
=27v5
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Oct_2011_21_51_33_+1100_ZP=cCNrD/sM8qGcU--
