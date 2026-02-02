Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E77366DC9;
	Mon,  2 Feb 2026 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770038316; cv=none; b=Mbl8YS0CyTblIZgba6RD7JI1HIa9JVA74qEozCYz/zI3JT990i02yfZ+hrjQCXoxfr6VbU/NUcgJkHihH4xkXNr7wAkI+ux0aLFOvlrou0aStmyaUA3zI7wiVjci/ZG69da8JHHU6RWEr4P6KFPz984kRpU2/zMHdQRe9YURGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770038316; c=relaxed/simple;
	bh=mNY9eGMOE728Vk8/c5tmFPwvHF9oFtQEjdkhEbgyO5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbMIDeOf0GM+5OieOKY+t7IwAylAqEPUwzhg2/zQCp92VFhEnLNghmAr4dDG+SCr/qZJMHwSW3fRAeKtdTmZbIlsr+HdQ0WnBQbjYRQmpSzXI3Y65MKUT9Teshuh6zF6Kft1ay3R00c08X1nSoTyaTT4MI96mGV05Xj73neS74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoarawFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoarawFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CD7C2BC87;
	Mon,  2 Feb 2026 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770038316;
	bh=mNY9eGMOE728Vk8/c5tmFPwvHF9oFtQEjdkhEbgyO5U=;
	h=Date:From:To:Cc:Subject:From;
	b=IoarawFTzWWAgRFEm09VdlAo9IV2La6DI8YFdZeBI0CzqtYYpBr+2UQlZ3HuTVV1M
	 lUAK+U7yvvs9LFSyJJuglc6zBXdwqPemT0kZsaRwLIHep5m8zWY8aQT28j5tt3Od5a
	 4KzVsx0kCJG2EqgO68gxZZiYvFoNOVFYAGBsczapDHX961dHj3pM/wzi5ag2j+ZtF7
	 CmUXAG6/1/vQs8658SKpwi1DsDMbp/oGDfPhVlCaafEvKXzD5RSuwH0ZY31HtcKV4x
	 x0L2R2GaC4nZk6VRkj0z/nnGocqvdzS6/MdpNqezvCH3msHpSooF84V/vnv+higjk8
	 wyspDlahjOQQQ==
Date: Mon, 2 Feb 2026 13:18:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Brian Masney <bmasney@redhat.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mips tree with the at91 tree
Message-ID: <aYCkKJ4sW3wTbCJr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9XFyp92X22qtvbdj"
Content-Disposition: inline


--9XFyp92X22qtvbdj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  drivers/clk/microchip/clk-core.c

between commit:

  69ccb0f338ea0 ("clk: microchip: core: remove unused include asm/traps.h")

=66rom the at91 tree and commit:

  07caa83edd9a9 ("clk: microchip: core: update include to use pic32.h from =
platform_data")

=66rom the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/clk/microchip/clk-core.c
index f467d7bc28c87,ce3a24e061d14..0000000000000
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@@ -9,7 -9,8 +9,7 @@@
  #include <linux/interrupt.h>
  #include <linux/io.h>
  #include <linux/iopoll.h>
- #include <asm/mach-pic32/pic32.h>
+ #include <linux/platform_data/pic32.h>
 -#include <asm/traps.h>
 =20
  #include "clk-core.h"
 =20

--9XFyp92X22qtvbdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmApCcACgkQJNaLcl1U
h9CEzgf/UXzfKsSLnJAORVtvIfQIMlXb3o4H6MxQztlHR4byk5FlIUpyTOSlUw61
KPERrneocpzfYewCsg1lcAq1OmcBECcIVHiwysl+y5IWMNG5ZbqshWx2SfXntfuU
MhxI/Ppc5gBgFdZJGiBawl76YlgsUwTp3JxqOULlUHvHTCCj5smESn1zJ7ToE2uM
J64Ww/CzMFuewlB7dj0BeLWCCZY2G999MujBYhDn2wRoilah0uu9PYoYnzHyfFAX
tVP4zOEwwwUoAvu/TjUvWkySNVSlmSoRkGgQzmZUxQgfCmLchk+Z3FkpJEWrZLO/
QxbtKvxcd0q6ph7HRSA6LNo1oLF1EA==
=kteF
-----END PGP SIGNATURE-----

--9XFyp92X22qtvbdj--
