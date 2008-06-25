From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 26 Jun 2008 01:23:19 +1000
Message-ID: <20080626012319.cb312fc3.sfr@canb.auug.org.au>
References: <20080625162739.5add4f55.sfr@canb.auug.org.au>
	<200806250838.40212.borntraeger@de.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_01_23_19_+1000_Vl_PmdJbZ/Ura5vz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40397 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498AbYFYPXd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 11:23:33 -0400
In-Reply-To: <200806250838.40212.borntraeger@de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>, Paul Mackerras <paulus@samba.org>

--Signature=_Thu__26_Jun_2008_01_23_19_+1000_Vl_PmdJbZ/Ura5vz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Wed, 25 Jun 2008 08:38:40 +0200 Christian Borntraeger <borntraeger@de.ib=
m.com> wrote:
>
> Am Mittwoch, 25. Juni 2008 schrieb Stephen Rothwell:
> > Hi Rusty,
> >=20
> > Today's linux-next merge of the rr tree got a conflict in
> > drivers/char/hvc_console.h between commit
> > 1c8950ff87de950a3b6ccfb26650fc0a56278836 ("[POWERPC] Make cpus_in_xmon
> > static and remove extern mess from hvc_console.c") from the powerpc tree
> > and commit c9a834016cfb2b0fb71392fddab4d80ab9f9d172 ("hvc_console: rewo=
rk
> > setup to replace irq functions with callbacks") from the rr tree.
> >=20
> > Just a matter of overlapping additions.
>=20
> Yes, it looks simple. What is the preferred way of solving such conflicts=
 in=20
> linux-next?

I just carry them ("git rerere" make that easy).  These are the sort of
conflicts that Linus will just fix up when he merges these trees in his
tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_01_23_19_+1000_Vl_PmdJbZ/Ura5vz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhiYucACgkQTgG2atn1QN9mEgCfbr3zc3uwOoklXVuh3MRSLfLN
kpQAn2sqg2g0O62z23STo5Z9zlBRe9jA
=gD7o
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_01_23_19_+1000_Vl_PmdJbZ/Ura5vz--
