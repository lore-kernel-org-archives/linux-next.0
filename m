From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: i2c build failure
Date: Thu, 15 May 2008 20:39:57 +1000
Message-ID: <20080515203957.6a35eb19.sfr@canb.auug.org.au>
References: <20080515121241.1ede11be.sfr@canb.auug.org.au>
	<20080515102215.62378c4f@hyperion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_May_2008_20_39_57_+1000_Rcx80B9U+3t8EtEx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42162 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751962AbYEOKkF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 06:40:05 -0400
In-Reply-To: <20080515102215.62378c4f@hyperion.delvare>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>

--Signature=_Thu__15_May_2008_20_39_57_+1000_Rcx80B9U+3t8EtEx
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Thu, 15 May 2008 10:22:15 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>
> Thanks for the notification and sorry for the trouble. I thought that I
> knew about all users of struct i2c_board_info and that they were all
> converted by now but obviously not. I didn't know that fsl_soc.c had
> been partly forked for the pasemi platform.

This is one of the reasons linux-next is here.  However, grep -R (or git
grep) is you friend. :-)


> Stephen, I'm updating my i2c tree now and you'll get this patch under
> the name i2c-02-switch-pasemi-to-module-aliases.patch. Note that this
> will cause one more conflict with Greg KH driver tree, which you can
> solve the same way you solved the other ones.

OK, that will be in linux-next tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_May_2008_20_39_57_+1000_Rcx80B9U+3t8EtEx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFILBMCTgG2atn1QN8RAmDWAKCKb/NnFXfVrdPFPRu+/5jOYhOicgCeK+1l
yIuTYAuwsxINbqQEFF3PdaU=
=ZRjb
-----END PGP SIGNATURE-----

--Signature=_Thu__15_May_2008_20_39_57_+1000_Rcx80B9U+3t8EtEx--
