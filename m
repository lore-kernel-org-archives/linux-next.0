From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pidfd tree with Linus' tree
Date: Wed, 22 May 2019 18:05:24 +1000
Message-ID: <20190522180524.4e751614@canb.auug.org.au>
References: <20190522110115.7350be3e@canb.auug.org.au>
        <20190522055235.GC13702@kroah.com>
        <20190522174725.6bfd51bd@canb.auug.org.au>
        <CEB120FD-547A-4D92-92AE-43E6AF8E767B@brauner.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dMu_ynlLlbctLrd4FLVcZ.g"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CEB120FD-547A-4D92-92AE-43E6AF8E767B@brauner.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Brauner <christian@brauner.io>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

--Sig_/dMu_ynlLlbctLrd4FLVcZ.g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Wed, 22 May 2019 09:55:00 +0200 Christian Brauner <christian@brauner.io>=
 wrote:
>
> On May 22, 2019 9:48:33 AM GMT+02:00, Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> >Hi Greg,
> >
> >On Wed, 22 May 2019 07:52:35 +0200 Greg Kroah-Hartman
> ><gregkh@linuxfoundation.org> wrote: =20
> >>
> >> Sorry, you are going to get a number of these types of minor =20
> >conflicts =20
> >> now.  That's the problem of touching thousands of files :( =20
> >
> >Yeah, I expected that one I saw the commits.  At least is is just after
> >-rc1, hopefully most maintainers will start their -next branches after
> >today :-) =20
>=20
> I can just rebase if that helps you out.

No need, those conflicts are now in my "git rerere" cache, so I
hopefully won;t have ot worry about them again.

--=20
Cheers,
Stephen Rothwell

--Sig_/dMu_ynlLlbctLrd4FLVcZ.g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzlAsQACgkQAVBC80lX
0GwKKAf/Vdk1+Zg9m6WG2lmqpxpqn+xy/BChQkXfXN5ruj7oAAtTHoGzrIAQQFPz
hLDIFxyEjZ+VIloEKY7TH4MYSvvRX3kO7I+TyWJsEtNMB1yH+Ko6DYIdnHXk1o1I
seWD+lypo2SUcYPbQuP770f3lKQeFrTtRjtTRoQL/iLDrriJTLn4jQAYOBhlVX6J
zppqWx0MU1f9JaFlYeoa9xSrNtsaq/rlf3p4le3mH0kjfsIG6HF1Wk3/+SKyOabP
VpIi25Vyd1kAbrVn2wa/Uaez0yxFbPoHbuQYz4AgMCQ/AGNNaBzPvZKEa46O4Vl9
hyVSHBP5nzzGBlis1XSbJgXRYQf4IA==
=S8wa
-----END PGP SIGNATURE-----

--Sig_/dMu_ynlLlbctLrd4FLVcZ.g--
