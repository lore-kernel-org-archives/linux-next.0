From: Felipe Balbi <balbi@kernel.org>
Subject: Re: linux-next: Tree for Dec 14 (usb/dwc3)
Date: Fri, 15 Dec 2017 10:17:17 +0200
Message-ID: <87wp1ol81e.fsf@linux.intel.com>
References: <20171214180617.5bbff2ec@canb.auug.org.au> <9d07169a-c00d-e302-f373-f4431899941b@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:54028 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753312AbdLOISN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Dec 2017 03:18:13 -0500
In-Reply-To: <9d07169a-c00d-e302-f373-f4431899941b@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Randy Dunlap <rdunlap@infradead.org> writes:
> On 12/13/2017 11:06 PM, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> Changes since 20171213:
>>=20
>
> on i386:
>
> ERROR: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3.ko] undefined!
> ERROR: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3.ko] undefined!
>
>
>
> I can send the randconfig file is you need it.

please do. write/readl tracepoints haven't changed in ages :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlozhQ8ACgkQzL64meEa
mQYkQBAA3eA0GpElRFxt0iSMnL2oWHrDtwZ1aMd8ZE8LOjmMonuEW9pEAvVnv77O
JrYsc3Bwv3je3K4rLM0UB28dU3TdYPG5ATDwKBkI4qvPkzgkuW23aXmQ2xz0ULIM
o2MDFhRIVY3k7a/w1VFMWlU2NwQS+43ZxBawPwyRgOXQkJ5/LR/jGjiFpErwua+t
aK36hro0KotOiAq+YNZR+qiMZH4X6cuMySCTM2gn+L3haFT1NRahvBVox7dJjMuu
EFzWNivTFJEZuMBNCYuCLmVkYZM+XSfdj6OEio1QP+ic6EtCxemeyIz1N7GPzRBh
aiV9VQ7qa50wGq+8VcIC+3xYrQdSyrTtD6en8WTeybmjOsB2+I2yyS7wun7f/05r
UIkXonNGbucHZZhyoUDNUv39KWnhJ5NtpXVOAYQKkHviisFSXUXdNjGRSHoOBb6t
EkX7lvQYQSTOMr6f2Kb1RN3vLylFeaEpJc9mPNdU4p8JsBlC82vjJ+NMsXi79bz1
c3Buc9jPROPEDNSaLv/ZpfQoO01P6qzV8QKMxjJU/E1AKp909j1soW/w2m7debnK
xvQ3DYM7UdH8YfsNQpNSML9Qq5dLcFQvGg5W0xC2WN+cCKTmoixpp9gUid9bDREy
cyOH9Cfoiuo/BKooHVVkbrZiLdbTpU9YzyZ7A+/kG8BE+bp38Wk=
=gRZm
-----END PGP SIGNATURE-----
--=-=-=--
