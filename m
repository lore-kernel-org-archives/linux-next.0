From: Felix Schnizlein <fschnizlein@suse.com>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 14:36:08 +0200
Message-ID: <20170926123608.5azf7xqwobsnkc7b@angmar>
References: <20170919141557.03ffb2a7@canb.auug.org.au>
 <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org>
 <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
 <alpine.DEB.2.20.1709260930220.1941@nanos>
 <20170926081841.GA937@kroah.com>
 <alpine.DEB.2.20.1709261217480.1941@nanos>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="55y73r6ijdq5byxz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:51618 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935918AbdIZMgL (ORCPT
        <rfc822;groupwise-linux-next@vger.kernel.org:0:0>);
        Tue, 26 Sep 2017 08:36:11 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1709261217480.1941@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Borislav Petkov <bp@alien8.de>


--55y73r6ijdq5byxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 26.09.17, Thomas Gleixner wrote:
> On Tue, 26 Sep 2017, Greg Kroah-Hartman wrote:
> > On Tue, Sep 26, 2017 at 09:40:00AM +0200, Thomas Gleixner wrote:
> > > On Mon, 25 Sep 2017, Randy Dunlap wrote:
> > > > On 09/19/17 08:54, Randy Dunlap wrote:
> > > > > On 09/18/17 21:15, Stephen Rothwell wrote:
> > > > >> Hi all,
> > > > >>
> > > > >> Changes since 20170918:
> > > > >>
> > > > >> Linus' tree still had its build failure for which I reverted a c=
ommit.
> > > > >>
> > > > >=20
> > > > > on i386:
> > > > >=20
> > > > > ../arch/x86/kernel/cpuinfo.c: In function 'cpuinfo_flags':
> > >=20
> > > Where does this file come from? Random driver code added to arch/x86?=
 This
> > > was neither acked nor reviewed by any x86 maintainer and just slapped=
 into
> > > arch/x86/kernel/ without spending a split second of brain to find the=
 spot
> > > where it actually belongs. It's not rocket science to figure that out.
> >=20
> > It is arch specific, cpu specific to be specific :)
> >=20
> > Where would you have this file go instead?
>=20
> arch/x86/kernel/cpu/
>=20
> That's where all the CPU related stuff including the proc/cpuinfo code
> lives. It's not rocket science to figure that out.
Yes this is my fault. I will fix this.
>=20
> > And these patches were posted many times, Felix, you did cc: the arch
> > maintainers, right?  I don't have access to my archives at the moment...
I send all my patches via:
git send-email --to linux-kernel@vger.kernel.org --cc x86@kernel.org --cc g=
regkh@linuxfoundation.org --cc trenn@suse.com v4*.patch

Did I miss something?
>=20
> I have the following mails related to this in my direct inbox archive,
> i.e. where I was CC'ed and exactly the same amount in my full LKML archiv=
e:
>=20
> http://lkml.kernel.org/r/20170614150410.GA15806@kroah.com
> http://lkml.kernel.org/r/20170802160420.GA18507@kroah.com
> http://lkml.kernel.org/r/20170802164621.43ckgv2vieudvifc@angmar
> http://lkml.kernel.org/r/20170802174725.GB2333@kroah.com
> http://lkml.kernel.org/r/59824864020000EE001C9890@smtp.nue.novell.com
> http://lkml.kernel.org/r/20170828152906.GA2810@kroah.com
> http://lkml.kernel.org/r/20170828153642.GA29792@kroah.com
> http://lkml.kernel.org/r/20170906134531.GB11779@kroah.com
>=20
> All of these mails were completely out of context, i.e. the stuff was nev=
er
> posted to LKML at all. I got them because you added x86@kernel.org when
> replying.
>=20
> And all what I could see from your replies was:
>=20
> >  arch/Kconfig                                       |  3 ++
> >  drivers/base/Makefile                              |  1 +
> >  drivers/base/cpuinfo.c                             | 48 ++++++++++++++=
++++++++
> >  include/linux/cpuhotplug.h                         |  1 +
> >  include/linux/cpuinfo.h                            | 43 ++++++++++++++=
+++++
>=20
> which I blissfully ignored.
>=20
> Thanks,
>=20
> 	tglx
>=20

--55y73r6ijdq5byxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEECcIUp05v5BnDsR6tT4AWTCp2DB0FAlnKSbMACgkQT4AWTCp2
DB2c8Af+PLGj592s3hc3vBAXE5lCo/nTKiYvvwkmU6FSThTCAnoofk/HjQkDTSAd
o9kFJOqCfXEEKqIVggdARpMW+pXN9qIByw9BTBiAzeLuBqwyUy4rhn7jY47+XQtf
3jRLe82sRai6LpJGDMdY5JYpBUcKaBG5DzD2A1Z/BPjqmILT+iyc4Rai9VowXJj1
yn/4L/AXKrIzjXPkAlSS84OWJhxERQ2jWqL3c83OtFnnXfp5eX6J36ITXAK9sSgd
gdueXkdVKucdK1HU844KH/zLvM9rWIZemvazA6zdYFuekkFjfxupkWz1UwAzt9kT
EAWeGwqKbL2IIsgz/gphwoHMULF4rg==
=I/2+
-----END PGP SIGNATURE-----

--55y73r6ijdq5byxz--
