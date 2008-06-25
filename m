From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Thu, 26 Jun 2008 01:59:18 +1000
Message-ID: <20080626015918.71a6b4d7.sfr@canb.auug.org.au>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au>
	<20080625071508.GA20454@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Jun_2008_01_59_18_+1000_xtxztqgHMROEtqUq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58491 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751321AbYFYP7b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 11:59:31 -0400
In-Reply-To: <20080625071508.GA20454@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Thu__26_Jun_2008_01_59_18_+1000_xtxztqgHMROEtqUq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Jun 2008 09:15:08 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> I suspect we cannot really eliminate this particular conflict because=20
> the latter change is a (much welcome!) infrastructure cleanup in all=20
> things ACPI, the former is an early init refactoring/cleanup that=20
> depends on a whole lot of other (non-ACPI) changes in tip/x86/*. It's
> too late in .26-rc cycle to push the infrastructure cleanup upstream, so
> i suspect we have to live with this conflict for a while.

No problem.  How long can it be until all this is merged in Linus' tree
anyway? :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Jun_2008_01_59_18_+1000_xtxztqgHMROEtqUq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhia1YACgkQTgG2atn1QN9aiACeIZb+57Y175D/1K6W+ZLZWusY
WowAnjKU9oCRfc1jPtspvKJyuiFvOgzj
=cUpT
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Jun_2008_01_59_18_+1000_xtxztqgHMROEtqUq--
