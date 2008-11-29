From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Sat, 29 Nov 2008 11:48:46 +1100
Message-ID: <20081129114846.4b97cd96.sfr@canb.auug.org.au>
References: <20081128160339.23fa014f.sfr@canb.auug.org.au>
	<49308976.7010206@chelsio.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__29_Nov_2008_11_48_46_+1100_+ipySnAce4scVcx/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44003 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752030AbYK2AtL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 19:49:11 -0500
In-Reply-To: <49308976.7010206@chelsio.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Divy Le Ray <divy@chelsio.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jaswinder Singh <jaswinder@infradead.org>

--Signature=_Sat__29_Nov_2008_11_48_46_+1100_+ipySnAce4scVcx/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Divy,

On Fri, 28 Nov 2008 16:14:46 -0800 Divy Le Ray <divy@chelsio.com> wrote:
>
> I created this situation and apologize for it. I should have sent the
> patch to the firmware tree maintainer.

Its not a big issue - the conflict has a very obvious resolution and "git
rerere" remembers it for me.  As far as I know, there is no "firmware
maintainer" - David just has a git tree that was used when the initial
conversions were done.  Some of those have not yet been finalised and so
are still in his tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__29_Nov_2008_11_48_46_+1100_+ipySnAce4scVcx/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkwkW4ACgkQjjKRsyhoI8wwNQCfZ1ked87hxSkzYOgQZCMf/KDF
kFgAoJSqcLtWpUDkh5DuMQE2BIJk6qfK
=9po4
-----END PGP SIGNATURE-----

--Signature=_Sat__29_Nov_2008_11_48_46_+1100_+ipySnAce4scVcx/--
