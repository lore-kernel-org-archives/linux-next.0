From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Sat, 21 Feb 2009 09:58:21 +1100
Message-ID: <20090221095821.a4f1a4ed.sfr@canb.auug.org.au>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
	<20090220195911.3bff30fb.sfr@canb.auug.org.au>
	<20090220093734.GI24555@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__21_Feb_2009_09_58_21_+1100_FcJ4JSf0c2x5VS+y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40944 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754192AbZBTW6c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 17:58:32 -0500
In-Reply-To: <20090220093734.GI24555@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Sat__21_Feb_2009_09_58_21_+1100_FcJ4JSf0c2x5VS+y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Fri, 20 Feb 2009 10:37:34 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
> Hm, i'd love to eliminate the conflict, but it would either mean=20
> us to pull the slab tree into the tracing tree, or the other way=20
> around - and both have quite many items queued up to make this=20
> impractical.

That's OK, I expect to carry several conflict resolutions that only get
fixed during the next merge window.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__21_Feb_2009_09_58_21_+1100_FcJ4JSf0c2x5VS+y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmfNY0ACgkQjjKRsyhoI8z2dQCghhJXkv3+lS+8EcTW2pN6OYld
qxYAoIDSSGHAAaCaUUe8+tPkvTer6nJ5
=kK+4
-----END PGP SIGNATURE-----

--Signature=_Sat__21_Feb_2009_09_58_21_+1100_FcJ4JSf0c2x5VS+y--
