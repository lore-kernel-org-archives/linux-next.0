From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: linux-next: sh build failure
Date: Fri, 20 Mar 2009 14:24:13 -0400
Message-ID: <20090320182413.GB1847@Krystal>
References: <20090320110602.86351a91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=_Krystal-2666-1237573453-0001-2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from toq9-srv.bellnexxia.net ([209.226.175.116]:53719 "EHLO
	toq9-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754258AbZCTTK3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 15:10:29 -0400
Received: from toip3.srvr.bell.ca ([209.226.175.86])
          by tomts5-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20090320182431.NCTZ1582.tomts5-srv.bellnexxia.net@toip3.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 14:24:31 -0400
Content-Disposition: inline
In-Reply-To: <20090320110602.86351a91.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>
Cc: Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_Krystal-2666-1237573453-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi Paul,
>=20
> Yesterday's linux-next build of sh allmodconfig failed like this:
>=20
> kernel/built-in.o: In function `disable_all_kprobes':
> kernel/kprobes.c:1382: undefined reference to `text_mutex'
> kernel/built-in.o: In function `__unregister_kprobe_top':
> kernel/kprobes.c:773: undefined reference to `text_mutex'
> kernel/built-in.o: In function `register_kprobe':
> kernel/kprobes.c:724: undefined reference to `text_mutex'
>=20
> Introduced by commit 4460fdad85becd569f11501ad5b91814814335ff ("tracing,
> Text Edit Lock - kprobes architecture independent support") from the
> tracing tree.  text_mutex is defined in mm/memory.c which is only built
> if CONFIG_MMU is defined, which is not true for sh allmodconfig.

Hrm, so we should move the text_mutex in a obj-y file. It's not clear to
me which of mm/Makefile would be the best choice :

obj-y                   :=3D bootmem.o filemap.o mempool.o oom_kill.o fadvi=
se.o \
                           maccess.o page_alloc.o page-writeback.o pdflush.=
o \
                           readahead.o swap.o truncate.o vmscan.o shmem.o \
                           prio_tree.o util.o mmzone.o vmstat.o backing-dev=
=2Eo \
                           page_isolation.o mm_init.o $(mmu-y)

Or maybe we add a new file, or put this in kernel/*.c. Suggestions ?

Mathieu

> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



--=20
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68

--=_Krystal-2666-1237573453-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFJw99NPyWo/juummgRAt77AJsGlAkRTKfmo4pGUS0MBBWz1kHPbQCgkY70
VuiJLRgf4eK6WXxDReDICp4=
=4H3J
-----END PGP SIGNATURE-----

--=_Krystal-2666-1237573453-0001-2--
