From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Fri, 12 Oct 2018 10:37:58 +1100
Message-ID: <20181012103758.51c7befa@canb.auug.org.au>
References: <E1g9cV0-0008Sg-4U@optimist> <20181008211109.GA4440@sirena.org.uk>
 <20181008213018.GL6490@zn.tnic>
 <20181010152704.337ee630@canb.auug.org.au>
 <20181010043358.GA5924@zn.tnic>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860299239751766978=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181010043358.GA5924@zn.tnic>
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

--===============1860299239751766978==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p7y5g6AhHWs++1gOW_J.Z11"; protocol="application/pgp-signature"

--Sig_/p7y5g6AhHWs++1gOW_J.Z11
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Wed, 10 Oct 2018 06:33:59 +0200 Borislav Petkov <bp@suse.de> wrote:
>
> On Wed, Oct 10, 2018 at 03:27:04PM +1100, Stephen Rothwell wrote:
> > I have added that to linux-next today (pending this or something else
> > turning up in the tip tree). =20
>=20
> I have queued a fixed version in the meantime:
>=20
> https://git.kernel.org/tip/9d94e8b1d4f94a3c4cee5ad11a1be460cd070839

OK, I will use that until it turns up in the tip auto-latest branch.
--=20
Cheers,
Stephen Rothwell

--Sig_/p7y5g6AhHWs++1gOW_J.Z11
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/3tYACgkQAVBC80lX
0GxMhAf/Ycd9J/YtqoDRSW8nmfB25Zl+d/zN2Kv93fYiqqHHhkwYDcY/2Mi4byNP
osiMsSNl0H4G6C2l+MX+MB/evh6VgPXyFb/7RDyZRAVKT8OkwyyDzpK0/P4QkFlL
d/YUigm4lppWbxDQ4ojHtQmcR1F3PUTReK+gZSmJRQVwj3EvuwR83Y1HPMkKRVKe
Cq2iVMfEw8CN85+2D/pvjwofHntBHn9B3p0rtOw93QvlkcD1eeEKd3wy5X1VdjcW
bJ0aYeXk3G3VLfW/KLNaZ+KW9vKpwaKi1qE2ZrIds2fNEDzLsIrRCoLLtVzZTXQr
4muoCrlKUEQGNyIgflMman7mk/wrQA==
=O7be
-----END PGP SIGNATURE-----

--Sig_/p7y5g6AhHWs++1gOW_J.Z11--


--===============1860299239751766978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1860299239751766978==--
