Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190620;
	b=sqf736BDkfG2uxCUeXme2OrSnpX9vimGcthCrNly3qdLU6a87pWkpUidvT0VifTW+3mJ
	 cfzxYck76cSy7ihtvjNkMrcGE22duXc6IRUklNiEAGzIqMWbfnBypctjQkC2NiS2gYjim
	 yyI/m1SQvlvkIrAQabjpd4xvuBX1R1RU5+s9MPUhKm2+fFTkrtTz4/q+UvSTfLvwyleRt
	 Pr65N3xI/+tphlre1sFMBIzSrg+1cMTrE79ww4YAnQU/oIU938AGeFifMGsunU+1Bv9FI
	 pJ8hTKBKbRiPt+dIg1CXplz78VioZkfivtHSV9kyD5yzK1YQ+DpKcBmXo3Cvb5Lhssg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190620;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=X73LCnuSZsg6VLoBZJGHQY23SQG2QBGJyVh34O9fiVM=;
	b=Esj1KH2xDFktJ0Fa0ExWOSCbJ7jwXQlb8RPxHN2cJgP3M2WuAt2DHptPhk/lqVJYLn6N
	 W6DMr0E8LvrQcnnpKnLZZYIZqyYIajxDPRnCzTDpSw3kUzsDzQhZD2gnYkmssTXo8Qcok
	 zXLoRjkFAqVWKShmxViAqPaM+HPaxo6/z3qG57ThGKKHFmRyX1j4vPAACE5syrMKjdZH1
	 uCrGfAoQUwfohuZ+3yOkC883ptknVhBdjq4y2nug3X72OCPAWV3L7qEGh7BPV/iI7SqE1
	 7Sp1gAdkDmj6BZGqHLlagg2EQz34z3PFgr1I1gP+NXDnLFRDbAs5WKH6OfCmGPjl2Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8ppFtMA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7B606A325;
	Fri, 20 Nov 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8ppFtMA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1552F1F000D4;
	Fri, 20 Nov 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190620;
	bh=X73LCnuSZsg6VLoBZJGHQY23SQG2QBGJyVh34O9fiVM=;
	h=Date:From:To:Cc:Subject;
	b=M8ppFtMAgOpvo5/aLDuw/dVlrBXd9utk/ZJdD7tqCKEVkb9V8H2XKpuoDVQF9aab2
	 ALstXjeBmLTyk83J9XQnD/57dJrvfSfIaPGoD5aaPdHN+8VBAAE+ThYTJPOvj6P2X1
	 C+WiOqQVsuqFDmDsALjpZr9hg3BjoFE1tYHPeoCfN0Vr+dHDRcSc8AoUK7hf9rdSV5
	 lPCLnew1FObncZ0CEG6N0+Ltx1qR7l6//NXlqDVqdVmjV3nStQlDpswtKg34XXOfek
	 ecaSplptUKTX/jv0sgym8lMb6wY5S/HY1v5J7P3bKrNEZF0ytocCjE8umTTNcifMtl
	 FSkL3UwwQ28Jw==
Date: Fri, 20 Nov 2026 16:03:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: linux-next: manual merge of the kapi tree with the modules tree
Message-ID: <awBvWBjutFNlHyjz@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqaLz6F9V+nqTIWc"
Content-Disposition: inline


--pqaLz6F9V+nqTIWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kapi tree got a conflict in:

  kernel/Makefile

between commit:

  b6ac4f250ef00 ("module: Add stubs.c for CONFIG_MODULES=3Dn module_put_and=
_kthread_exit()")

=66rom the modules tree and commit:

  ce4c52682d78f ("kernel/api: introduce kernel API specification framework")

=66rom the kapi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/Makefile
index bfa7ecfd07d82,7fd43127d5eee..0000000000000
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@@ -58,7 -58,8 +58,8 @@@ obj-y +=3D liveupdate
  obj-y +=3D dma/
  obj-y +=3D entry/
  obj-y +=3D unwind/
 -obj-$(CONFIG_MODULES) +=3D module/
 +obj-y +=3D module/
+ obj-$(CONFIG_KAPI_SPEC) +=3D api/
 =20
  obj-$(CONFIG_KCMP) +=3D kcmp.o
  obj-$(CONFIG_FREEZER) +=3D freezer.o

--pqaLz6F9V+nqTIWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAb1cACgkQJNaLcl1U
h9Be3wf/dOjc9Ye0t2ZDv38ce0F1zJdydRzC/kKqk0IE33jFRZsW/xwGPzVAU40R
WGqDz6lBmCuY+jgXTYG63xp++e68mR4RhRvEA1QP5UDKzZNZyGR+cfWvwOEs1mCa
VQxWBgP5qZtux7SxzffQbHdVPEg9B7ZMwmSZhxBSnkIFOWZBAsL0WiRUrU0RVGDI
DZZGIuwFSPbwTm84uxBsUQmCpxZGtoNRLEUubnMWSyhmUZ2WqZmLL50RNWHK/ctO
TcZQSG+90W4dPB5I9ryL2EqTlBGi926oMKis4HX5HID+KXm+J36gmju410fUasNF
UgyaLFG43U1iYkszSW+4/Ka0NAzcNg==
=t64S
-----END PGP SIGNATURE-----

--pqaLz6F9V+nqTIWc--
