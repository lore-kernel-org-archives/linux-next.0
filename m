Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6EC34405D;
	Mon, 26 Jan 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445726; cv=none; b=jAMfJqYJMsSnjao7JLta96gorXTaeWLLLRqnggDbNnvJo8s0hp7rznT/OB/JcoJmrF/EyeDHQEWYuBfmmZKz/nZzoUzxVbOMMi5QaRpDVOhclMMcqFvqdNmoDLvh3uz0wmN/TWkxlkxl4AO5p1ErwAfS8dRiVUPkCX09BWpTYTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445726; c=relaxed/simple;
	bh=5EezeOC0cOYa55SQClPn2qWCW7LFhnCw/i3eJZhnGAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIl3o7f5kTiDmbn3/ol58m0B8C2TUuOnJQ4KVd2zVFvf8yF9CwKiIDJ1S+0YFkeepNU9wj+6SPQ90zxdJZzfgboAL+93syZj2n+b7KMZiSMVLxTUdiy8HVa3YTx9pE37O3sqVGtc8To5szilJwofgxfrPiZBNAVAgF1bk5pdcMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHS/GKvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHS/GKvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACF7C116C6;
	Mon, 26 Jan 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445726;
	bh=5EezeOC0cOYa55SQClPn2qWCW7LFhnCw/i3eJZhnGAo=;
	h=Date:From:To:Cc:Subject:From;
	b=aHS/GKvRUMuYmPiK9TlM4mTeGq5hHSy67O52uuUDKLcsZrgqEoWJj2rtPIEINumzu
	 3+k5AQAUHodr+UZ7NufLyE5+L6U9sX9ofp6ouv5UrK0fzot2aWyVKjZL56w5kBhKyn
	 rsiuarHVROlT6NS9KO8Pm/KH+pte8pcPLCvZq1WLeSaqR2zZf3mIIn8XxkkPlnjzzg
	 OmhvFGFx7wh85ddn0OSNQk0iKXNjVwwEsE2s656myyL0DYQzEjkzs7XlsETF83lbOT
	 vgyE2A0pdu9TNBh8tWBO20yQ425quCZHyMEM6kiNc9Z1BGpZ5CVuNSnxUvDnGCr/0N
	 kp79ZJt7kMUQw==
Date: Mon, 26 Jan 2026 16:42:02 +0000
From: Mark <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the origin tree
Message-ID: <aXeZWtQK4q-wtprc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vL8NdYYD6IpAHpAV"
Content-Disposition: inline


--vL8NdYYD6IpAHpAV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/process/index.rst

between commit:

  102606402f4f5 ("Documentation: Project continuity")

=66rom the origin tree and commits:

  78d979db6cef5 ("docs: add AI Coding Assistants documentation")
  a66437c279795 ("Documentation: Provide guidelines for tool-generated cont=
ent")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/process/index.rst
index 492b808a69772,7bea184b73385..0000000000000
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@@ -68,7 -68,8 +68,9 @@@ beyond)
     stable-kernel-rules
     management-style
     researcher-guidelines
 +   conclave
+    generated-content
+    coding-assistants
 =20
  Dealing with bugs
  -----------------

--vL8NdYYD6IpAHpAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3mVkACgkQJNaLcl1U
h9D3nAf9FrV0AKpSll9/eVBaiatQTJ+mxAzLnD65JcXY9iPKCiksvCmgmLtV8AH1
RI6QonFWKK3Sb+4oRoAmPFAnwJPIOLmYDs66UAVmVtCgg75IgWODP4gRFTVVrEuK
zKD+mQ3bjNbI2/xPrYYnQPzcNFcXDF8D7tOwTbEi7HU7YdcGHCZ9sHwKwMV9vqiW
Bturkm3t8p2QcGn+vgGv7Z+dK7DW4Yq45gFSjnkOb5aY4A0rbwDVxJJk7o2p7AeE
3f9yE7vmZKS9Ds0r+70f92AGH8FSjmt4vvG0q3DTOiPfxgSG7BHYvi03vhJGWQfv
6ON6QC5b3ffc/5+Z7IRR4kmIkVqWTg==
=D7qd
-----END PGP SIGNATURE-----

--vL8NdYYD6IpAHpAV--
