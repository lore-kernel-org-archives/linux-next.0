From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Wed, 19 Dec 2018 16:37:13 +1100
Message-ID: <20181219163713.15af8a5f@canb.auug.org.au>
References: <20181129112428.45287471@canb.auug.org.au>
        <20181219134243.674b80b7@canb.auug.org.au>
        <32bfba42-ca52-57e1-d5d9-ce1d90bafc8a@embeddedor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cXh1re/hznPqt8Bu/nNLVNr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <32bfba42-ca52-57e1-d5d9-ce1d90bafc8a@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Kees Cook <keescook@google.com>, Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>
List-Id: linux-next.vger.kernel.org

--Sig_/cXh1re/hznPqt8Bu/nNLVNr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Tue, 18 Dec 2018 21:07:06 -0600 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>
> On 12/18/18 8:42 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Thu, 29 Nov 2018 11:24:28 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> After merging the net-next tree, today's linux-next build
> >> (x86_64_allmodconfig) produced this warning:
> >>
> >> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: In function 'run_xdp=
':
> >> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:324:3: warning: this =
statement may fall through [-Wimplicit-fallthrough=3D]
> >>     bpf_warn_invalid_xdp_action(xdp_act);
> >>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:325:2: note: here
> >>    case XDP_ABORTED:
> >>    ^~~~
> >> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:326:3: warning: this =
statement may fall through [-Wimplicit-fallthrough=3D]
> >>     trace_xdp_exception(priv->net_dev, xdp_prog, xdp_act);
> >>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:327:2: note: here
> >>    case XDP_DROP:
> >>    ^~~~
> >>
> >> Introduced by commit
> >>
> >>    7e273a8ebdd3 ("dpaa2-eth: Add basic XDP support")
> >>
> >> This due to my use of -Wimplicit-fallthrough.  This is new code.  The
> >> warning can be suppressed by adding a comment like /* fall through */
> >> at the appropriate places to indicate that the fallthrough is intended=
. =20
> >=20
> > I am still seeing these warnings.
> >  =20
>=20
> That's weird. I don't see them anymore in next-20181218.
>=20
> They were fixed by this commit: c1cb11bcbd09f5f027cbc7fadddab169714948df

My mistake (patter mismatch :-)), there are very similar warnings in
drivers/net/veth.c which are older.  Someone could fix those if they
wanted to :-)

drivers/net/veth.c: In function 'veth_xdp_rcv_one':
drivers/net/veth.c:542:4: warning: this statement may fall through [-Wimpli=
cit-fallthrough=3D]
    bpf_warn_invalid_xdp_action(act);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/veth.c:543:3: note: here
   case XDP_ABORTED:
   ^~~~
drivers/net/veth.c: In function 'veth_xdp_rcv_skb':
drivers/net/veth.c:663:3: warning: this statement may fall through [-Wimpli=
cit-fallthrough=3D]
   bpf_warn_invalid_xdp_action(act);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/veth.c:664:2: note: here
  case XDP_ABORTED:
  ^~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/cXh1re/hznPqt8Bu/nNLVNr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwZ2QkACgkQAVBC80lX
0GzqSQgAlpifdRTKtvLcMvIl1gSlNyRh92r8U0grnmSHxD3NXxUe0shMt9het7zK
+wnncswGl88QCi4bX70Z8k106HMFMeweoqVsWlp4goul84UJ/p1kPeBq2OabWApl
WXLaB9UNzLNBAJ7U4leVdUb7OSt0QHHditWCqczW/8Eb/6YNnn/laHRWWTBngpVC
olxDplgwDAJW5scqF3KHiqui73xT5vY9E9bFPCO+Xl7uMbnZuIGjv4DmxVdCJ02h
A8sCx9rqrqq6l4Md+K9x7aX/t+BQ3PucELMoFSFHFTF8noMBeZfTT78/8281AKps
b0z13778m4yWIZif2mg8mi/g+L2TZw==
=YZiP
-----END PGP SIGNATURE-----

--Sig_/cXh1re/hznPqt8Bu/nNLVNr--
