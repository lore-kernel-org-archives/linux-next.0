From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20181008 build: 2 failures 22 warnings (next-20181008)
Date: Mon, 8 Oct 2018 22:11:09 +0100
Message-ID: <20181008211109.GA4440@sirena.org.uk>
References: <E1g9cV0-0008Sg-4U@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5285607044292413706=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1g9cV0-0008Sg-4U@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============5285607044292413706==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 08, 2018 at 09:51:30PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 defconfig due to:

> 	arm64-defconfig
> ../drivers/acpi/numa.c:34:23: fatal error: asm/kaslr.h: No such file or directory

caused by 3a387c6d96e69 (x86/kaslr, ACPI/NUMA: Fix KASLR build error)
which adds the inclusion unconditionally.

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlu7x+oACgkQJNaLcl1U
h9CCyggAgNzS9q9fAmEsAkOxIFIdDuP50qrbyj+MnLeaRHi8jKimYSKataeHWEy4
r88yUO7qVuISHPW5CZ3d/h6N8o8CEb3oX79goyDVug6vLHvmo07q2ueQy7oh4LqA
It67ZbKWC5ws2Xo24CzLg8EuQu+q/7gNALywZImefTvIFbvbveQyZ9cxqq/wOIAI
/O+KgQzn2YwElvV5uSUGEUch6+Ma3vYQ1YxlqUqObGB33AfgLw/sB1j3PpLV2d95
XiqA345snuh1jiOHfXOtk00lEDdLffXm6inDTHqibgmOMbWkcUcYE9BO8aiWqCi7
SIvI4vgd/g+MTkWVdCq/lsUmzq4LNg==
=jPZ+
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--


--===============5285607044292413706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5285607044292413706==--
