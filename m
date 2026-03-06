Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F430C37C;
	Fri,  6 Mar 2026 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804866; cv=none; b=rwVZp4nfbDX3KA1g8RHnaghZunGzQak4G03Cw5mknNOLnZmOwQNg5bVmevbJ89m0aqe2aU10Fk0aX1WsQhq7n1dBIA7Ru/0UuGUo37x+mIhcwzZAa3S4fW/Lc5WGovnlnXH9Usw13whShti8G5M1i+D8Tt6a3BbT6KMO5RV1Fjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804866; c=relaxed/simple;
	bh=7VI9Z57IW5lnoIdJKDb55CIWuW0C9oyviSyFoUx6cP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKmQ9OBLMqmbCCf7JFeEHFxi+PkoaEM6f3Vm7lXUaMzhyDOgn+x6XHzRpO3HVaKdK5DazfMD7XrsXsJUCD4BvhejQ+hXSIbNX99G4dJaLOwGPOUDgO9M9UDRxN4hm5cNlatXpa2PiPPp4NA9EWCxGZ+UkpwPj3sx7w1oiDjO4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ9aRW3P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ9aRW3P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54D2C2BC86;
	Fri,  6 Mar 2026 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804865;
	bh=7VI9Z57IW5lnoIdJKDb55CIWuW0C9oyviSyFoUx6cP4=;
	h=Date:From:To:Cc:Subject:From;
	b=SQ9aRW3PDlHkFAO1zND0LjxPJfozp697bpGO21W9qTRG7cLfcuVd6BkChmfRpMxM0
	 qo91VIHqTkZFG+d499n5+Fdm5PYypUVbLTf0A3lBvKNwww8xIpq+K52ZeQFP5P0hMI
	 /XNIX167cGIHnVM9RlP3pLNqscOu007R2FolQRECGfez8UnbZdoBOS8Osh7a9iPLhP
	 ZKoG78OEn43tdegIdaI4dpjeuQxnzyHjiVUr5ujbzOKxfnrDB/6yBpGdUVzGJv0ijY
	 r6nTBxh1svrmaH1s8Jz+M5V2rPFzb5aeSsuF5iGNc5cN3X38z/O4YhhneYdjLkyz7p
	 BBykHuY0RU5GQ==
Date: Fri, 6 Mar 2026 13:47:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <aara_h8QDdY9N7GR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8ieQjihicoR7YuD"
Content-Disposition: inline


--+8ieQjihicoR7YuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
/tmp/next/build/include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_434' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error
  706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
/tmp/next/build/include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
  687 |                         prefix ## suffix();                             \
      |                         ^~~~~~
/tmp/next/build/include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
  706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
   98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
      |         ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
  105 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
/tmp/next/build/drivers/leds/led-class-multicolor.c:51:38: note: in expansion of macro 'min'
   51 |                 intensity_value[i] = min(intensity_value[i],
      |                                      ^~~

Caused by commit

  787130d7bc49e (leds: multicolor: Limit intensity to max_brightness of LED)

I have used the version from next-20260305 instead.

--+8ieQjihicoR7YuD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq2v0ACgkQJNaLcl1U
h9Dj3gf/Ujhkd2WttJ8zQEecZiiyKja/rm69rsHnvRuVyUtEqsZgmzrD72Xv5Vvj
W/QsZs/rQP5FLKR1IstuVe9dk/KRZujcLmGVOl1ddkYJG77qkQ8U3N+u3FMMpL9B
2t1i+ruUeMA0XHbgaPNHIL2vWArdAVZ/b/J2Kj2v9d914wi2drGpDJl50Aqv+1jz
C0CwKpQOE4D0vJ3loNLyBteeAal6J5davXGMTHEL9y2P6mP6ONSxP12DfwHK9Iiy
NTO5d6F64nQYTgc7am6odDMKA2HJ6TW49Zyj3ftjZ1QXcnOHtT/7vs0YpxkYuDbd
KQkVbymgKQ7ZHvdQdyg2aEsZdNTWdw==
=dJGs
-----END PGP SIGNATURE-----

--+8ieQjihicoR7YuD--
