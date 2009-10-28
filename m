From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip tree build warning
Date: Wed, 28 Oct 2009 18:41:26 +1100
Message-ID: <20091028184126.b5f52d1b.sfr@canb.auug.org.au>
References: <20091028181443.50a09dbb.sfr@canb.auug.org.au>
	<20091028073145.GD6353@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Oct_2009_18_41_26_+1100_nMcfkEfWiViH034T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37425 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757471AbZJ1Hl3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 03:41:29 -0400
In-Reply-To: <20091028073145.GD6353@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__28_Oct_2009_18_41_26_+1100_nMcfkEfWiViH034T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Wed, 28 Oct 2009 08:31:45 +0100 Ingo Molnar <mingo@elte.hu> wrote:
>
>=20
> That commit is very simple. Are you sure it's not GCC bogosity?

That commit just produces the warning (since it introduced the
apic_noop.c file) and probably has nothing directly to do with the
problem (as I said).

The relevant part of apic.h is:

static inline physid_mask_t default_apicid_to_cpu_present(int phys_apicid)
{
        return physid_mask_of_physid(phys_apicid);
}

Where physid_mask_of_physid() manipulates a physid_mask_t which contains
an array of unsigned longs that is BITS_TO_LONGS(MAX_APICS) long and
MAX_APICS is 32768.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Oct_2009_18_41_26_+1100_nMcfkEfWiViH034T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrn9aYACgkQjjKRsyhoI8wtjgCfcyZDehlG3wpL7bo+SqvQoWHa
r1EAnAq9ndYr0oWuvn10YZ/cNF9WeYuV
=oSLC
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Oct_2009_18_41_26_+1100_nMcfkEfWiViH034T--
