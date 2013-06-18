From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jun 17 (compat_binfmt_elf.c)
Date: Tue, 18 Jun 2013 10:24:11 +1000
Message-ID: <20130618102411.258693d302bad332e920fd63@canb.auug.org.au>
References: <20130617185106.5950ffbf4b96acd9b2b2c834@canb.auug.org.au>
	<51BF4443.2040801@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__18_Jun_2013_10_24_11_+1000_pDBtIm1WVGknsHP3"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51BF4443.2040801@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__18_Jun_2013_10_24_11_+1000_pDBtIm1WVGknsHP3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 17 Jun 2013 10:15:47 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> warning: (IA32_EMULATION) selects COMPAT_BINFMT_ELF which has unmet direc=
t dependencies (COMPAT && BINFMT_ELF)

See commit d812c0e1f90b ("powerpc: Make sure that we alays include
CONFIG_BINFMT_ELF") for how I fixed that for PowerPC.  X86(_64) might want
something similar.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__18_Jun_2013_10_24_11_+1000_pDBtIm1WVGknsHP3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRv6irAAoJEECxmPOUX5FEzSQP/2cnhVkJfofVYMkZg1/md234
2rdakQoU1zCBBWrcuBBfcNhc8D9gV4uFfFoa6qHC/8N12lGxAp0dz6LynpLws49s
JBQDVlb1rhwdaPWmLIhUNKe6T+hs0jLxJU5AcH4M+ykJ8AmQD+Chnd0VkRc+v48g
iyAcmUHzNZXG/QXe9LEZ9hfpGYmMO34jYvrTlvIweFJnLh11Zyexdw9D6mh5ZI0o
1OnYPOHipTRURrSt3jCGaNquWtpfdwSGbwK9rNSyKOOVm62S9PIZwM1y1sDVG9if
SwO/P+LCIh0tOF3coJQnfd3iqRUsp+lefAY3PdUd9d2oeUXWpkqKGD3cbSGJreQz
sJbpuh+jA3jjKIcgCMPqFGbK4psYnUAZeyFQcKwhJobU5c1UzzZ3GkocwXhULMN/
qoYGnVGpvKPAd9T8W/eDJm1YjUjS0Gibp+hnbIlmAB+Qb+6q5VTFE7JhG7UVfoaD
8lTCoLGWqpArre5kvMCFs2oOeRLe+ZAAPvYWAZwalUdbIfkSyZc8WQKDeaMCicgr
sSWza1QPWXI36qKklGQp8+rwIeMR5tEqQBGy/wbZdLtPwJTy8sXCobrpEQ7N4za4
SS0obhbzvAn9mxT8IXhol0L4u1ptgLnmBCSXDoktSxTu1nwciGRB5W1gKi+7gobZ
+vi8ZAsWRWZI/W02IMEP
=9o1P
-----END PGP SIGNATURE-----

--Signature=_Tue__18_Jun_2013_10_24_11_+1000_pDBtIm1WVGknsHP3--
