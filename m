From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: import of ttydev tree
Date: Fri, 18 Jul 2008 16:30:04 +1000
Message-ID: <20080718163004.98ddc67b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_16_30_04_+1000_l.GAdN8/TmRl=g32"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36281 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752307AbYGRGaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 02:30:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__18_Jul_2008_16_30_04_+1000_l.GAdN8/TmRl=g32
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Not sure what went wrong, but the second last of your patches
"tty-synclink_gt-dma-fill" would not apply today, so I left the last two
out.  I started with commit a3cf859321486f69506326146ab3e2fd15c05c3f and
used "git quiltimport" to apply them.  The end of the log looks like this:

tty-n_hdlc-nonblock
Context reduced to (1/1) to apply fragment at 679
tty-synclink_gt-bitorder
tty-synclink_gt-dma-fill
error: patch failed: drivers/char/synclink_gt.c:3457
error: drivers/char/synclink_gt.c: patch does not apply

Actually looking further, this is probably the problem:

synclink-use-tty_port
.dotest/patch:67: trailing whitespace.
                if ( (info->port.flags & ASYNC_CHECK_CD) &&=20
.dotest/patch:86: trailing whitespace.
                if ( (info->port.flags & ASYNC_CTS_FLOW) &&=20
.dotest/patch:125: space before tab in indent.
        struct tty_struct *tty =3D info->port.tty;
.dotest/patch:153: space before tab in indent.
                if (capable(CAP_SYS_ADMIN) && info->port.tty)
.dotest/patch:186: space before tab in indent.
        if (!info->port.tty || info->port.tty->termios->c_cflag & HUPCL) {
warning: squelched 19 whitespace errors
warning: 24 lines add whitespace errors.

So, I guess the white space didn't match in the later patches. I'll see
if I can force it for now, but it would be nice if that trailing white
space was not there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_16_30_04_+1000_l.GAdN8/TmRl=g32
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAOGwACgkQjjKRsyhoI8yI4wCeIPDTHHiF6OZEMoEkWFqT/R1Y
a8wAn3IF79QH8TM9VxgXGJ207rV3zuGw
=sXgG
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_16_30_04_+1000_l.GAdN8/TmRl=g32--
