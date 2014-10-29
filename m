From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: build warning after merge of the pm tree
Date: Wed, 29 Oct 2014 15:55:19 +0100
Message-ID: <1548287.VkQosq7gyk@vostro.rjw.lan>
References: <20141029135129.40193e14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart176848255.Z2540WZzJO"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141029135129.40193e14@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild test robot <fengguang.wu@intel.com>
List-Id: linux-next.vger.kernel.org


--nextPart176848255.Z2540WZzJO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, October 29, 2014 01:51:29 PM Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/of/base.c: In function 'of_property_read_string_array':
> drivers/of/base.c:1472:1: warning: control reaches end of non-void function [-Wreturn-type]
>  }
>  ^
> 
> Introduced by commit ef23586751cd ("Driver core: Unified device
> properties interface for platform firmware").

Thanks for reporting this!

> Please don't ignore new warnings ...

I don't as a rule.  I'm not sure why I haven't seen that before (and the kbuild
robot reports BUILD SUCCESS for that branch).

Rafael
--nextPart176848255.Z2540WZzJO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCAAGBQJUUP/eAAoJEILEb/54YlRxTG4P/1vCICQ8dDIaXmmbhrYL1FTD
SqD5t+xWPmLE1RtgOQp/hIx/UVLYEsOsDD/cZ6D5vQFbCTuSb5aq3K4Qt3wAFI5Z
Ws1r6ikCduA/BZ48zlykglZ0ic/aCTUOk5Y52+cbaes8E6cg6owk+N+xq4cN9Bfc
/VNPyS6SV0pQHvockl7FEO+wGrtWdUp4cfcz12TEqwyTDPsZg83oD1J9MkQEVHEB
PAC118LNtyGWt1RvrbsGOkhKshcd3PZzmc7VLR4Xclm9xeUh0RNqxyYFTJO+cHn0
cWElGRMLhEXkewTQSCOH2G1qy3ztyi26OyuQnudw1q0qck/UgI/ANwDgD50SS6JV
xgnduKdf7AUrDcLrdHQlNd1fCLSFRDh3JkLHb4i55A5jUlqMghBrzGEWQ78Mt95i
nLgWywEVJQV0kqpLyug6oH2kPyHihmO30WWmebQwxH4RzqFJl17CqZow9CObL4RN
6bFbNEu2/8r2NkQhm97+n8vGjku7KlAVt9bvXIsJhBCCcxHM4hJpiEOozOng7ZCm
PvtenkvLUJs6RQVO3TjevbADurYon8LKxrRmWSlJUy8E0xzHEAOPNkRJTGUz1qTy
h51/HL9G52GBHHKhUZG0HTlqC4+LEawj6mxr3l5m+cDz+EhpRIqq/QnTR7xx8sgt
3M5fRrVhFdGMdHQjoUO0
=ETQS
-----END PGP SIGNATURE-----

--nextPart176848255.Z2540WZzJO--
