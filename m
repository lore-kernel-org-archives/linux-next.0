From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20161205 build: 3 failures 4 warnings (next-20161205)
Date: Mon, 5 Dec 2016 11:20:43 +0000
Message-ID: <20161205112043.pyzcbhtu7bklioas@sirena.org.uk>
References: <E1cDo86-0008IX-9W@optimist>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4523045591990216622=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1cDo86-0008IX-9W@optimist>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


--===============4523045591990216622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akhyyz6b64vfd7nm"
Content-Disposition: inline


--akhyyz6b64vfd7nm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 05, 2016 at 07:56:06AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allnodconfig and allmodconfig
with:

> 	arm64-allnoconfig
> ../arch/arm64/lib/clear_user.S:33: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/clear_user.S:53: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/clear_user.S:33: Error: attempt to move .org backwards
> ../arch/arm64/lib/clear_user.S:53: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_from_user.S:67: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_from_user.S:70: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_from_user.S:67: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_from_user.S:70: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_in_user.S:68: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_in_user.S:71: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_in_user.S:68: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_in_user.S:71: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_to_user.S:66: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_to_user.S:69: Error: bad or irreducible absolute expression
> ../arch/arm64/lib/copy_to_user.S:66: Error: attempt to move .org backwards
> ../arch/arm64/lib/copy_to_user.S:69: Error: attempt to move .org backwards

This was triggered somehow by bca8f17f57bd7 (arm64: Get rid of
asm/opcodes.h) though I didn't figure out how.

--akhyyz6b64vfd7nm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhFTYoACgkQJNaLcl1U
h9CyNQf9HEk1lyq2u+Bj4ZSfPZjhN7FpKBDaJUPAcLkjJ/nK6HYjXqr5ud0cjjEU
WoolaoOhemWcpA10LvwDxfIbDpe6+PZ7r4PoXwcM3ooexsa/wTynh49DSlQCWUX+
jpr1gPIVpDXM7LLnQ1SEUtNlxjbeJxueJnM6GNMUsoE4wOkYoYvtQekJsGFcbhZ0
sLczxd9tpsBIMjJEkq3jS/0CZP7PSi9nL7CRN4Y9rrcvIS1x0qO2aCkixsaC5Yl2
9Ab/ndKbSUJq7/7dAI5ByaQsKYkfZ3aJgDgCdm05a00mTr/cAg9+jHe7sI9vZBkv
HlEIEKchvUdz3z2Px1x/AH+GBNI0DQ==
=U1cQ
-----END PGP SIGNATURE-----

--akhyyz6b64vfd7nm--


--===============4523045591990216622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4523045591990216622==--
