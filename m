From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the netfilter-next
 tree
Date: Sat, 13 Apr 2019 14:05:46 +1000
Message-ID: <20190413140546.081e8196@canb.auug.org.au>
References: <20190412163720.576c6610@canb.auug.org.au>
        <20190412081527.vrym3czsko2lbqx7@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4OamxP1cmijJi54GAt=fr7A"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412081527.vrym3czsko2lbqx7@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4OamxP1cmijJi54GAt=fr7A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Fri, 12 Apr 2019 10:15:27 +0200 Florian Westphal <fw@strlen.de> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > After merging the netfilter tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >=20
> > In file included from /home/sfr/next/next/net/bridge/br_input.c:19:
> > /home/sfr/next/next/include/net/netfilter/nf_queue.h:16:23: error: fiel=
d 'state'
> >  has incomplete type
> >   struct nf_hook_state state;
> >                        ^~~~~
> > Caused by commit
> >=20
> >   971502d77faa ("bridge: netfilter: unroll NF_HOOK helper in bridge inp=
ut path")
> >=20
> > This build has CONFIG_NETFILTER not set.
> >=20
> > I have applied this patch for today: =20
>=20
> Can you submit this fix formally to netfilter-devel@vger.kernel.org?

Done.  Though I was hoping someone might come up with a better solution
(I don't particularly like conditional inclusions).

--=20
Cheers,
Stephen Rothwell

--Sig_/4OamxP1cmijJi54GAt=fr7A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyxYBoACgkQAVBC80lX
0GwJfQf8D6+u8aTCymnS8gu6KTZkkJfslYj7/ErHQ1JiBE9sv6DI2jsith2+JsYW
sFsR0d0XZOD7NB0yP/+nYO/0ujNqFR/brSHVtpSpLhNIiwFU+CC0kK/TfIWutsXd
IDiTIpZz5gmDFn1qycipn/+57BY2PlT/7ZcXvzZOxABduE6/zhU+X/Y1y2j6BfIA
HOiTKbaVamVrjZvVIoZxNhbns4Z4+ik7bUyjvTwX69DkkQS7Yfxp/Hz+GL6PcHm2
0gC+DVAThVvXCmTd4g9jJgZFTXDw1yA6TcadiEkj1XFbAKimjw5EeYwA0+4UXFl0
Eg1aWNwsKO27WiVYw5rAbi2JjX8lYQ==
=ejU3
-----END PGP SIGNATURE-----

--Sig_/4OamxP1cmijJi54GAt=fr7A--
