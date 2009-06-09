From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] nommu: Provide mmap_min_addr definition.
Date: Tue, 9 Jun 2009 20:03:18 +1000
Message-ID: <20090609200318.c5a23489.sfr@canb.auug.org.au>
References: <20090609084856.GA18528@linux-sh.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Jun_2009_20_03_18_+1000_n2IIRbFWMAN3mI67"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56747 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754557AbZFIKDZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 06:03:25 -0400
In-Reply-To: <20090609084856.GA18528@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Paul Mundt <lethal@linux-sh.org>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Tue__9_Jun_2009_20_03_18_+1000_n2IIRbFWMAN3mI67
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Tue, 9 Jun 2009 17:48:56 +0900 Paul Mundt <lethal@linux-sh.org> wrote:
>
> With the "security: use mmap_min_addr indepedently of security models"
> change, mmap_min_addr is used in common areas, which susbsequently blows
> up the nommu build. This stubs in the definition in the nommu case as
> well.

I have reverted the above commit
(e0a94c2a63f2644826069044649669b5e7ca75d3 "security: use mmap_min_addr
indepedently of security models") from linux-next for today.  Hopefully
you will apply Paul's patch (or something similar) to the
security-testing tree for tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Jun_2009_20_03_18_+1000_n2IIRbFWMAN3mI67
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkouM2YACgkQjjKRsyhoI8y4fQCcC5BdOaXjHP8APNnhxrUA6QZh
SvoAn3cdq/C4kEwQfS5FXgK7v840TlFt
=rdkP
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Jun_2009_20_03_18_+1000_n2IIRbFWMAN3mI67--
