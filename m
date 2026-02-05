Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293CD20B810;
	Thu,  5 Feb 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298419; cv=none; b=cw6g2vp6Kli2Ipw0cTjdEPfih6YWaDCjZII28KBZj4R/nxF2rHvQGL2upPbQSLhrgus0DLg21al0iOKpbqjZ+0ra2tTV/ZET+yGLQt3XtXCWkOncAZ6T+2F9BlzR+bpTkv4r5zDXWem2YylzRqWeqNzPpX4u6SPBGFT3BYLMBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298419; c=relaxed/simple;
	bh=7lXqrVkwLVKsKTW3UXMQXsTHZ1IBQ46g/EQ44PJEwmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NT0DZ6n0FPSky7cJTehRPHq7Yj7Psv6qAgXqPlL6iPvEYgcbajoG5ytyeYJFdMZBGjF4mf/dweKtO5Hi/nFpPNtD/5kOzxvxvihPSczP06/Xue9RIP4ayUXD6q75dbsNJMpX15fw5lRQpgWfF6urYvdzeoRcpGl93UgXhVJ6wxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFzOuXxn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFzOuXxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73E1C4CEF7;
	Thu,  5 Feb 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298418;
	bh=7lXqrVkwLVKsKTW3UXMQXsTHZ1IBQ46g/EQ44PJEwmI=;
	h=Date:From:To:Cc:Subject:From;
	b=mFzOuXxnYwWvHvOeyzTbF01YHRc2ukqMAiggoj5w/cT5/9HPLO6yxB0qhBMTax/m1
	 8wqTmARTbNdX8mSiAEfIhY4s1LmWMY2qGJ8L1cPZV7x8Dk28oAqzuLSktLB+rL1pr6
	 Ji5Wsco3VCuapNdvUbuTsiYifS70g5NQiQrK+srAPJdjSjDeS+zoiYUQYcQYvC2S5K
	 B078Q+Hi/E7KzRhdO0mDxrTBzAvvMG/ifC4Vo2BmVTWB58z3lg+nPdrz+VH4fES3+m
	 l1N6+4WWdptCG5nWo9UmsSOlMJZXu5jS4erfOSKSO5CugiaWtUYjRtC813gWns9JyY
	 Hje99+MxPSW+A==
Date: Thu, 5 Feb 2026 13:33:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <aYScLt9IJ-odFmx_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZS1VrphM5Wx5BoT5"
Content-Disposition: inline


--ZS1VrphM5Wx5BoT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/mux/core.c:312:14: error: redefinition of 'mux_control_states'
  312 | unsigned int mux_control_states(struct mux_control *mux)
      |              ^~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/drivers/mux/core.c:19:
