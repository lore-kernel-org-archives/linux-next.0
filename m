Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75E48A2A3;
	Wed, 15 Jul 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130024; cv=none; b=UZiuvCcRTb0NsEwq1KZ6KaXQQhyH0ECYmjOFZOW720PDnMj3CCipVmVkETnqqrmu5tcyQXhX1Lhd3/1Uzdct6mqKXlMzR7l1eZWwg/KO1hs8ZNDM3BU88K2bg+B4a6n2OBwyjJO4CMBB7iSwmRQc+P6lEs0vOYI3aD4lwOpgX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130024; c=relaxed/simple;
	bh=SHVBiGTaM1++kAMcDdTYW6d7EbFA5z+U1ADVX1RpCc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HC0UE/IR9E3V5JGryYzQpvR60c+m8xiwb7wsXMVC3jNFasNvMDu3YsR7uApFtcMYrNH9yha8VoEYV5v4UsgZ0HxOmHtm7Zf8PMsbPPH6xJUjF3PLtQhOEHY8h9DrPeI+3rv0vimSjCFvo7q88+iJiv/UTSWFx13fkiq8VNgUVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFzabm2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFzabm2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2621F000E9;
	Wed, 15 Jul 2026 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784130023;
	bh=JP4LjW6euZSZAcJrb71mP3FQkVtfB6MbMHCOPkAMMVI=;
	h=Date:From:To:Cc:Subject;
	b=KFzabm2hyPkhE9j254lNcbgyW1JnwJNmdZOT7q6CgWnXlY4Kb5VDbsOYeip4dP1Qh
	 zoVL+HOZ9RdqGyw0yVhA6APxxb9OwhmGTmiOU5mt6873MdQ+qymoB+sa9gxiBppe8k
	 OthWYv9kq6j8IEuM0zcdxoDOzaBoX3jaGbVyhwLpJtIcChcmoXxI4WPZhloPkdjOxi
	 MZs2sxgZVoLRN2xsygkanep47l4QiZv7gmVBNGvCIWOstWWLDugApI3wCsznJYmJUy
	 FHo1GVYoHh3B+Avj2u/wNJrW13Sjq8q0qR4coeFLFkKmRic9Hkmp5rEn4pCD+diyw5
	 FFrnQ9dnjhoKA==
Date: Wed, 15 Jul 2026 16:40:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: linux-next: manual merge of the jc_docs tree with the mm-unstable
 tree
Message-ID: <alep4zhJYFTXqBe9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGWSj8scJF/8B0w/"
Content-Disposition: inline


--HGWSj8scJF/8B0w/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/mm/hmm.rst

between commits:

  3862d3b51eb1f ("mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap l=
ock-drop support")
  94e4afa33bac3 ("mm-hmm-add-hmm_range_fault_unlocked_timeout-for-mmap-lock=
-drop-support-fix")

=66rom the mm-unstable tree and commit:

  e834ee8e571d5 ("docs/mm: Fix braces")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--HGWSj8scJF/8B0w/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXqeIACgkQJNaLcl1U
h9B53wf/R4ykY+EQNCLBjg6Z2VRiKHWr5/wsjteT+tZIzq4CsnmVbnJzTsgXLnbM
XxAOOCtHbrrLGnAaBnoKZMH89XJ0Qk7ZzquprY28h0xWJZTYd8gmk0Uc6xvKtKy/
c/5U3RBuiYUNgQ3KKzXKgiAGMlicfXze2JGm7FA9q1ZOSA1VH2BGl0PzoL4wWWbA
T1J0XvDYuUsZNRlt0QlNnkfNOtw5wk0cVjiDAQM82tmAmONQnHT2iqLxIoGm7tAq
tKCE+k2yn6mBYIlI0+1cDYt3Ki+q2aF5Rl7yVcBIoyEI/eQBF329lVf8xuciVqf7
/+RUa0az3R/GUTbVKm3tQxfMCnvHtw==
=66Rb
-----END PGP SIGNATURE-----

--HGWSj8scJF/8B0w/--
