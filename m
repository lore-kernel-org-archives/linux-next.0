From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Fri, 12 Oct 2018 13:43:57 +1100
Message-ID: <20181012134357.51bfd026@canb.auug.org.au>
References: <E1g9cV0-0008Sg-4U@optimist> <20181008211109.GA4440@sirena.org.uk>
 <20181008213018.GL6490@zn.tnic>
 <20181010152704.337ee630@canb.auug.org.au>
 <20181010043358.GA5924@zn.tnic>
 <20181012103758.51c7befa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5396619773502560043=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181012103758.51c7befa@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@suse.de>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--===============5396619773502560043==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5vkRJEBFK5kxiOE2NL8VWI1"; protocol="application/pgp-signature"

--Sig_/5vkRJEBFK5kxiOE2NL8VWI1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Fri, 12 Oct 2018 10:37:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 10 Oct 2018 06:33:59 +0200 Borislav Petkov <bp@suse.de> wrote:
> >
> > On Wed, Oct 10, 2018 at 03:27:04PM +1100, Stephen Rothwell wrote: =20
> > > I have added that to linux-next today (pending this or something else
> > > turning up in the tip tree).   =20
> >=20
> > I have queued a fixed version in the meantime:
> >=20
> > https://git.kernel.org/tip/9d94e8b1d4f94a3c4cee5ad11a1be460cd070839 =20
>=20
> OK, I will use that until it turns up in the tip auto-latest branch.

It turns out that I can't use that since it is mostly already in the
tip tree as commit

  3a387c6d96e6 ("x86/kaslr, ACPI/NUMA: Fix KASLR build error")

So I will stick with my incremental patch for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/5vkRJEBFK5kxiOE2NL8VWI1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvACm0ACgkQAVBC80lX
0GyWWgf/couMNv/h9alt+wFovTHkdBH1vxtpDCKeJgpXN9oaekVf3+oQZaS2a5Og
dTLjH7w2/XvVWv2W79huCHbLPdR7DUlSQTOjHUX1qJc1THBVq5NYwg5ZeRUahOyX
QK+TuiDBboMPYNg9/XEyOJdWCbg/5zOlVJMQtWa5h4qJDydvieaymhRDe8C9Zb9F
d3cYzmktULhwobQp63Ba/H3aomaCiBVA2QCWMEeEVmvIXdif5NIUu2yMFtnFZVKy
fqCsJrX4xQiqjkWMiwrCZP7Cptl/Q+UTx2dkffqWAOU2DkcrK/9RC26BFYsiMJse
GfDe91JvrLRor58PadplUkfgOJY7Gg==
=wT7P
-----END PGP SIGNATURE-----

--Sig_/5vkRJEBFK5kxiOE2NL8VWI1--


--===============5396619773502560043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5396619773502560043==--
