From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Wed, 10 Oct 2018 15:27:04 +1100
Message-ID: <20181010152704.337ee630@canb.auug.org.au>
References: <E1g9cV0-0008Sg-4U@optimist> <20181008211109.GA4440@sirena.org.uk>
 <20181008213018.GL6490@zn.tnic>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3887791491816651729=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181008213018.GL6490@zn.tnic>
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

--===============3887791491816651729==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NcTdfi8nnH2l5vFIS/N=rPd"; protocol="application/pgp-signature"

--Sig_/NcTdfi8nnH2l5vFIS/N=rPd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Mon, 8 Oct 2018 23:30:18 +0200 Borislav Petkov <bp@suse.de> wrote:
>
> On Mon, Oct 08, 2018 at 10:11:09PM +0100, Mark Brown wrote:
> > caused by 3a387c6d96e69 (x86/kaslr, ACPI/NUMA: Fix KASLR build error)
> > which adds the inclusion unconditionally. =20
>=20
> This should fix it:
>=20
> ---
>  arch/x86/include/asm/kaslr.h | 2 --
>  drivers/acpi/numa.c          | 4 +++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/kaslr.h b/arch/x86/include/asm/kaslr.h
> index 95ef3fc01d12..db7ba2feb947 100644
> --- a/arch/x86/include/asm/kaslr.h
> +++ b/arch/x86/include/asm/kaslr.h
> @@ -6,10 +6,8 @@ unsigned long kaslr_get_random_long(const char *purpose);
> =20
>  #ifdef CONFIG_RANDOMIZE_MEMORY
>  void kernel_randomize_memory(void);
> -void kaslr_check_padding(void);
>  #else
>  static inline void kernel_randomize_memory(void) { }
> -static inline void kaslr_check_padding(void) { }
>  #endif /* CONFIG_RANDOMIZE_MEMORY */
> =20
>  #endif
> diff --git a/drivers/acpi/numa.c b/drivers/acpi/numa.c
> index 4408e37600ef..ba62004f4d86 100644
> --- a/drivers/acpi/numa.c
> +++ b/drivers/acpi/numa.c
> @@ -32,7 +32,6 @@
>  #include <linux/numa.h>
>  #include <linux/nodemask.h>
>  #include <linux/topology.h>
> -#include <asm/kaslr.h>
> =20
>  static nodemask_t nodes_found_map =3D NODE_MASK_NONE;
> =20
> @@ -433,6 +432,9 @@ acpi_table_parse_srat(enum acpi_srat_type id,
>  					    handler, max_entries);
>  }
> =20
> +/* To be overridden by architectures */
> +void __init __weak kaslr_check_padding(void) { }
> +
>  int __init acpi_numa_init(void)
>  {
>  	int cnt =3D 0;

I have added that to linux-next today (pending this or something else
turning up in the tip tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/NcTdfi8nnH2l5vFIS/N=rPd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu9f5gACgkQAVBC80lX
0GyANggAiycxUYtBoGC2I+ZlG0tuZ+viV72uqmJlOZLo9DWl5PlIrxGJBHNOdjxi
SCMeWa9ozKiWosWsoErcrIjZgNEgntETq/x1+MqyJH+5g+WKyRtvO5H+J0CCXagb
Eip9m7wSw0CiJkJOP1mYRhZ5b4krTyoXixLu2Xk51gpQ4eB+SdjTzrUIO1ZsZs/q
HiR6FnHgO7LliEIMLNFLcHyAIlzAHdhtX/ybZxk3DuwuNOG+sgAQ37UuxYfsw/Yh
tx60ZKlN9PwAk0nMymp3kFclM7dd6cGzsWJKT4ZbnGHek5jQRYv9rjuPepHEgWyK
lh6FlOB6ai+oIYJmQGosOFSTn1CVBw==
=4qW3
-----END PGP SIGNATURE-----

--Sig_/NcTdfi8nnH2l5vFIS/N=rPd--


--===============3887791491816651729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3887791491816651729==--
