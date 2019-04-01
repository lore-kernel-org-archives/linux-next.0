From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: Tree for Mar 27 (sunxi clk & mfd)
Date: Mon, 1 Apr 2019 14:33:37 +0200
Message-ID: <20190401123337.2nhppxyl5nzyofub@flea>
References: <20190327145020.2fff97b8@canb.auug.org.au>
 <641a04ec-e2e6-4263-e77e-d272058c18c9@infradead.org>
 <20190328095036.734adbba@canb.auug.org.au>
 <20190401102732.GD4187@dell>
 <20190401223624.6b4f8c42@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3wrik5kehvbal5cg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401223624.6b4f8c42@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org


--3wrik5kehvbal5cg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 01, 2019 at 10:36:24PM +1100, Stephen Rothwell wrote:
> Hi Lee,
>
> On Mon, 1 Apr 2019 11:27:32 +0100 Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 28 Mar 2019, Stephen Rothwell wrote:
> >
> > > I reported that a while ago (x86_64 allmodconfig after the merge of the
> > > sunxi tree).  Apparently there is a fix out there but it hasn't been
> > > applied yet.
> >
> > Where is the fix to be applied?  SUNXI or MFD?
>
> Well, I only see the problem after applying the sunxi tree (which
> happens before I merge the mfd tree).
>
> Maxime said:
>
> > I've just sent a patch fixing this:
> > https://lore.kernel.org/lkml/20190322091650.5189-1-maxime.ripard@bootlin.com/
>
> So maybe if you (Lee) acked it, Maxime could apply it to the sunxi
> tree, so we keep the breakage and fix together?  Assuming that the fix
> is acceptable (and works :-)).

That works for me

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3wrik5kehvbal5cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKIFIQAKCRDj7w1vZxhR
xXKRAQCpxIqp1fLVXeCSBx3FmBK9+OAs+wyf2wIlAg5J1lWT8QD+LuJc1TxgLuST
yeXkfytOMPlqdqzMMRww9t9ltlvUcgM=
=EIgP
-----END PGP SIGNATURE-----

--3wrik5kehvbal5cg--
