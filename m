From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: sched tree build warning
Date: Mon, 22 Dec 2008 18:19:32 +1100
Message-ID: <20081222181932.5dd9514e.sfr@canb.auug.org.au>
References: <20081222152247.b934ed5b.sfr@canb.auug.org.au>
	<b040c32a0812212249p45aba306tbb68a960b79cd0ee@mail.gmail.com>
	<20081222070426.GD29160@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__22_Dec_2008_18_19_32_+1100_4Q4__FkMvma39mGE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33593 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751370AbYLVHTn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 02:19:43 -0500
In-Reply-To: <20081222070426.GD29160@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Ken Chen <kenchen@google.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Mon__22_Dec_2008_18_19_32_+1100_4Q4__FkMvma39mGE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 22 Dec 2008 08:04:26 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> the real solution is something like the patch below. That generates new=20
> (but harmless) warnings within the powerpc code but those are a one-off=20
> effort to fix and are not reoccuring.
>=20
> Cc:-ed Paul Mackerras - Paul, am i missing anything?

You mean besides the patches that fix all those warnings? :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Dec_2008_18_19_32_+1100_4Q4__FkMvma39mGE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklPP4QACgkQjjKRsyhoI8wXogCbBSpsPPIdXZ1DEx4oQWIpd/7c
rtgAn0dW80R0d+F91MRh8/CKM4sz3+kc
=2Nqz
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Dec_2008_18_19_32_+1100_4Q4__FkMvma39mGE--
