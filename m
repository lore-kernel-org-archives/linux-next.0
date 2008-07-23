From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 72/79] sysdev: Pass the attribute to the low level
 sysdev show/store function
Date: Wed, 23 Jul 2008 13:04:35 +1000
Message-ID: <20080723130435.7a79f7e4.sfr@canb.auug.org.au>
References: <20080722051805.GA17373@suse.de>
	<1216703983-21448-72-git-send-email-gregkh@suse.de>
	<20080722134045.7f09ff29.akpm@linux-foundation.org>
	<20080722204939.GA3028@suse.de>
	<20080722140301.2a334f8c.akpm@linux-foundation.org>
	<20080722211919.GA5669@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Jul_2008_13_04_35_+1000_YCz+Wr1+opZnLdCH"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754604AbYGWDEx@vger.kernel.org>
In-Reply-To: <20080722211919.GA5669@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, andi@firstfloor.org, ak@linux.intel.com, mingo@elte.hu, tiwai@suse.de, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__23_Jul_2008_13_04_35_+1000_YCz+Wr1+opZnLdCH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 22 Jul 2008 14:19:19 -0700 Greg KH <gregkh@suse.de> wrote:
>
> Andi any thoughts?

The patch
(sysdev-pass-the-attribute-to-the-low-level-sysdev-show-store-function.patc=
h)
has existed in the driver-core part of linux-next since July 4, but the
kernel/sched.c part only got added yesterday.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Jul_2008_13_04_35_+1000_YCz+Wr1+opZnLdCH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiGn8MACgkQjjKRsyhoI8xeRwCghlA1czotSe+Ap51YfX7OVAnU
5ncAnjrSIAeVXjNJT51nSKYrpRR88sfN
=YxNb
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Jul_2008_13_04_35_+1000_YCz+Wr1+opZnLdCH--
