Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B597C3A9619;
	Tue, 17 Mar 2026 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757975; cv=none; b=Tg5EP5JVaCvNV98ow6r16xCmk9MQ0kuFG0ipSDWbS6yeKY5muyEBmNWO9RqzT7dtm731QeGXbp1IKR5m4CNQnOIvpB8+rw3TxGFedWLvBH9gotZG0KoGLj3sooEwomBnaZrjZzvGi9mYyVUdKwogTZoad4+/mVOlI+SEner3M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757975; c=relaxed/simple;
	bh=HREv/ys0o9btuxHvwb9D9esGrS6aIwKZqb+BsSc7rPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pABRIGOyY2wjcCdr5mAVvfU4wh9KUFwFTDSsM41mE0JsqIVpYzzRZUbgmpHZsi3fl1HwSTMS6cCTli+yM4agQUa6qkJi903UsB5CCanZYeKCFPVQHqBAgnFA6D4Ll3rCwvKrAThMgwK7Bb0WGy7juMsH1MccGm3UJn/x2a+qZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDzo1c9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDzo1c9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3D2C4CEF7;
	Tue, 17 Mar 2026 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757975;
	bh=HREv/ys0o9btuxHvwb9D9esGrS6aIwKZqb+BsSc7rPs=;
	h=Date:From:To:Cc:Subject:From;
	b=lDzo1c9wn+w8rlvENC/yFM5yO+O/LzcbwexurY6y/YBwaaRJxdC7azqRGqNCxIvPL
	 t7gG/Mp7FJYx2lOIskiz+EZBjyUUkC41773tXEB1CvjUXVFWeIrhjtVW5D9WOSDwhV
	 bs8x+XVioduAEFpEN8YBq5yX07Mqc2/adpEPyrIwMO7+EGl/+2clLTNL55xZrYP1oW
	 N1IatKJcqkVdWi4I1b0zctrV5ZjdAXfvzSk7j6QZ8js8/E+AB8eq0ITw/08hkeslfh
	 CkmJkjBzGa0hYe9tXbyeNiKMVD+Bjo19t9ZUrxudm3IchGQhSeKYVLuEJvF2m3AODG
	 SFEd6QqSVo+jw==
Date: Tue, 17 Mar 2026 14:32:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Carlier <devnexen@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Josh Law <objecting@objecting.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <ablmE1TqDmIYHiBH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C4oPTtn+2kh8bdzS"
Content-Disposition: inline


--C4oPTtn+2kh8bdzS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mm-unstable tree, today's linux-next build (arm64
kunit) failed like this:

[13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:157
[13:30:42] Expected 1 == percpu_counter_tree_precise_compare_value(&pct, (long)under), but
[13:30:42]     percpu_counter_tree_precise_compare_value(&pct, (long)under) == 0 (0x0)
[13:30:42] # hpcc_test_compare_value_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:160
[13:30:42] Expected -1 == percpu_counter_tree_precise_compare_value(&pct, -(long)over), but
[13:30:42]     percpu_counter_tree_precise_compare_value(&pct, -(long)over) == 0 (0x0)
[13:30:42] [FAILED] hpcc_test_compare_value_boundaries
[13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:246
[13:30:42] Expected 1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
[13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
[13:30:42] # hpcc_test_compare_counter_boundaries: EXPECTATION FAILED at lib/tests/percpu_counter_tree_kunit.c:251
[13:30:42] Expected -1 == percpu_counter_tree_precise_compare(&pct[0], &pct[1]), but
[13:30:42]     percpu_counter_tree_precise_compare(&pct[0], &pct[1]) == 0 (0x0)
[13:30:42] [FAILED] hpcc_test_compare_counter_boundaries
[13:30:42] [PASSED] hpcc_test_init_one
[13:30:42] [PASSED] hpcc_test_set
[13:30:42]     # module: percpu_counter_tree_kunit
[13:30:42] # percpu_counter_tree: pass:8 fail:2 skip:0 total:10

...

[13:30:47] Testing complete. Ran 9088 tests: passed: 9015, failed: 2, skipped: 71
[13:30:47] Failures: percpu_counter_tree.hpcc_test_compare_value_boundaries, percpu_counter_tree.hpcc_test_compare_counter_boundaries

Triggered by commit

  ebc1ff504f557 (lib: add kunit boundary tests for percpu_counter_tree comparisons)

though as it's a newly added test it's obviously entirely plausible that
it's flagging an existing bug.  I used the tree from next-20260316
instead.

--C4oPTtn+2kh8bdzS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5ZhIACgkQJNaLcl1U
h9CWmwf/aCOvIWj/9KWUSjT8mV7LkfWX18uChAc5WYC7SVsXfa6EtVgSnksO6DUz
fwSkA9qLL4yqd8fVPohj/D1eCdygE9X4uULUs7LoC5V/s6jxodbXKDV0qBdom4oJ
iBuvl3tNUWhK9BJC76i+85615cA/4DbTJXk2XMVZP2BksrmWempXrJpS5d8RNGvN
ThSxZabVIzP5rH6vWt5e6acX9RpxNZeNz272vmPyXv3qw9KMh4nKG7VArD19zMoD
uvuZWHkxxcsTohKdcneVIjZYKivo7Woiy0xHlROD5VMfGeoRTbA/7sdv8+CpB0dj
ZKxq5IfpKXtGr7JzKBPm0YlRODJO4w==
=Gxxf
-----END PGP SIGNATURE-----

--C4oPTtn+2kh8bdzS--
