Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87718399361;
	Tue, 11 Aug 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461681; cv=none; b=cCwgdSCMTZf7Q2Qj+NhLSK/r7Kv0CZRGrYQbylO4J1u/2Llh3JWhpCmJAhSKO8Axbo2lZji6Vyu0dXSR8nY45IcwMWlJ51086DfjtU9XOPsr/YEUVV3qvZGy0kaYxCRQGBfsKn9DmrBXhI++8jswo9VWtdQjXrfl7vxaRg5Zmwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461681; c=relaxed/simple;
	bh=fvyUr+9cOrATIdvQeZIJ2jQaf+G21eTIttHA9PWlytQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bmb6EODW5rlveJYb945jnSFhN9XzX3OvcSCgNw7ubAbcbKCcO9oAuUbhLpt3dk0dDiM1dehnBVKk7a4nfXfvtFq8LjBd0gWODLtmb6+enqtlNwUCwQqxXjTQuDNAdMz7/W6f5tQeWK1a61sJVJVDnGEGerrQ6zufWEpi0bOgPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zar26ahr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zar26ahr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD001F000E9;
	Tue, 11 Aug 2026 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786461679;
	bh=GZi9EngiVn0naHpGfjR/4Yyis+5nC8sk+OoKkyEpkV0=;
	h=Date:From:To:Cc:Subject;
	b=Zar26ahr2sopJg9TIQyHHg/2WaCQwMksZuXGmSS7D38TzsfUSLcT31AIM8LA7DNg1
	 irShBHFF0qCedGAlfQWiflDDYl5mdd9Dz52Id/M3kymapOfUwy/BU0cpHtFHfNLSOD
	 eSdl0mrft+BA4x0wuBGZiozTI7fnUZmPGCiq2j2hCeBSONJCimhB0HAgielmwWfuvj
	 OQ4MP5H0g6KyYZw+z9l+VgyrYS35J+gN6d0vtpiSTTxMk/tuK5EQbOuC7+/G2VJDvo
	 hDtkqtA2zrK1bDULfqUU/7MmF461UVlD+2tbdOyVssRiPOdEV5UKdPFmyjmxZ4tCCQ
	 4+4IGjUxOirUg==
Date: Tue, 11 Aug 2026 16:21:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pwm tree with the rust tree
Message-ID: <ans961J686zSzNE6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Co0ONIovww4vJ3d/"
Content-Disposition: inline


--Co0ONIovww4vJ3d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pwm tree got a conflict in:

  drivers/pwm/pwm_th1520.rs

between commit:

  7488dc14b05aa ("rust: io: mem: return DevresLt from IoMem/ExclusiveIoMem:=
:into_devres()")

=66rom the rust tree and commit:

  b4e94b0418ad6 ("pwm: th1520: use vertical import style")

=66rom the pwm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pwm/pwm_th1520.rs
index e4387f4fedd9b,543bd8dea846b..0000000000000
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@@ -20,16 -20,24 +20,22 @@@
  //!   this method is not used in this driver.
  //!
 =20
 -use core::ops::Deref;
  use kernel::{
      clk::Clk,
-     device::{Bound, Core, Device},
+     device::{
+         Bound,
+         Core,
+         Device, //
+     },
 -    devres,
      io::{
 -        mem::IoMem,
 +        mem::DevresIoMem,
          Io, //
      },
-     of, platform,
+     of,
+     platform,
      prelude::*,
-     pwm, time,
+     pwm,
+     time, //
  };
 =20
  const TH1520_MAX_PWM_NUM: u32 =3D 6;

--Co0ONIovww4vJ3d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7PeoACgkQJNaLcl1U
h9B1AAf/ZdvewbvZ4HF/FBnZbcfjIct7jGOgVw2JcPBA0zY7BT74fFrl15UpTPEn
aXmryZqqgB9wg8nqeWa1XGI/n9Ww94DLsR8yYjN9ngaxofXKf2ZqpQ0FvqPgXdKS
Xy+xZRzn5yktRZtpbZj6ON+vP+y99q8BeeGXlXZvve6oqvXKtyWOANBjTWJU6HrU
vwWXUMd43HuxhGuLP6x4RtFa5OVLZzREyldFC6SL/mgtluW9QQe3wbBi/LU/e2ej
CI+tRsixBdi/rdAZRG49kGYkY9uc7qCiFjsCDq8EC8tNJ5+jN/MQxYBwALuLCGib
1Id4Tpe7sYIpKTHsO/3OC48xKrIWcg==
=Y0co
-----END PGP SIGNATURE-----

--Co0ONIovww4vJ3d/--