/tmp/next/build/include/linux/mux/consumer.h:70:28: note: previous definition of 'mux_control_states' with type 'unsigned int(struct mux_control *)'
   70 | static inline unsigned int mux_control_states(struct mux_control *mux)
      |                            ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:375:5: error: redefinition of 'mux_control_select_delay'
  375 | int mux_control_select_delay(struct mux_control *mux, unsigned int state,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:74:32: note: previous definition of 'mux_control_select_delay' with type 'int(struct mux_control *, unsigned int,  unsigned int)'
   74 | static inline int __must_check mux_control_select_delay(struct mux_control *mux,
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:413:5: error: redefinition of 'mux_state_select_delay'
  413 | int mux_state_select_delay(struct mux_state *mstate, unsigned int delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:79:32: note: previous definition of 'mux_state_select_delay' with type 'int(struct mux_state *, unsigned int)'
   79 | static inline int __must_check mux_state_select_delay(struct mux_state *mstate,
      |                                ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:435:5: error: redefinition of 'mux_control_try_select_delay'
  435 | int mux_control_try_select_delay(struct mux_control *mux, unsigned int state,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:84:32: note: previous definition of 'mux_control_try_select_delay' with type 'int(struct mux_control *, unsigned int,  unsigned int)'
   84 | static inline int __must_check mux_control_try_select_delay(struct mux_control *mux,
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:469:5: error: redefinition of 'mux_state_try_select_delay'
  469 | int mux_state_try_select_delay(struct mux_state *mstate, unsigned int delay_us)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:90:32: note: previous definition of 'mux_state_try_select_delay' with type 'int(struct mux_state *, unsigned int)'
   90 | static inline int __must_check mux_state_try_select_delay(struct mux_state *mstate,
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:487:5: error: redefinition of 'mux_control_deselect'
  487 | int mux_control_deselect(struct mux_control *mux)
      |     ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:118:19: note: previous definition of 'mux_control_deselect' with type 'int(struct mux_control *)'
  118 | static inline int mux_control_deselect(struct mux_control *mux)
      |                   ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:513:5: error: redefinition of 'mux_state_deselect'
  513 | int mux_state_deselect(struct mux_state *mstate)
      |     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:122:19: note: previous definition of 'mux_state_deselect' with type 'int(struct mux_state *)'
  122 | static inline int mux_state_deselect(struct mux_state *mstate)
      |                   ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:636:21: error: redefinition of 'mux_control_get'
  636 | struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
      |                     ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:127:35: note: previous definition of 'mux_control_get' with type 'struct mux_control *(struct device *, const char *)'
  127 | static inline struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
      |                                   ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:655:21: error: redefinition of 'mux_control_get_optional'
  655 | struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:131:35: note: previous definition of 'mux_control_get_optional' with type 'struct mux_control *(struct device *, const char *)'
  131 | static inline struct mux_control *mux_control_get_optional(struct device *dev,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:667:6: error: redefinition of 'mux_control_put'
  667 | void mux_control_put(struct mux_control *mux)
      |      ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:136:20: note: previous definition of 'mux_control_put' with type 'void(struct mux_control *)'
  136 | static inline void mux_control_put(struct mux_control *mux) {}
      |                    ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:688:21: error: redefinition of 'devm_mux_control_get'
  688 | struct mux_control *devm_mux_control_get(struct device *dev,
      |                     ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:138:35: note: previous definition of 'devm_mux_control_get' with type 'struct mux_control *(struct device *, const char *)'
  138 | static inline struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name)
      |                                   ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:831:19: error: redefinition of 'devm_mux_state_get'
  831 | struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
      |                   ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:142:33: note: previous definition of 'devm_mux_state_get' with type 'struct mux_state *(struct device *, const char *)'
  142 | static inline struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
      |                                 ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:848:19: error: redefinition of 'devm_mux_state_get_optional'
  848 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name)
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:146:33: note: previous definition of 'devm_mux_state_get_optional' with type 'struct mux_state *(struct device *, const char *)'
  146 | static inline struct mux_state *devm_mux_state_get_optional(struct device *dev,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:866:19: error: redefinition of 'devm_mux_state_get_selected'
  866 | struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name)
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:151:33: note: previous definition of 'devm_mux_state_get_selected' with type 'struct mux_state *(struct device *, const char *)'
  151 | static inline struct mux_state *devm_mux_state_get_selected(struct device *dev,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/mux/core.c:885:19: error: redefinition of 'devm_mux_state_get_optional_selected'
  885 | struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/mux/consumer.h:156:33: note: previous definition of 'devm_mux_state_get_optional_selected' with type 'struct mux_state *(struct device *, const char *)'
  156 | static inline struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  ad314348ceb4f (mux: Add helper functions for getting optional and selected mux-state)

I have used the version from next-20260204 insted.

--ZS1VrphM5Wx5BoT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmEnC4ACgkQJNaLcl1U
h9C38Qf/TIxUgjujbZeEwizBvYzreBAhKWj64rQWgRBj2Qs4woSAYmY9kNARKFNm
YAfYpYWTX+REoWoc36dwNz4D6sHTxPBme+xff7I/o9ZJI6/ml9chPOMM4LEd1dqP
rVjcba8JK5i4kB31oL3sO0x+goFDOrz/oCLQ+BwL5YmiwphHRkElYQz3MOIiBPUM
cyyecs3+htbeNpbgV0q+cKl7Zx5JlIh+WqlLmVMkaqZRf0ac8lDc9cOuoqdKxj7i
DUR/PDUAvESpkuz9sm9GHJQNf1g6UzO1r5bwcQ7tfgrLiQ57U3oWCtKf3vyovOoP
EG+SwKuJAGI+j8iWcirQjXhTdj2aaA==
=N/cS
-----END PGP SIGNATURE-----

--ZS1VrphM5Wx5BoT5--
