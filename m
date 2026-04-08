Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88C3D34B3;
	Wed,  8 Apr 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657728; cv=none; b=qiDpg2lh+uv72xxivz/RfwlF5O1JLtom+7DJI76AE+sQl7Or/ls66HnvOWqQjiK8LN/8AbqlY+Ni7WmegEytyXxnSl+aKcMo4XGqtLQK6sQ5C7V0VRTl+Ksrf9/ydf3CQ8hM5yc421WG4Jjib2wtcd34r1I/OElx7F7wM3zez8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657728; c=relaxed/simple;
	bh=go30o8PHnoC/IlvJxj1BvSeGKsTL3LRWgx7ZgScBP4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpA8tN67Pib77OxwpXk4XxqbwCgKd9bS3hyFTN5vMeq1lGFkd97ClmQeOgUPeR65MNJkq0u9nFYyrvUJorppOk3luOX+TwSUD/6wteV8Y9cwK06Ge4SXQxUhbhF4zn0phH9syj4T5MY1GAXQBS7gfktsQN5zelxrgV0Pn9PuuXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t13zfgEj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t13zfgEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE31C19421;
	Wed,  8 Apr 2026 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775657728;
	bh=go30o8PHnoC/IlvJxj1BvSeGKsTL3LRWgx7ZgScBP4M=;
	h=Date:From:To:Cc:Subject:From;
	b=t13zfgEjqpoLR5OPtt1RYWPXEeI936xAi3piGm8nUSHihwgGbPYeinOuKNiviIYn8
	 FvfKFcJXbyWwbD914MY/a0qnwpSamDsn+R3ycoD842f9m8qnWUHs5qds60snAtFYoc
	 +D1k6hV0JWOw6nW02WPt5B/hBbmz10SXdEvMcHGpb3cHePM1Nm2L+DF1BC9/YJ3W13
	 WKqsLpkQBhdoAu6MFVRtrthoLFSWJ/+bzOh36Z9kn1KghJ8dauGpfeyTeTStn2TFpC
	 n8C53NJi+lnLZzNto8aMOB2pLak/otBzrJ/DE/R7ydHyQr9lsuG+rqJjRP3KENJnav
	 XRDOxSF1I5Mug==
Date: Wed, 8 Apr 2026 15:15:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: linux-next: manual merge of the audit tree with the arm-soc tree
Message-ID: <adZi-3jHeX0UhURc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZNKjoLz8PgLpQTS"
Content-Disposition: inline


--FZNKjoLz8PgLpQTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got a conflict in:

  Documentation/devicetree/bindings/arm/cpus.yaml

