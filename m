From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Fri, 30 Jan 2015 09:55:33 +1100
Message-ID: <20150130095533.315d3831@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ivQ+xvIpLsd0XHnpznD9Omo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Guo Zeng <Guo.Zeng@csr.com>, Barry Song <Baohua.Song@csr.com>, Baruch Siach <baruch@tkos.co.il>
List-Id: linux-next.vger.kernel.org

--Sig_/ivQ+xvIpLsd0XHnpznD9Omo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/Kconfig.debug between commit 4d31e6641295 ("ARM: 8272/1: netx:
Migrate DEBUG_LL macros to shared directory") from the  tree and
commits 01ea63d99397 ("ARM: sirf: add two debug ports for CSRatlas7
SoC") and e23814da8262 ("ARM: digicolor: add low level debug support")
from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/Kconfig.debug
index a324ecdfeb21,b6a073de1559..000000000000
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@@ -1448,17 -1461,15 +1517,19 @@@ config DEBUG_UART_VIR
  	default 0xfef00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
  	default 0xfef00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
  	default 0xfef36000 if DEBUG_HIGHBANK_UART
 +	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
 +	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
 +	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
  	default 0xfefff700 if ARCH_IOP33X
  	default 0xff003000 if DEBUG_U300_UART
+ 	default 0xffd01000 if DEBUG_HIP01_UART
  	default DEBUG_UART_PHYS if !MMU
  	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
  		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
 -		DEBUG_MSM_UART || DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
 +		DEBUG_MSM_UART || DEBUG_NETX_UART || \
 +		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
- 		DEBUG_UART_BCM63XX || DEBUG_ASM9260_UART
+ 		DEBUG_UART_BCM63XX || DEBUG_ASM9260_UART || \
+ 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0
 =20
  config DEBUG_UART_8250_SHIFT
  	int "Register offset shift for the 8250 debug UART"

--Sig_/ivQ+xvIpLsd0XHnpznD9Omo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUyrpqAAoJEMDTa8Ir7ZwVUT0P/382HvO7xIBJo5TjhVWeBjN8
XyMy3K5AserhiwfRYADKKN8lDUTDv0ZgAln9Y9BqwGU5nS4mGFXTut+2iUksQuPs
pwkDoE72/WM2u4PH7Gj2YhVIMbUrjHaWl6I5sDK67LrF7xI4j1t9znEaOyUSFSKC
U1bAELG6aeOHdNflu/428FBgwpqicLF/oBkGqptIIFfC/I86KVIpZnrCh2OG0rt9
E8Pac128JZTFY53AfRtGfiOfL6E7FJhHvdHQ6l0VBw4ZhAGSQMq/IrbyhEEwFgxm
s1Bkef6DNv7KagRFwvaPBzhU1pqhSg7bYAaTLrMVecM1jRnAilhmjWx3eIGmjCxj
G8EYV2UydGFa9hj5acVNUh3stSACNMcDT/qeCskcByHvniaqKJkwSFrumuVtb0Sy
W+ANEtlzH5WwrhgzoDFNLXZ+pQVKQJUXR/u64vAnALV4o6i8HlFHdXcKczfoTGyV
xWtexse3VuBWj/jfwk7lEbp3NAHoFISGG5FG1XBQpTMaG3g0yjoYwRNhnfWUwvW0
FsvH1OnPU8beeOZKuTC5izCMozc1gwAH+Kos8gKFNvc7ZqJUGgNuOhnJIMZgt1A3
cCV/xHEnCTMps+4X83XZBDocrP9qF7JvAvjmKs63MG0NvhIk0ZutLR6HAoegUSsC
+DMa2bKjkkw5aaXCzrtW
=Y0dx
-----END PGP SIGNATURE-----

--Sig_/ivQ+xvIpLsd0XHnpznD9Omo--
