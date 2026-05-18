Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8DB3EFFAC;
	Mon, 18 May 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101249; cv=none; b=QYIQt9Np/k6yCyJxWDFChVUv/uqodMa9+dSluV+LudCpYnC+Pekg139AbGImPG5jKz2skTcQ1pZ6LcOSEU+JRaVbJruKiWAru2LiWrvlP2BBqHUrbTL1R/0pfMc9MYsEuvVYsXP0Aj6h3BWGgUN9rA2WX6I2CtDbn+B4mSQ0Z7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101249; c=relaxed/simple;
	bh=VM6GZ94JFxymF0pqihho5JwgmCeo53bKLEHJSM2z8eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thOFtr14DP9t/P8WPUuJZqubrPChGplkdxuVdewMJr3bTZr4O2TlQD5uow4D+nGiQlLEXsnIWCSLeOsD6NsRkRRApuAXLTMPSuY8+SA8NJa1Pcsx+HMY4vszWHxhOa0RrEjeLFRX2Y/tmxmvVdqmaZSxY3Wu6EEKWmXiqM/Cx9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvMcLlqa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvMcLlqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEB5C2BCB7;
	Mon, 18 May 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779101248;
	bh=VM6GZ94JFxymF0pqihho5JwgmCeo53bKLEHJSM2z8eU=;
	h=Date:From:To:Cc:Subject:From;
	b=BvMcLlqatRZu7W3nmsPYMe/9qu+BOGapGMnHLbKcqDOztU9jIND7DXfoIXAsKRtnK
	 XKxa7x+nrMKZwWG5LEYhxr6b5CwnD+8QlHDCAuIEI4Jbb9ML1BFFwb9NY+LO37C5JZ
	 hXbmitgTKS+rW9+dXSSFb+R8YKGhPmvLfNJxBrT8Wf0zfXp52NyxVNJWYAwjAby3EO
	 tfx6+PGR2xtqwfdoYnfdvYF29ASQhPcjgYyuayCZX+TyGLUTexvLCThFMm5tixuvNw
	 5xGb/6HT50rllLJs6JIqy8U9KgLZ4lSeJKZPfT4vQ/rIeUjbVS2Joh6DBJg27hVJa0
	 rScEslnnp+EYw==
Date: Mon, 18 May 2026 11:47:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <agruPPybCx8q2XcJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sCJL3HbMx3ORKsMb"
Content-Disposition: inline


--sCJL3HbMx3ORKsMb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (arm64
allnoconfig) failed like this:

In file included from <command-line>:
/tmp/next/build/fs/fcntl.c: In function 'fcntl_init':
/tmp/next/build/include/linux/compiler_types.h:699:45: error: call to
'__compiletime_assert_614' declared with attribute error: BUILD_BUG_ON
failed: 21 - 1 !=3D HWEIGHT32( (VALID_OPENAT2_FLAGS & ~(O_NONBLOCK |
O_NDELAY)) | __FMODE_EXEC)
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
/tmp/next/build/include/linux/compiler_types.h:680:25: note: in definition
of macro '__compiletime_assert'
  680 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
/tmp/next/build/include/linux/compiler_types.h:699:9: note: in expansion
of macro '_compiletime_assert'
  699 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of
macro 'compiletime_assert'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:51:9: note: in expansion of
macro 'BUILD_BUG_ON_MSG'
   51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
/tmp/next/build/fs/fcntl.c:1172:9: note: in expansion of macro
'BUILD_BUG_ON'
 1172 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=3D
      |         ^~~~~~~~~~~~

Caused by commits

  3adfed795a99d (openat2: new OPENAT2_REGULAR flag support)
  6703991ad3a35 (vfs: add O_EMPTYPATH to openat(2)/openat2(2))

interacting with each other.  Due to complex conflcits with netfs on the
old vfs-brauner tree I have applied the following fixup but since both
commits are coming from the vfs-brauner tree it's really not a merge
fixup:

=46rom db4170bfa75dbd45e3f2e1a03f98c512fb2409b7 Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 18 May 2026 11:26:07 +0100
Subject: [PATCH] openat: Fix collision between OPENAT2_REGULAR and O_EMPTYP=
ATH

The commits

  3adfed795a99d (openat2: new OPENAT2_REGULAR flag support)
  6703991ad3a35 (vfs: add O_EMPTYPATH to openat(2)/openat2(2))

both defined new flags for openat2() but used the same numeric value for
them, with the second commit also using a different style for
specifying the flag (shifting rather than using an absolute value),
triggering build failures.  Deduplicate the defintions.

Fixes: 6703991ad3a35 ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 fs/fcntl.c                       | 2 +-
 include/uapi/asm-generic/fcntl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 240bb511557a1..7e953d4a807de 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -1169,7 +1169,7 @@ static int __init fcntl_init(void)
 	 * Exceptions: O_NONBLOCK is a two bit define on parisc; O_NDELAY
 	 * is defined as O_NONBLOCK on some platforms and not on others.
 	 */
-	BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=3D
+	BUILD_BUG_ON(22 - 1 /* for O_RDONLY being 0 */ !=3D
 		HWEIGHT32(
 			(VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY)) |
 			__FMODE_EXEC));
diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fc=
ntl.h
index 3c6062007b26f..c4b0e7153fa87 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -93,7 +93,7 @@
 #endif
=20
 #ifndef O_EMPTYPATH
-#define O_EMPTYPATH	(1 << 26)	/* allow empty path */
+#define O_EMPTYPATH	0100000000	/* allow empty path */
 #endif
=20
 /* a horrid kludge trying to make sure that this will fail on old kernels =
*/
--=20
2.47.3


--sCJL3HbMx3ORKsMb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoK7jsACgkQJNaLcl1U
h9A+Cwf/Z4nxNRpCw9feVqbuk2dIZBKSnF1I5SEkBeY8oYU+ftdKlB0iTeh0AUNc
x6ZyeYg7P3UoptZjHSCJokkF9P8DCsFbljcACXK68mo6/tbl/mfu+o8FlmtSQS+d
2sx91zmcynPaOETeNZJd9Lda19e/gSsZ0ZGAx/7BGhQmIqUF5VidFSvVe7wjUhYG
OiIvLd3dD7zSK3cyipTt8SApE2cZsrbLobch3IOgWdT3LMe0x6CBOaK783dm+bZB
KwcmvGtyJmCxKqWK2Tyv963JQoe+UYMeqtJrID+F9R8W7BficpPirTIVewI41Olt
Czio7U7neCi7H0uRuf5wEOr5I4dH1Q==
=Al3a
-----END PGP SIGNATURE-----

--sCJL3HbMx3ORKsMb--
