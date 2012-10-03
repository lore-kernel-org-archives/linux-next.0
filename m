From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: build failure after merge of the ubi tree
Date: Wed, 03 Oct 2012 10:20:43 +0300
Message-ID: <1349248843.2017.108.camel@sauron.fi.intel.com>
References: <20121003122735.692388e2f68dd85e43052c70@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-CZWmydX3VkSKW6OazrId"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121003122735.692388e2f68dd85e43052c70@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org


--=-CZWmydX3VkSKW6OazrId
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-03 at 12:27 +1000, Stephen Rothwell wrote:
> Hi Artem,
>=20
> After merging the ubi tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>=20
> ERROR: "ubi_update_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
> ERROR: "ubi_scan_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
> ERROR: "ubi_calc_fm_size" [drivers/mtd/ubi/ubi.ko] undefined!

I've added Richard's fastmap work there. I'll look at these failures.

And yes, using the previous ubi tree is a good decision, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-CZWmydX3VkSKW6OazrId
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQa+dLAAoJECmIfjd9wqK0avQP/iczdYXdI7PEuMczynpwYJGA
sdYeCz9I3bB9qd/sKUP2NKpeY82dFuZeM7FXDnsfrN+ElH0RG2zYg3eFC6H1YNeU
Njffqtxla33R8qXl89fuHp1XDMcw+Ue3A2cdxabSbBAmkxibx0VPQm64sR+0qxUg
JMueEig+mWBrCCc96UEGb7DvpccWIcIZZQaGt8bta86jjKgddmVQK6dx0w4ZXbIJ
hX7n8X4bR/lAwviMn0wxSZhRtRb7INAeTmBLbTaarxQjF7icViqNp4WbubChaqbH
VlouSTGwx4NZwth3o4/0Yo6UNVyP0WsFCSQBHXTohhkaFbp5Mvny7jHNrn3G6PKW
el+BwVgW3QMltbQL3GFRVfhx2GwlUQNREUH5SBuTweU2fnHo5IU78GaDtAJdXor3
X3ry+nIzGVxb7zuHr3V/q/RmMLgDtfUykjjTjrgAHlUhr+lay5hAqMmkxV5067OC
Qn4h4dyT/JxqWUHI/qN2AOy+T106KKSH5gkmGSfmcUZochqqZOZUtjcYyfQxYn1Y
YBldVqALUQ6kDFX59pPGdHpbTJIZYhWpGPV7bTppf9stfHLy/E4L0qujw3XIA/4h
ddTxHamXYup9SQdq9aq+aITA/s/0lg+Z7OjyCnBINMOSxnsTKHVYho8Pw+5dRMkW
DgVmCO1lPQpOKSDCiA61
=lau1
-----END PGP SIGNATURE-----

--=-CZWmydX3VkSKW6OazrId--
