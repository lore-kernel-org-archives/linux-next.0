From: Sven Eckelmann <sven@narfation.org>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
Date: Tue, 21 May 2019 09:18:21 +0200
Message-ID: <2143236.hFqxAeOdFG@bentobox>
References: <20190521074435.7a277fd6@canb.auug.org.au> <20190520155423.2ad5d16a@lwn.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1610824.eLnjEb8XeW"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520155423.2ad5d16a@lwn.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--nextPart1610824.eLnjEb8XeW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 20 May 2019 23:54:23 CEST Jonathan Corbet wrote:
[...]
> Argh, sorry, I should have caught that.  Fixed, thanks.

Thanks for trying. Unfortunately it was changed to the wrong value. The actual 
commit I wanted to reference in both places of the commit message was:

    8ea8814fcdcb ("LICENSES: Clearly mark dual license only licenses")

It seems I've copied the wrong commit id for some reason when I send it though 
the git-fixes alias and it didn't occur to me that I just referenced my own 
patch. Sorry about the confusion.

Kind regards,
	Sven
--nextPart1610824.eLnjEb8XeW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlzjpj0ACgkQXYcKB8Em
e0aj2A/+KDSsnjismXPiAVG0/RWxHc4WNz4F3vtWr92HIw/HYZswKy8wZFYm+23F
3AbPZ1HYMud3gNkSqYhgyFslmYTdWTml1vIHQ2oa1WaZuMD6zYxLa/sSgfGO1YP5
AqFMMQLIC2I1IEXrCbyEx9yJc+2Wp/Va2JapD4NI79cblHlJBb41kAH2C57ftygC
3IZ6tdJ29sWKGsuWmKIBrXJv868mG5r2grXuEXTDznmPWrRfQaSEAuJGZ9QGlBgK
wuJQgitqESD2Lw8B2e1ZPlpDZI6g5RJbOgqsvGzjcxPb7Meegw4Pykl+yuckKX3I
yFlXeIhLjLwzSvtYtT1zueKmnbKyrcCsfyISuZrTE6xdEiJoI4ZDrMmfn29CKhRG
KEfmg+P2x/qG+djUne8pomzAANGqDqhAjNIFu7GUmT2zyAUSkXgX+N4f5VJQxVAf
cRXdmtEohRMbTCvTX8T2pGa0b43807TTYablJ8iyvwDFisrjbw5/iL79tPexXf8r
QhF2acfKq1686VCmVttpRn5xzpRdQ2sNHhH7w371FmYKaqzlCVbn15Jz/1sfz36z
qrfNzHLxpYhDhO3RaWubX9yH7UOaNd4qCPsnjmBmFg8uRx0tCdryu6AW2E031izK
6O6a3//ySDdsNE7OvsUVFSBP++GyX5M+DS95OssrFm8O6pEUCCY=
=pipe
-----END PGP SIGNATURE-----

--nextPart1610824.eLnjEb8XeW--
