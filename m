From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: x86 tree build failure
Date: Wed, 18 Jun 2008 15:04:52 +1000
Message-ID: <20080618150452.43ea6993.sfr@canb.auug.org.au>
References: <20080617134615.d70be9f6.sfr@canb.auug.org.au>
	<20080617055816.GA13556@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__18_Jun_2008_15_04_52_+1000_aufnVh299T0C7KP4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32789 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752368AbYFRFFA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Jun 2008 01:05:00 -0400
In-Reply-To: <20080617055816.GA13556@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

--Signature=_Wed__18_Jun_2008_15_04_52_+1000_aufnVh299T0C7KP4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Tue, 17 Jun 2008 07:58:16 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> hm, i guess you mean you went back to the previous version?

No, I dropped it completely, but I will try to remember that idea for
next time.  It is back today and seems ok again.  Thanks for applying
those patches.

> which makes that acpi build bug not trigger in allmodconfig. But this=20
> just obscures the bug.

So do the acpi guys need a push?  Can I help in that?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__18_Jun_2008_15_04_52_+1000_aufnVh299T0C7KP4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhYl3QACgkQTgG2atn1QN8O9wCggZMzxCRX5Ng/WI6qvAuI9nHd
QbAAn3u2W5vLfcB/+ZlCorkRZweF717q
=pN65
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Jun_2008_15_04_52_+1000_aufnVh299T0C7KP4--
