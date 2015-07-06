From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 7 Jul 2015 07:34:56 +1000
Message-ID: <20150707073456.2a6014b2@canb.auug.org.au>
References: <20150706100858.649532b5@canb.auug.org.au>
	<559A32F5.2060408@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EdNa902j/1F9j5vIUUZzImG"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42109 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755025AbbGFVfF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Jul 2015 17:35:05 -0400
In-Reply-To: <559A32F5.2060408@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/EdNa902j/1F9j5vIUUZzImG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Mon, 6 Jul 2015 09:49:09 +0200 Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 06/07/2015 02:08, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the tip tree got a conflict in:
> >=20
> > kernel/sched/core.c
> >=20
> > between commit:
> >=20
> > 2ecd9d29abb1 ("sched, preempt_notifier: separate notifier
> > registration from static_key inc/dec")
> >=20
> > from Linus' tree and commit:
> >=20
> > 6efde1d3716b ("sched/preempt, kvm: Fix KVM preempt_notifier
> > usage")
> >=20
> > from the tip tree.
> >=20
> > I fixed it up (maybe - see below) and can carry the fix as
> > necessary (no action is required).
>=20
> The commit from the tip tree is obsolete.

And has now been removed from the tip tree, so we won't see that
conflict today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EdNa902j/1F9j5vIUUZzImG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVmvSFAAoJEMDTa8Ir7ZwVnKwP/2i/sVm1zuhmSIRlIdM2FmpA
h+UIZ5kPj9ZPZS7+1Su2+W8Unps7rKwaoCi4P9KzT043IcRZYEC0AXh/AdPIaAaA
YIIN6g1cSQr5ZCC4Hb5fXU3RVk6AmNBkMQKcORKJTxwxKiK6uQf/XIxF2tYO/8LY
SZLdlsK77w3JjJtBO88+WhE7UFtZ8rAgm2qcOkJMRdaB1D0I8uqstYI2o7oGdVDR
CANU4QkES7yFU4vR2I+8tt5QZ63YR+gydg8U1d7EP660P6dPLPziBf8aIG1YXAuN
ibc5pRKcw4nl/VUyokwAXJskIg0PymhB8ZY3xrvFNGHjI70TFqEFbA57gBR/YSlz
//vhQR27JP/IPbdcVpvqwK965zLq7ywh0OwobOjt6GciRkwKBmtKs1QfD9ZzKryQ
23F2EP+TXvxSAkKHTd6gbCtIQKhFjr8ku+/9fqC/H1DVm5hU+d81gZqx84qkusbk
2jbs7gx9p+8LI7OK9Gupu95WFZ/5fSxYpBMKu+4CWqRc9i+00NJdztyyLrLzgvIV
6gIBJkbHfSQ8GzPF248fIq0BSL6bls5NJNXbflQx6y2uAL88LRKOPa2P6JKSyDDF
mw+XRxOoWZaFls5mZIvJGssiWdxBnP33dGBb0H6jAMtNbXEcDJBtkGaQ3BJzJSmr
H9BSodXq5X/rvsmLD1/p
=j13Q
-----END PGP SIGNATURE-----

--Sig_/EdNa902j/1F9j5vIUUZzImG--
