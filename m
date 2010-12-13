From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for December 10 (x86 nmi_watchdog)
Date: Tue, 14 Dec 2010 10:08:49 +1100
Message-ID: <20101214100849.52374e25.sfr@canb.auug.org.au>
References: <20101210135746.0cf6cbcd.sfr@canb.auug.org.au>
	<20101210092533.4f426650.randy.dunlap@oracle.com>
	<AANLkTi=bw8EcxEffbVV6CfdAPVdM25ZMxHqAmz1yukq3@mail.gmail.com>
	<20101213144434.GB18577@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Dec_2010_10_08_49_+1100_+Y7oVtVCrm7LUoQM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60125 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750825Ab0LMXI6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Dec 2010 18:08:58 -0500
In-Reply-To: <20101213144434.GB18577@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Rakib Mullick <rakib.mullick@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org

--Signature=_Tue__14_Dec_2010_10_08_49_+1100_+Y7oVtVCrm7LUoQM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Don,

On Mon, 13 Dec 2010 09:44:34 -0500 Don Zickus <dzickus@redhat.com> wrote:
>
> On Sun, Dec 12, 2010 at 11:27:02AM +0600, Rakib Mullick wrote:
> > On Fri, Dec 10, 2010 at 11:25 PM, Randy Dunlap <randy.dunlap@oracle.com=
> wrote:
> > > On Fri, 10 Dec 2010 13:57:46 +1100 Stephen Rothwell wrote:
> > >
> > >> Hi all,
> > >>
> > >> Changes since 20101209:
> > >
> > >
> > > arch/x86/kernel/apic/hw_nmi.c:28: error: redefinition of 'touch_nmi_w=
atchdog'
> > > include/linux/nmi.h:22: note: previous definition of 'touch_nmi_watch=
dog' was here
>=20
> I'll have to checkout that branch to see what got merged.  I thought I
> fixed all these.  Is there a config I can use to duplicate these?

Randy's original post had the config attached.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Dec_2010_10_08_49_+1100_+Y7oVtVCrm7LUoQM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNBqeBAAoJEDMEi1NhKgbsdBQH/3BZZrNUUd6k6bPVU0ZBKC7O
sgwreDECjXleRQ4ouM0/qdPM/gkoKdmq9Un1cIcEMXGMAx40CJrEKD6pfhDUYl4i
u6BTf0l7onv8JU2OvN3iYeQoJr7oe0IG+sGkf0/XoChEp4OkMNtyx2/E25+mLUKK
akkRvBiUihQ6LON0/hIsXkHwJuBkL9jiWqEnRNjt90avqRSing3UQjSL3i0tBmgY
ypGZa9loMW6jiJ10vVoOejyCzF45J5DztUsxkujF/FDw9ymvrgsLuSmNPQuBb0Bv
YbhqkQ5q+iBUt4bNwG9grG8H7dWlPEzhjpRfOA7TJD8hi5BxK70MW5fSevNCtDk=
=vmON
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Dec_2010_10_08_49_+1100_+Y7oVtVCrm7LUoQM--
