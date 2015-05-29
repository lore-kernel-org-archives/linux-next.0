From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: build failure after merge of the usb-gadget tree
Date: Fri, 29 May 2015 10:19:21 -0500
Message-ID: <20150529151921.GD2026@saruman.tx.rr.com>
References: <20150529183213.7db39b9b@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:47631 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161065AbbE2PVc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 11:21:32 -0400
Content-Disposition: inline
In-Reply-To: <20150529183213.7db39b9b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2015 at 06:32:13PM +1000, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> After merging the usb-gadget tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/module.h:17:0,
>                  from drivers/usb/gadget/legacy/nokia.c:19:
> drivers/usb/gadget/legacy/nokia.c: In function '__check_num_buffers':
> drivers/usb/gadget/function/f_mass_storage.h:51:34: error: 'fsg_num_buffe=
rs' undeclared (first use in this function)
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>                                   ^
> include/linux/moduleparam.h:387:68: note: in definition of macro '__param=
_check'
>   static inline type __always_unused *__check_##name(void) { return(p); }
>                                                                     ^
> include/linux/moduleparam.h:145:2: note: in expansion of macro 'param_che=
ck_uint'
>   param_check_##type(name, &(value));       \
>   ^
> drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of =
macro 'module_param_named'
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>   ^
> drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_=
MODULE_PARAMETERS'
>  FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
>  ^
> drivers/usb/gadget/function/f_mass_storage.h:51:34: note: each undeclared=
 identifier is reported only once for each function it appears in
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>                                   ^
> include/linux/moduleparam.h:387:68: note: in definition of macro '__param=
_check'
>   static inline type __always_unused *__check_##name(void) { return(p); }
>                                                                     ^
> include/linux/moduleparam.h:145:2: note: in expansion of macro 'param_che=
ck_uint'
>   param_check_##type(name, &(value));       \
>   ^
> drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of =
macro 'module_param_named'
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>   ^
> drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_=
MODULE_PARAMETERS'
>  FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
>  ^
> drivers/usb/gadget/legacy/nokia.c: At top level:
> drivers/usb/gadget/function/f_mass_storage.h:51:34: error: 'fsg_num_buffe=
rs' undeclared here (not in a function)
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>                                   ^
> include/linux/moduleparam.h:224:22: note: in definition of macro '__modul=
e_param_call'
>       level, flags, { arg } }
>                       ^
> include/linux/moduleparam.h:146:2: note: in expansion of macro 'module_pa=
ram_cb'
>   module_param_cb(name, &param_ops_##type, &value, perm);     \
>   ^
> drivers/usb/gadget/function/f_mass_storage.h:51:2: note: in expansion of =
macro 'module_param_named'
>   module_param_named(num_buffers, fsg_num_buffers, uint, S_IRUGO);\
>   ^
> drivers/usb/gadget/legacy/nokia.c:45:1: note: in expansion of macro 'FSG_=
MODULE_PARAMETERS'
>  FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
>  ^
>=20
> Caused by commit e4f8ef7b0770 ("usb: gadget: nokia: Add mass storage
> driver to g_nokia").
>=20
> I have used the usb-gadget tree from next-20150528 for today.

I'll drop that patch, thanks

--=20
balbi

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVaIN5AAoJEIaOsuA1yqREYZgP/RHlZVJwo/jYrP6gLZ1i5+NB
iRDCJqpmaHXBkPzQUt2/wleh04xVX4qvfQWNl5pO6y5H4j+2gCCuIavI3lEVzetS
0MWtqi+1Ny6SEsCWW2cx5Qd/clnAYXRogPeheoVceGWeP1yijC7xolG5Ohv8jCht
GUQzb4BrwpqJCvV0yuSjRoKOWLNQiz9MyDLo/Q1ml1rV3Fjo019i4JwDI+0LPz4d
dl+Yui7MIkGS6Fcn2Rh3X0+Wfh6OzZS8FDaBk692W5tx/ShbEA2DP4TKkOmt0uXh
lOKla2DFdDJY2R0bQiNaF3HnZgFrxX1zpQdq5abOafHHjEcOEJRgOanWImV4S00X
DlN7U7kFbJbDZw8qs/Je/YrLzB1Rm3CdGEcxlBhXikTirKc/S59oZJC1WdQHGrtt
c1i0qz31RL9EHb7skgNImW1bxBWeX1IjDpJnX1pO4CUcUM5U5P+Fin1JFSHXz1uq
zTODkGsI53k3djWLswle3c23wxtuYRZPN4ay7OCUF+b3JHzBIiFg2m7WUWMvTfrn
laa/mPfEYWsup3Llzht/sKVdOIVoQCnU/1dwmnq/eeY15ACoT0iPZ5WGx37Hcm/p
PesTSdtZrroJXisv18CVIkeJ3FVi45hs/p8weEPow8uREzYQYUOwqLixSgtMZw7a
TfTELL7wwHTdp3A3uYFb
=1eWM
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
