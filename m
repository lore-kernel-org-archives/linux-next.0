From: Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: Tree for Mar 21 (usb/dwc3)
Date: Thu, 22 Mar 2018 10:20:25 +0200
Message-ID: <87efkcplme.fsf@linux.intel.com>
References: <20180321192511.2d40e4ce@canb.auug.org.au> <03aae369-e923-64e7-bac9-133ad0c8afc5@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <03aae369-e923-64e7-bac9-133ad0c8afc5@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Randy Dunlap <rdunlap@infradead.org> writes:
> On 03/21/2018 01:25 AM, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> Changes since 20180320:
>>=20
>
>
> on i386:
>
> ERROR: "__tracepoint_dwc3_gadget_generic_cmd" [drivers/usb/dwc3/dwc3.ko] =
undefined!
> ERROR: "__tracepoint_dwc3_ep_queue" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_free_request" [drivers/usb/dwc3/dwc3.ko] undefi=
ned!
> ERROR: "__tracepoint_dwc3_event" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_gadget_ep_enable" [drivers/usb/dwc3/dwc3.ko] un=
defined!
> ERROR: "__tracepoint_dwc3_alloc_request" [drivers/usb/dwc3/dwc3.ko] undef=
ined!
> ERROR: "__tracepoint_dwc3_prepare_trb" [drivers/usb/dwc3/dwc3.ko] undefin=
ed!
> ERROR: "__tracepoint_dwc3_complete_trb" [drivers/usb/dwc3/dwc3.ko] undefi=
ned!
> ERROR: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_gadget_ep_cmd" [drivers/usb/dwc3/dwc3.ko] undef=
ined!
> ERROR: "__tracepoint_dwc3_ctrl_req" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_ep_dequeue" [drivers/usb/dwc3/dwc3.ko] undefine=
d!
> ERROR: "__tracepoint_dwc3_gadget_giveback" [drivers/usb/dwc3/dwc3.ko] und=
efined!
> ERROR: "__tracepoint_dwc3_gadget_ep_disable" [drivers/usb/dwc3/dwc3.ko] u=
ndefined!

compiling here to test it out. Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlqzZ0kACgkQzL64meEa
mQYFhA/7BC1eIzCT/ba3St3AiKOJ2Gio3bayhJAzsuCesvMHTvwLVPSpAl9ZxRBc
ulUToTWIqag6dPmUmk0WJAlLyxYV5Cxt5AO7IYmGfIiWUPcxJkXbzxs6PopvU/X8
2qUciz4fK+jOdswb2HjzqRaoniFugD44JlY8PHGkx3wkpWhO5bpgGWapygQa37+l
GHEXvbQzZ6GgWGeAzzE3Kf0mN7RKP0wU3/H65Z1oNwQ2XnhY+jCy+QUmD4PmSL/K
0QUULZXWeEGwVqakAzln4SsQtoXs7EBdswFQAIkbS8LpahVhx0upUpkCvs1+SIwn
3ejuRae4wVYShMSc1hQ6Nh4zNEEPKjDwDyBSVwS0xN431zY22KVkbUHly1U5svtr
06m/MbzZ7O+eiTObxE749h0nd7dRKjaBBMb2RRBD1zjfUcy/A9IAO1jQAXlonF6l
e0Dpb6VNUBEEZ7LP9hISwJf8mVyopdIucbyvO+TIZxHQaBRKcGd8dNowuI61z4Qo
BV2Vts7Y+WORb6rSrWb1Ht/PjQObSIc5B5Qa7JJKTvwjHtMZi4zn8+pNsnh+R82U
idp0y6xOOISAy6Crpz04PtNzxYtKw8mBzQbXroB0AeowFgC8mXQwTH2nlTFoODDs
jodPu3R6ZMmira4QWZhO4Vf8k9pd4vqKNsw1FvwQrrnN3jrTTQ0=
=fKef
-----END PGP SIGNATURE-----
--=-=-=--
