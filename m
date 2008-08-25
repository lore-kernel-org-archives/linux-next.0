From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the crypto tree
Date: Mon, 25 Aug 2008 16:53:00 +1000
Message-ID: <20080825165300.eb30cddf.sfr@canb.auug.org.au>
References: <20080807133525.8901e2ef.sfr@canb.auug.org.au>
	<20080825164418.3e74cad0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Aug_2008_16_53_00_+1000_u9=65JjNvnUO_UP_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37719 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751622AbYHYGxJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:53:09 -0400
In-Reply-To: <20080825164418.3e74cad0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Austin Zhang <austin.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Mon__25_Aug_2008_16_53_00_+1000_u9=65JjNvnUO_UP_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Aug 2008 16:44:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Maybe the X86_FEATURE_XMM4_2 bits could also be added in the x86 tree.

Thinking about this, I am not sure that would achieve anything unless the
other two bit definitions were also added to the crypto tree.  So
probably not worth it (though it wouldn't hurt).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Aug_2008_16_53_00_+1000_u9=65JjNvnUO_UP_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiyVswACgkQjjKRsyhoI8x+EgCfV9f49Y/KmgqJ8+uU1pRg4Zw3
e/cAoIYgJs8yHu+Ul7O3g/vuXdEYDzgZ
=NWHG
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Aug_2008_16_53_00_+1000_u9=65JjNvnUO_UP_--
