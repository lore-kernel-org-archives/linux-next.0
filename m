From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the
 driver-core.current tree
Date: Fri, 30 Apr 2010 10:01:02 +1000
Message-ID: <20100430100102.0f08c9ad.sfr@canb.auug.org.au>
References: <20100430093534.9fc6ab8f.sfr@canb.auug.org.au>
	<20100429234347.GA16141@kroah.com>
	<20100429234525.GB16141@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Apr_2010_10_01_02_+1000_oc5yBUf2UNTuEjN_"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100429234525.GB16141@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Tomas Winkler <tomas.winkler@intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__30_Apr_2010_10_01_02_+1000_oc5yBUf2UNTuEjN_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 29 Apr 2010 16:45:25 -0700 Greg KH <greg@kroah.com> wrote:
>
> > Thanks, I've fixed this up, the release call should not have 'const'
> > on it as it is going to touch the pointer passed to it :)
>=20
> And it's now pushed out in my tree.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Apr_2010_10_01_02_+1000_oc5yBUf2UNTuEjN_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvaHb4ACgkQjjKRsyhoI8xtOgCgvh2evjACoaxxT+9gtQb9bsdM
PPAAnizzkQvx35ogbIp9YUIR9lwvfrmL
=o2Ye
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Apr_2010_10_01_02_+1000_oc5yBUf2UNTuEjN_--
