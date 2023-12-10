Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T9NmM6Ne"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B79ECD;
	Sun, 10 Dec 2023 13:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702244941;
	bh=rALDMGt+U6gyY02J9/Y6CdwKRw53IpUSmmmG4YAD75g=;
	h=Date:From:To:Cc:Subject:From;
	b=T9NmM6NeypwMze/ohV99IiEeZOo1dhKdTZ+MakWfqER+9JHvisLFCxq+BMKvUilHI
	 fVr+b7hQYY992IRmwf6IGLyUjNX2ltoKmq/nk4dU8FpMnEfieLZ30GttoPhmYHpmVe
	 dggXg0Xyb4J48o99/EsIQs1qpaQCIWx489+hqnBbtfFVkdDukb0muyU6BRVl9bVAQc
	 vvmCZMBM8cjckPUbFZJgsrY8W3cmAexItaSWb16vVQEcHOL6+IuuTCqydU1JEHXXqV
	 AUJgPkPhuyP/drdBa3sUW5Vmnp3bz+w6ECHKJ1XqrZGRaaXhPNpE2IgYMqbg0Zjkkb
	 g5whGKyP0hjBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpJRc3S65z4wdC;
	Mon, 11 Dec 2023 08:49:00 +1100 (AEDT)
Date: Mon, 11 Dec 2023 08:48:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <20231211084841.11b2ee48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qmL48oUYZm2Dzxwej8HAYC=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qmL48oUYZm2Dzxwej8HAYC=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  05349b48e254 ("nvmem: Do not expect fixed layouts to grab a layout driver=
")

This is commit

  b7c1e53751cb ("nvmem: Do not expect fixed layouts to grab a layout driver=
")

in Linus' tree.

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/qmL48oUYZm2Dzxwej8HAYC=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2MjkACgkQAVBC80lX
0Gyb+Qf9E8NwtXQWtApN3mNHXu1dJz3DxbaTP6Vj9Qjs2dxv2Zc+zR8tok22EYdf
OQaL3J4fYegnbUx/1ISWYzPyjZWGD8zqQWeW8Jrdx4DCqPxnDTA+XqvD1njeKcx/
Zi9LCrJNo6/9FItnup0sQP03i7SBpvqT3dcMxp1VERjWDUbNqtpZ1Mkp/Ngs8Tqh
ZtMCdtMbz1q8oqDA97kEIODtuBKz1SBAHOW04JFhP+bi0tUYYwb2O1Y8wA1Aj50O
fFPpJ7qapSkSiAY7Hy/JBtMz/ppoxpeQXVBzsn2ZUdANwoTP8T7lyegPu8piGZR4
2pK/NZtCkS2c9ppUn+G5LNmSYRYgJQ==
=ATia
-----END PGP SIGNATURE-----

--Sig_/qmL48oUYZm2Dzxwej8HAYC=--
