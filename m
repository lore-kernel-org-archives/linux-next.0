From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Thu, 8 May 2014 08:02:51 +1000
Message-ID: <20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
	<536A9CF2.90906@infradead.org>
	<CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__8_May_2014_08_02_51_+1000_7wYU+1asbzduWkH2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47494 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751939AbaEGWDD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 May 2014 18:03:03 -0400
In-Reply-To: <CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>

--Signature=_Thu__8_May_2014_08_02_51_+1000_7wYU+1asbzduWkH2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Wed, 7 May 2014 14:45:59 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>
> On 5/7/14, Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > I was away for one week.  Did I miss some new instructions about
> > building linux-next?
> >
> > I get a thousands of messages like these:
> >
> > WARNING: "system_wq" [drivers/misc/bh1770glc.ko] has no CRC!
> > WARNING: "__wake_up" [drivers/misc/bh1770glc.ko] has no CRC!
> > WARNING: "sysfs_notify" [drivers/misc/bh1770glc.ko] has no CRC!
> > WARNING: "kfree" [drivers/misc/bh1770glc.ko] has no CRC!
>=20
> I don't recognized those, but
>=20
> >
> >
> > Also there hundreds of messages like these:
> >
> > ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
> > ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
> > ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
> > ipack.c:(.init.text+0x0): multiple definition of `init_module'
> > mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
> > mcb-core.c:(.text+0x3fb): multiple definition of `init_module'
>=20
> I had to hardwire CONFIG_LTO_MENU=3Dn to avoid lots of linker complaints
> about standard library things (strcmp, etc.).  This is on a Ubuntu
> 14.04 system.

The CONFIG_LTO... stuff has been in linux-next since (at least)
next-20140408, so maybe something else has impacted on it?  Or have you
had to do the above since then?  If so, what config, what arch?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__8_May_2014_08_02_51_+1000_7wYU+1asbzduWkH2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTaq2VAAoJEMDTa8Ir7ZwV5YYP/18kHinQ9ZXT65d5p1RmaG5w
pbWTmCqZIH4KpaXg5VDMA+MzUy4t58aGfzT51LTXu1An9gOG8zzCKFM//rTAlGtt
UNyYDCNEOc0IHn4I8Vyh3Hn64uj5Fyx29aDHjB/jaIAuwiYxEe7kCnr0W+O+S7x6
JnYXGvtP/YHe09aCzGSWCCjghdmv6OErKheo6e/79n7viFRWJ7Emz9Cxygi2BCOr
cNSRLlt/IOVBIK0Ws9CesYhw4B75lGKnDjCa3FiK+RTt8xdvyH/5caK5rVN5f9Pt
ZiuShGXOBctdk3aqyeFzAcddLiznQ5oh/OY5d+4maTjZcarFEl/4U5h+XkmC40Jr
C/m4jc2oR9DPjb/0B5yv9T3KtZD3JFPqxaNbyjNKDo6jVcow9ANrZMjjAeDu+fq7
HbWBWldEZF2xqwsCAKED243EVFGD2Bzzx12Lo/8u2h4aLLkfoeA90gzzAQTAxH2W
ts8Ns+YZ61k2R1BhgNJAAMuf6NirnNj5wSGkvvOmKVHycIiJQww4S/qgvKKAmfuW
siVDz87rIdiKfQw16+2LYoWxcMM2LByWqBXIoGtrM+d55rEp8VaAdsklsA6QKjSh
p5QCi54PsuIATGjqEkBKlTxdXxY8uX1kDDiSfIFZSzv7Aqdztmucpc7MN3mVo7+D
FhHcoY/YwQM7uRVQXZ3i
=5XvE
-----END PGP SIGNATURE-----

--Signature=_Thu__8_May_2014_08_02_51_+1000_7wYU+1asbzduWkH2--
