From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: new maintainer/tree for the libata tree?
Date: Tue, 28 Aug 2018 12:43:58 +1000
Message-ID: <20180828124358.13c711e4@canb.auug.org.au>
References: <20180828071944.02b13db4@canb.auug.org.au>
        <27ef8afc-c490-5984-5a18-1ee5ce51d556@kernel.dk>
        <20180828112851.19c64e80@canb.auug.org.au>
        <0ee8b9e0-1576-c8c1-ed22-dd76a8d378ba@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A0L5Tn_dm2+JzCSqsus.SAe"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ee8b9e0-1576-c8c1-ed22-dd76a8d378ba@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/A0L5Tn_dm2+JzCSqsus.SAe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Mon, 27 Aug 2018 19:30:09 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> On 8/27/18 7:28 PM, Stephen Rothwell wrote:
> >=20
> > On Mon, 27 Aug 2018 19:15:23 -0600 Jens Axboe <axboe@kernel.dk> wrote: =
=20
> >>
> >> On 8/27/18 3:20 PM, Stephen Rothwell wrote: =20
> >>>
> >>> I noticed the maintaership change - so what shuld I sues for linux-ne=
xt,
> >>> now?
> >>>
> >>> I currently have
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata.git#for-next =
  =20
> >>
> >> I'll merge into my for-next branch on the block tree, I'm don't plan on
> >> doing separate trees for this, just separate branches. And everything I
> >> queue up for the next version will end up in my for-next branch. =20
> >=20
> > So I'll just drop the libata tree from linux-next, then? =20
>=20
> Yeah, that should be all that's needed.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/A0L5Tn_dm2+JzCSqsus.SAe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluEtu4ACgkQAVBC80lX
0GzplQf+Lc4ut/p37idKk+2DV8mZKPpFWIOcTLm2uyuUvYUthWA8viO6B5TOAhYG
7T2snyGZG5G/Ygdivp6h46iMS4bpoh2jw9wi5MgkVG8C4w6PGcKUaZzjtXU3QQ3E
vSPqrNOTLrXQ+iYYiveSrrrkMKn6+yeakmG/ThWcFpcZhFmcKgFYghOLch12/KI+
sMbjdks/SQRa1PR7gxPjOgUAPYL7fmrmSEXJs7EdC6Hf7jkBTc12l7I+mgFjdT3V
Htl8gbI55PaMDWy67ZovZuBYEvIO+wdSO50SKiXWro+ZGHFXm/RbEyavo50CGuIj
nhT2ULKeEuo4b/NS5YLCGCEnyEMa+A==
=xxXv
-----END PGP SIGNATURE-----

--Sig_/A0L5Tn_dm2+JzCSqsus.SAe--
