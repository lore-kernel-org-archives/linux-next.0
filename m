Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B86717B402;
	Sun, 12 Jan 2025 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736714698; cv=none; b=J8599uJPVcROJLrpW4LaJdmkdejd+BiBvYOcFLxzu1HOZ0aeiILP65QMmqtCITExgpraUkzvadfpOP7GC20zBM0tmG6PPhDzHgNaT5pA8moKt/As+Jaep+CQd2hndhAO7cpx8EmftK9ICGQ5VEI+t48Fhx4nCDSPcdru95iyrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736714698; c=relaxed/simple;
	bh=kHJywwyPPICGjlPysVXTHWrwuSkkJnXxhDXJFcU++GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UkMavCYW8IQc1h/RUng74qpmWAPJJ3v0F2x/yR3+nYPA44VdQ+n1CAXSOWk0nx30lQ/4VCzfP3pjn+o9ICcrTorNN2vix6DayrI7T6WqAL1F6ke4k7W1ev1C70FhRAQLHLZdNN/MWBdd+xI3Y2cMI69B5Bh3QmSOMxEkq+rqHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WyV6/NoV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WyV6/NoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736714686;
	bh=bRUfyrYyE2A9JyvmbniFjDMXRUxgY32PU/OPVZGlt0Y=;
	h=Date:From:To:Cc:Subject:From;
	b=WyV6/NoVDRJ5FYdDnqr0a9pM9dKGqnD5S6CX4uFTeoqyYVbDXCC8hPQx+nndj2KjO
	 dkCMvR0dGrVPSYhJVJ4dXTAXTKNpnPfFhBBl+Wo6pW4R1Wnv83OnHcECVnzuhGiXD3
	 /KEFisPNJx6hB9G0ZVPsp5MXsRodc6BpdvWiwx3fR3Css2M7nXndU94BG7r93KCTAx
	 K5Jlv58DvvSFFwL2kTtvr4TSrOtoUEYxWn73ekgE4nkrsZK4QDAA4Ce37wO38Chb6T
	 cMXOA/uEg3OqHf+hvc/jmxaHx8IlvbNb0Iq/OkmA3imgn2JRk4jZHpU72ms0f5f6J3
	 qlgSNxGVP56aQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWS7L0GF8z4x6D;
	Mon, 13 Jan 2025 07:44:45 +1100 (AEDT)
Date: Mon, 13 Jan 2025 07:44:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the stm32 tree
Message-ID: <20250113074452.6717a9a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4/ioi0UJRFeWZ7J_MGvqPLf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4/ioi0UJRFeWZ7J_MGvqPLf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  ae3d4abced05 ("firewall: remove misplaced semicolon from stm32_firewall_g=
et_firewall")

This is commit

  155c5bf26f98 ("firewall: remove misplaced semicolon from stm32_firewall_g=
et_firewall")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4/ioi0UJRFeWZ7J_MGvqPLf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEKcQACgkQAVBC80lX
0Gzufgf/coU8nrGwRr7hXu6BCnG/3F0FoUFuiraxHfiSlx7L+ZA5TcTBkzB8jRzT
HFNFpLTPpeAxUNGm/asZAO7GnsUJXAlDUlkGFM6A73mfsNUYMGQGFuWNHeXz+w2B
8y2xPYP6rxROdaLvXs2ZHBfG9lJL/xFfPXiiVuN1HXgd5I5fnWbrFyG5qw9uoatc
hsuBiAql1EOlYOqGs1Hc+EsZP5sxQ0SsqUBpOpxMMD5qNKZuHW37ZVo5GFsC5vOr
Fttf7ue4l37lKQ7yVsd3qx/nzOxyKod6kkqEuWgP/n+wliZUrwpnDV8m666hENG5
1xkF+KX+J7Osc9g52ddPBcuFb0lqdQ==
=Le6i
-----END PGP SIGNATURE-----

--Sig_/4/ioi0UJRFeWZ7J_MGvqPLf--
