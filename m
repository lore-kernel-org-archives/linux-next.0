From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: linux-next: manual merge of the tip tree with the
 crypto-current tree
Date: Fri, 09 Oct 2015 02:52:27 +0100
Message-ID: <1444355547.2956.288.camel@decadent.org.uk>
References: <20151009124700.46d8cf61@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-aphV7w4aSfGkGUrAnYPO"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151009124700.46d8cf61@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org


--=-aphV7w4aSfGkGUrAnYPO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-10-09 at 12:47 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/crypto/camellia_aesni_avx_glue.c
>=20
> between commit:
>=20
>   92b279070dd6 ("crypto: camellia_aesni_avx - Fix CPU feature checks")
>=20
> from the crypto-current tree and commit:
>=20
>   d91cab78133d ("x86/fpu: Rename XSAVE macros")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

> --- a/arch/x86/crypto/camellia_aesni_avx_glue.c
> +++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
> @@@ -554,12 -554,8 +554,14 @@@ static int __init camellia_aesni_init(v
>   {
>         const char *feature_name;
>  =20
>  +      if (!cpu_has_avx || !cpu_has_aes || !cpu_has_osxsave) {
>  +              pr_info("AVX or AES-NI instructions are not detected.\n")=
;
>  +              return -ENODEV;
>  +      }
>  +
>  +      if (!cpu_has_xfeatures(XSTATE_SSE | XSTATE_YMM, &feature_name)) {
> +       if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
> +                               &feature_name)) {

Eh, that's not going to work.  You need to keep the second
if (!cpu_has_xfeatures()) condition and delete the first.

Ben.

>                 pr_info("CPU feature '%s' is not supported.\n", feature_n=
ame);
>                 return -ENODEV;
>         }
--=20
Ben Hutchings
If the facts do not conform to your theory, they must be disposed of.
--=-aphV7w4aSfGkGUrAnYPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVhcd2+e/yOyVhhEJAQrIcRAAznCCr0cngTTpnUTs/UIKn+YDM3lMqrvQ
f1Oldh6jEJ+5RQEiHEjZmrZeVYQdOK8V2lnlcDMn2IUR1zJgz/CvWdTTFUAbXCae
iQX0VE5dsarXLAr+vwdmQdaYzHAFIAfNLG6FE8ERZIkLUTDOIoB/tAkZOdzF55av
+f9IaQivm8jJztOsgpIAepDoVIGojW33T8gb661UOkLxE43tCNHWfE5zXkAlAE5m
B6rypEvyRNm43n9KLc55W2Bn21++2RkSbF7Z6rX/v+L4FIptXD18aA5ioFZHh0C+
XiaMj7OMxlvMibO5rU6BifspNBy/tnvZxEklALkqK5AcuR+W/89bifAN/44+GWy+
ZuS2oU88HPFFOAGp9pp3Fj3sXkltF0hepLrQWIdKriToskd9zid+d89GuzHY6quV
CWvdSJaG7UIF/7NcCLKX5PJb/Q7QOsUmDPsjESLYCylUYuIkvo3sCtjUcnbjnxZK
YaxZX07d1osJe041TsxcJKa4+HU/nGyu+I9YChXE5JfuO/QSpFwbh3ofYzFJP1LC
W6u07074hVzq1wKCkEKZdwIHrhfKW2kv5mUbb0LVguBjL5YRPoHWaHwtCtUW3M0f
CnPJZY/+xMfXiT/qcoUMAT/nZwIPsFsc6zSNNvmdHftG4S6r+BZ+RCLfxIwhc5J+
/7f/XCkVflo=
=KBUJ
-----END PGP SIGNATURE-----

--=-aphV7w4aSfGkGUrAnYPO--
