Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F031B117;
	Mon, 16 Feb 2026 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254932; cv=none; b=gxsqpQO6LNvU0J+ZlqCxPvq+7J1ekvxO1+Lh1KIMtCL344wEQR2e3S7JDjnc9zrzTI3cf09CL+aE+KDK3p0irWGHNpdGD97EN2cSbWVctvRDpuS6+iWaowUFoBLluqdQ2933ZQVr5Ze9wbB3vORws+jLULxfFzDPrzj57kTlqlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254932; c=relaxed/simple;
	bh=PXhmVIkHhKTtqvMxn9IC8BqMRHD6DzORVDhNqQ17xjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HF0oSfoqZ8R6LfuqqYGhmA5EsqxCDh3ZPB5Omt4UFAyK3ROccFLlks3sjdgXFRteReC5hzq79uko0xd270qyLBLmgIgxdAbiIbG8xFtVisULpUW5UPo7llWCGXTiRI8i+9zuplFP06XeSsJAAk1CX22ljYIDvc+DheprRuiZHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXIJZn3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXIJZn3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E24C116C6;
	Mon, 16 Feb 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771254932;
	bh=PXhmVIkHhKTtqvMxn9IC8BqMRHD6DzORVDhNqQ17xjM=;
	h=Date:From:To:Cc:Subject:From;
	b=hXIJZn3sO2P3Bik9FybzUUgFiyWZOggRTf55Kf2dU8haKWrRpinE1lFX6by5FChaN
	 g3bNYbETInaOn6RSlxhrWRef+wBObON9gSTxHoAXZHBwuRs3t1d4CkU29lQdscR/sR
	 ZIkQpwIF3+E+yXNplRiZ8kI2XXuBbVuqp8MWHzYAV/61rx/hYHhcDqhqMhuyyAuZmj
	 3UU4Esof6YGHX2ohtz2vjuYs3uwgBoV0omVHWpRyTmtAwgsITRmO43D2kWHEhU+Fds
	 GYy9xB8teIBh1ZHLPy0lTCw9Xy3P4KrzbaonEq1xdQow3w0NMeoalriq51yWuGrXBm
	 IG58ysfxjl3Zg==
Date: Mon, 16 Feb 2026 15:15:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the i2c-host tree with the origin tree
Message-ID: <aZM0kOy771z5G-8J@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rRDu3LafyY2LmqlX"
Content-Disposition: inline


--rRDu3LafyY2LmqlX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c-host tree got a conflict in:

  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml

between commit:

  880977fdc7f67 ("dt-bindings: i2c: qcom-cci: Document SM8750 compatible")

=66rom the origin tree and commit:

  eddfdab4de202 ("dt-bindings: i2c: qcom-cci: Document qcs8300 compatible")

=66rom the i2c-host tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece,f1919f59d521c..0000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@@ -133,7 -133,7 +134,8 @@@ allOf
              enum:
                - qcom,kaanapali-cci
                - qcom,qcm2290-cci
+               - qcom,qcs8300-cci
 +              - qcom,sm8750-cci
      then:
        properties:
          clocks:

--rRDu3LafyY2LmqlX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTNI8ACgkQJNaLcl1U
h9BUWQf9HBDMh9CRHzv8Xp6FIJuhFIYSHJZeAgP7sjSCGv9uakRjl0vqapUVhbOW
ZoZX/TiVRU2pqwl7DUaNIk9lh0AvSXB7lw0EKSHguZ/Aw9ZFLGQ9H1kaKMF7G4Rw
pDUPR/RjZS1HVnn/SVKvxF+/S3VfEIxK2mGpUz81D4p4LM5CDG4eNzqe/fLkKQyK
nNLxHokYg0YnSlMuz09BQLGsSFMWgdQzPvFnwk7koiB/w4n0K97Lsff74Ql1daTR
Bl2e/8nis9MqCQ0pLqTXUCJiKMR1+u3HZKABIk5uMF0zvEWYK5qP5Yw+/0g18cHu
ekiLFTjD8Dcor8POBEjiK9At7OJK8Q==
=YE+F
-----END PGP SIGNATURE-----

--rRDu3LafyY2LmqlX--
