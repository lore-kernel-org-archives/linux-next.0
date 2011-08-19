From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next blackfin builds
Date: Fri, 19 Aug 2011 14:10:29 +1000
Message-ID: <20110819141029.a3fb1e4b889547e93299e027@canb.auug.org.au>
References: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
	<20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au>
	<20110817162248.6e2af136fe580e5ab4994b0b@canb.auug.org.au>
	<CAMjpGUe=xYNuFm9pKp6vSLavE4Vpki25qkrC406cH7MAXBzRrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__19_Aug_2011_14_10_29_+1000_twM6Adi1u2WYR8+3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44810 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750703Ab1HSEKk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Aug 2011 00:10:40 -0400
In-Reply-To: <CAMjpGUe=xYNuFm9pKp6vSLavE4Vpki25qkrC406cH7MAXBzRrQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

--Signature=_Fri__19_Aug_2011_14_10_29_+1000_twM6Adi1u2WYR8+3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, 18 Aug 2011 23:16:23 -0400 Mike Frysinger <vapier.adi@gmail.com> wr=
ote:
>
> On Wed, Aug 17, 2011 at 02:22, Stephen Rothwell wrote:
> > I have found a compiler (gcc 4.4.0, no libc) that seem to work.
>=20
> where did you find it so that i can poke it directly ?

Someone here at IBM built it for me from the unaltered gcc/binutils sources.

> > see the results here: http://kisskb.ellerman.id.au/kisskb/branch/9/ .
> > Of course, some of the build errors may be due to the tool chain, I gue=
ss.
>=20
> awesome.  let's see ...
>=20
> this error is due to your u-boot mkimage being too old.  this has been
> fixed for quite a while now (at least since the 2010.03 release):
> /usr/local/bin/mkimage: For XIP, the entry point must be the load addr + =
64
>=20
> this errors out for the same reason ... your local mkimage needs to be up=
graded.
>   UIMAGE  arch/blackfin/boot/vmImage.lzma
> Invalid Compression Type - valid names are: none, bzip2, gzip

OK, upgraded mkimage to 2011.03 (the version in Debian testing).

> this is a known bug in the common musb code.  not much we can do atm.
> ERROR: "dma_controller_destroy" [drivers/usb/musb/musb_hdrc.ko] undefined!
> ERROR: "dma_controller_create" [drivers/usb/musb/musb_hdrc.ko] undefined!

OK.

> this is interesting ... probably a bug in the Blackfin linker you're
> using.  what version is it ?
> /tmp/cccKdWmY.s:908: Error: pcrel too far BFD_RELOC_BFIN_10

GNU ld (GNU Binutils) 2.19.1

> probably need an updated gcc, although it might not be in a release yet.
> cc1: error: -mcpu=3Dbf518-0.1 has invalid silicon revision

OK.  We may try building gcc 4.5.x and binutils 2.21.x

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__19_Aug_2011_14_10_29_+1000_twM6Adi1u2WYR8+3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOTeI1AAoJEDMEi1NhKgbsF0gH/0kWUUMlSRAVf39Te2aMFl/R
yBJWzm7WvFXr1RkneP7qR2KjZd+HIPoM8v2cf+f4PaO5zFzixjZ57pkj/1nwdDQk
GSnCeNAxTtSP/Ap+kUaiD6HY4Cv580/bV219/kPvoHmelX/E5h704nkcCK8bXK20
JGt3pTY3byYdglCqUHTZ6QNxCLy4PKqVjmhGEuAo36IMKeLRfEa5spuCmAL/LcbC
gbLX5ddNeNaO+zboEDMQQkYN1mFimxdPsd/2vnyCFL4F3WEE8e/QI25AAqnkdtWF
Q0mRSB7Dz5Qqb0WFaDoxN5aPBIzv+tVvlIjSEtir4dRKBG0WB9Kfcy6LdkM0KiI=
=U0wP
-----END PGP SIGNATURE-----

--Signature=_Fri__19_Aug_2011_14_10_29_+1000_twM6Adi1u2WYR8+3--
