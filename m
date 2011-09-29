From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Sept 29 (kvm)
Date: Fri, 30 Sep 2011 08:58:10 +1000
Message-ID: <20110930085810.11bc8e2e38e1400a8b0b4cec@canb.auug.org.au>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au>
	<4E84CC00.8090702@xenotime.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Sep_2011_08_58_10_+1000_/obfP//LqmsQJq94"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:58361 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab1I2W6R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 18:58:17 -0400
In-Reply-To: <4E84CC00.8090702@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>

--Signature=_Fri__30_Sep_2011_08_58_10_+1000_/obfP//LqmsQJq94
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Just cc'ing the kvm guys ]

On Thu, 29 Sep 2011 12:50:24 -0700 Randy Dunlap <rdunlap@xenotime.net> wrot=
e:
>
> On 09/28/11 23:57, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > The linux-next tree is now available from
> > git://github.com/sfrothwell/linux-next.git as a temporary measure while
> > the kernel.org servers are unavailable.
>=20
>=20
> kvm build on i386 says:
>=20
> ERROR: "__udivdi3" [arch/x86/kvm/kvm.ko] undefined!
>=20
> which is used in somewhere in start_apic_timer()  (probably the divide :).
>=20
>=20
> --=20
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code =
***
>=20


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Sep_2011_08_58_10_+1000_/obfP//LqmsQJq94
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOhPgCAAoJEDMEi1NhKgbsKJwH/R28tBVZ4MDMr3O/MSG+q8WS
pVnFsTa9IFG26stxObEBhJ+lCphGTFZr/Qhz10mVvMYopcaeeNXabq6Y9AcGO5gL
ckBs8vhXPzp2MCdjHJWtFr6ZSq4O1hP0quBgHlErLrg9U7XEFR5jWfZR8GP53x6I
jU44Go4edvrZOSdK81ZO48epcDAsrYOImE6UZzBcdoW8ntPq+DOWkHT1bCUFqPyv
3iK8rbr2msCwEa/gojK5G1Y/pRTXY5PtSekA8BAcMybWbAV/gCEsn2zfGa63gNei
LEqMrYRyLEz571sbDc6WgcZ01YjuqkWAlvzImTSxzABAiG2wyLVQGAs/dw2GlTg=
=vzPC
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Sep_2011_08_58_10_+1000_/obfP//LqmsQJq94--
