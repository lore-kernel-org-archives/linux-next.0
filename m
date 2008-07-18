From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: import of ttydev tree
Date: Fri, 18 Jul 2008 19:58:45 +1000
Message-ID: <20080718195845.278106a9.sfr@canb.auug.org.au>
References: <20080718163004.98ddc67b.sfr@canb.auug.org.au>
	<20080718095802.65e0fbdd@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_19_58_45_+1000_t9hZtE7X8Lt++r5l"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38718 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754506AbYGRJ6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 05:58:51 -0400
In-Reply-To: <20080718095802.65e0fbdd@the-village.bc.nu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_19_58_45_+1000_t9hZtE7X8Lt++r5l
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Fri, 18 Jul 2008 09:58:02 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
>
> On Fri, 18 Jul 2008 16:30:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Not sure what went wrong, but the second last of your patches
> > "tty-synclink_gt-dma-fill" would not apply today, so I left the last two
> > out.  I started with commit a3cf859321486f69506326146ab3e2fd15c05c3f and
> > used "git quiltimport" to apply them.  The end of the log looks like th=
is:
>=20
> Strange. I'll redo those. It was objecting to the import of Paul's
> patches for some reason so I fixed them up by hand before importing.
> Dunno why it didn't apply with git quiltimport as it does apply with
> stgit... fun fun

As I said, it probably didn't like that fact that quiltimport had fixed
up some trailing whitespace in a previous patch on the same file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_19_58_45_+1000_t9hZtE7X8Lt++r5l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAaVUACgkQjjKRsyhoI8xSygCaAwAltF3GdTZMW/U+xqn5D2ND
hp0An06l+uOqX4R05oDBHPgGRh5CP0ZL
=nD//
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_19_58_45_+1000_t9hZtE7X8Lt++r5l--