between commit:

  96e71f817b02c ("dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles=
")

=66rom the arm-soc tree and commits:

  0220405d7e099 ("dt-bindings: arm: cpus: Deprecate Qualcomm generic compat=
ibles")
  d08082a872f08 ("dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles=
")

=66rom the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/arm/cpus.yaml
index 07f3c6a525541,6f189ea3fdfa9..0000000000000
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@@ -79,156 -79,155 +79,161 @@@ properties
        All other bits in the reg cells must be set to 0.
 =20
    compatible:
-     enum:
-       - apm,potenza
-       - apm,strega
-       - apple,avalanche
-       - apple,blizzard
-       - apple,cyclone
-       - apple,firestorm
-       - apple,hurricane-zephyr
-       - apple,icestorm
-       - apple,mistral
-       - apple,monsoon
-       - apple,twister
-       - apple,typhoon
-       - arm,arm710t
-       - arm,arm720t
-       - arm,arm740t
-       - arm,arm7ej-s
-       - arm,arm7tdmi
-       - arm,arm7tdmi-s
-       - arm,arm9es
-       - arm,arm9ej-s
-       - arm,arm920t
-       - arm,arm922t
-       - arm,arm925
-       - arm,arm926e-s
-       - arm,arm926ej-s
-       - arm,arm940t
-       - arm,arm946e-s
-       - arm,arm966e-s
-       - arm,arm968e-s
-       - arm,arm9tdmi
-       - arm,arm1020e
-       - arm,arm1020t
-       - arm,arm1022e
-       - arm,arm1026ej-s
-       - arm,arm1136j-s
-       - arm,arm1136jf-s
-       - arm,arm1156t2-s
-       - arm,arm1156t2f-s
-       - arm,arm1176jzf
-       - arm,arm1176jz-s
-       - arm,arm1176jzf-s
-       - arm,arm11mpcore
-       - arm,armv8 # Only for s/w models
-       - arm,c1-nano
-       - arm,c1-premium
-       - arm,c1-pro
-       - arm,c1-ultra
-       - arm,cortex-a5
-       - arm,cortex-a7
-       - arm,cortex-a8
-       - arm,cortex-a9
-       - arm,cortex-a12
-       - arm,cortex-a15
-       - arm,cortex-a17
-       - arm,cortex-a32
-       - arm,cortex-a34
-       - arm,cortex-a35
-       - arm,cortex-a53
-       - arm,cortex-a55
-       - arm,cortex-a57
-       - arm,cortex-a65
-       - arm,cortex-a72
-       - arm,cortex-a73
-       - arm,cortex-a75
-       - arm,cortex-a76
-       - arm,cortex-a77
-       - arm,cortex-a78
-       - arm,cortex-a78ae
-       - arm,cortex-a78c
-       - arm,cortex-a320
-       - arm,cortex-a510
-       - arm,cortex-a520
-       - arm,cortex-a520ae
-       - arm,cortex-a710
-       - arm,cortex-a715
-       - arm,cortex-a720
-       - arm,cortex-a720ae
-       - arm,cortex-a725
-       - arm,cortex-m0
-       - arm,cortex-m0+
-       - arm,cortex-m1
-       - arm,cortex-m3
-       - arm,cortex-m4
-       - arm,cortex-r4
-       - arm,cortex-r5
-       - arm,cortex-r7
-       - arm,cortex-r52
-       - arm,cortex-x1
-       - arm,cortex-x1c
-       - arm,cortex-x2
-       - arm,cortex-x3
-       - arm,cortex-x4
-       - arm,cortex-x925
-       - arm,neoverse-e1
-       - arm,neoverse-n1
-       - arm,neoverse-n2
-       - arm,neoverse-n3
-       - arm,neoverse-v1
-       - arm,neoverse-v2
-       - arm,neoverse-v3
-       - arm,neoverse-v3ae
-       - arm,rainier
-       - brcm,brahma-b15
-       - brcm,brahma-b53
-       - brcm,vulcan
-       - cavium,thunder
-       - cavium,thunder2
-       - faraday,fa526
-       - intel,sa110
-       - intel,sa1100
-       - marvell,feroceon
-       - marvell,mohawk
-       - marvell,pj4a
-       - marvell,pj4b
-       - marvell,sheeva-v5
-       - marvell,sheeva-v7
-       - nvidia,tegra132-denver
-       - nvidia,tegra186-denver
-       - nvidia,tegra194-carmel
-       - qcom,krait
-       - qcom,kryo
-       - qcom,kryo240
-       - qcom,kryo250
-       - qcom,kryo260
-       - qcom,kryo280
-       - qcom,kryo360
-       - qcom,kryo385
-       - qcom,kryo465
-       - qcom,kryo468
-       - qcom,kryo470
-       - qcom,kryo485
-       - qcom,kryo560
-       - qcom,kryo570
-       - qcom,kryo660
-       - qcom,kryo670
-       - qcom,kryo685
-       - qcom,kryo780
-       - qcom,oryon
-       - qcom,oryon-1-1
-       - qcom,oryon-1-2
-       - qcom,oryon-1-3
-       - qcom,oryon-1-4
-       - qcom,oryon-2-1
-       - qcom,oryon-2-2
-       - qcom,oryon-2-3
-       - qcom,scorpion
-       - samsung,mongoose-m2
-       - samsung,mongoose-m3
-       - samsung,mongoose-m5
+     oneOf:
+       - enum:
+           - apm,potenza
+           - apm,strega
+           - apple,avalanche
+           - apple,blizzard
+           - apple,cyclone
+           - apple,everest
+           - apple,firestorm
+           - apple,hurricane-zephyr
+           - apple,icestorm
+           - apple,mistral
+           - apple,monsoon
+           - apple,sawtooth
+           - apple,twister
+           - apple,typhoon
+           - arm,arm710t
+           - arm,arm720t
+           - arm,arm740t
+           - arm,arm7ej-s
+           - arm,arm7tdmi
+           - arm,arm7tdmi-s
+           - arm,arm9es
+           - arm,arm9ej-s
+           - arm,arm920t
+           - arm,arm922t
+           - arm,arm925
+           - arm,arm926e-s
+           - arm,arm926ej-s
+           - arm,arm940t
+           - arm,arm946e-s
+           - arm,arm966e-s
+           - arm,arm968e-s
+           - arm,arm9tdmi
+           - arm,arm1020e
+           - arm,arm1020t
+           - arm,arm1022e
+           - arm,arm1026ej-s
+           - arm,arm1136j-s
+           - arm,arm1136jf-s
+           - arm,arm1156t2-s
+           - arm,arm1156t2f-s
+           - arm,arm1176jzf
+           - arm,arm1176jz-s
+           - arm,arm1176jzf-s
+           - arm,arm11mpcore
+           - arm,armv8 # Only for s/w models
+           - arm,c1-nano
+           - arm,c1-premium
+           - arm,c1-pro
+           - arm,c1-ultra
+           - arm,cortex-a5
+           - arm,cortex-a7
+           - arm,cortex-a8
+           - arm,cortex-a9
+           - arm,cortex-a12
+           - arm,cortex-a15
+           - arm,cortex-a17
+           - arm,cortex-a32
+           - arm,cortex-a34
+           - arm,cortex-a35
+           - arm,cortex-a53
+           - arm,cortex-a55
+           - arm,cortex-a57
+           - arm,cortex-a65
+           - arm,cortex-a72
+           - arm,cortex-a73
+           - arm,cortex-a75
+           - arm,cortex-a76
+           - arm,cortex-a77
+           - arm,cortex-a78
+           - arm,cortex-a78ae
+           - arm,cortex-a78c
+           - arm,cortex-a320
+           - arm,cortex-a510
+           - arm,cortex-a520
+           - arm,cortex-a520ae
+           - arm,cortex-a710
+           - arm,cortex-a715
+           - arm,cortex-a720
+           - arm,cortex-a720ae
+           - arm,cortex-a725
+           - arm,cortex-m0
+           - arm,cortex-m0+
+           - arm,cortex-m1
+           - arm,cortex-m3
+           - arm,cortex-m4
+           - arm,cortex-r4
+           - arm,cortex-r5
+           - arm,cortex-r7
+           - arm,cortex-r52
+           - arm,cortex-x1
+           - arm,cortex-x1c
+           - arm,cortex-x2
+           - arm,cortex-x3
+           - arm,cortex-x4
+           - arm,cortex-x925
+           - arm,neoverse-e1
+           - arm,neoverse-n1
+           - arm,neoverse-n2
+           - arm,neoverse-n3
+           - arm,neoverse-v1
+           - arm,neoverse-v2
+           - arm,neoverse-v3
+           - arm,neoverse-v3ae
+           - arm,rainier
+           - brcm,brahma-b15
+           - brcm,brahma-b53
+           - brcm,vulcan
+           - cavium,thunder
+           - cavium,thunder2
+           - faraday,fa526
+           - intel,sa110
+           - intel,sa1100
+           - marvell,feroceon
+           - marvell,mohawk
+           - marvell,pj4a
+           - marvell,pj4b
+           - marvell,sheeva-v5
+           - marvell,sheeva-v7
+           - nvidia,tegra132-denver
+           - nvidia,tegra186-denver
+           - nvidia,tegra194-carmel
+           - qcom,krait
+           - qcom,kryo240
+           - qcom,kryo250
+           - qcom,kryo260
+           - qcom,kryo280
+           - qcom,kryo360
+           - qcom,kryo385
+           - qcom,kryo465
+           - qcom,kryo468
+           - qcom,kryo470
+           - qcom,kryo485
+           - qcom,kryo560
+           - qcom,kryo570
+           - qcom,kryo660
+           - qcom,kryo670
+           - qcom,kryo685
+           - qcom,kryo780
++          - qcom,oryon-1-1
++          - qcom,oryon-1-2
++          - qcom,oryon-1-3
++          - qcom,oryon-2-1
++          - qcom,oryon-2-2
++          - qcom,oryon-2-3
+           - qcom,scorpion
+           - samsung,mongoose-m2
+           - samsung,mongoose-m3
+           - samsung,mongoose-m5
+       - enum:
+           - qcom,kryo
+           - qcom,oryon
+         # Too generic, do not use in new code
+         deprecated: true
 =20
    enable-method:
      $ref: /schemas/types.yaml#/definitions/string

--FZNKjoLz8PgLpQTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWYvoACgkQJNaLcl1U
h9CLbgf/RFH6LKxF/qIBh2Tf9WIfCGem6lBgXtEQ5Ouqm/xQuGa4wa6+V4mAAmku
F81nrgMRZNS+vQAtkDrTmSCw+tzuiuWLrI1p9LoXBsJ1I8tQY4XeRWxoo6PiHcsW
HaYt4jIttsQa590syk5x+CGt8H6MLeL8IyMkrdu7Yt0J1LTyvYrNt4vC/rFBJ9Yh
zxr7yedUBnx/ZjFjlVLli18jWwBEUJedzO+588vkjXnyvUotM/WR93xuRWVWFYsY
497+nXbp/9aE+pZB6g0rdjX7qlfP0yHFKxw67lSHbKpO9lpYpLdEzzAEhAdIM4M9
vE65D922z/PGlZUN3Waa3SLcFUc6YA==
=moWb
-----END PGP SIGNATURE-----

--FZNKjoLz8PgLpQTS--
