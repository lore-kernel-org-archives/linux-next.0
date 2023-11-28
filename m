Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a1RLbDZ1"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A001718F;
	Mon, 27 Nov 2023 18:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701138830;
	bh=2NEKrV25skME0djfpzvzrt8UkkMVPNSDD71pdqpYz54=;
	h=Date:From:To:Cc:Subject:From;
	b=a1RLbDZ1Jku6Td+kWzKHUhh793r9et/sT14kJH24lNvpjorB2qJ74fGVIilsJY3qj
	 m1pv8tLm6dJJQ/4xAY3+eZWZPH9yqiefF9sNnSi0loMrfMjt/QvPZxefJ91bLckPcL
	 YbKiZmun5GsSWu4cYKeU/W0IZ6u1bkK2+buryZYJMor4Dx9eeDX4gJI9I/9Fua6Iiv
	 nXCwbjaPKteElW8qu5eFGJuzx2arCFxT9H+sIu2faL8NkyYPRhFrAjaPeBlYr+n4/T
	 qMA68SXuBhjvvz8EldS1qRfFhns1jv8CIBCR5261h8VooT0zKeSX0ZQiDy/pd/R0bu
	 DwWPAwEyf6NSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfRNF4XVkz4wcj;
	Tue, 28 Nov 2023 13:33:49 +1100 (AEDT)
Date: Tue, 28 Nov 2023 13:33:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20231128133346.74e3ef04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1M=UPsPTMmwHs5piAeunq9t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1M=UPsPTMmwHs5piAeunq9t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc allyesconfig)
produced this warning:

arch/powerpc/kernel/swsusp_64.c:14:6: warning: no previous prototype for 'd=
o_after_copyback' [-Wmissing-prototypes]
   14 | void do_after_copyback(void)
      |      ^~~~~~~~~~~~~~~~~

Exposed by commit

  c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")

--=20
Cheers,
Stephen Rothwell

--Sig_/1M=UPsPTMmwHs5piAeunq9t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVlUYoACgkQAVBC80lX
0GyJvQf/QdU+xhWFsKVBj6OkKYjKV1OVmp93MborX7w2b7qICWr25SeHnGSXHJo4
ogu6VF9WiXzds+7yBbeYNyQNGj+CVoRP44yDvCQbg5HUBhae0KjMzlNrTCoZ9RaN
ka6pa9NA/n8+cL/L3RAWkGWnYGq+8UVRGi3ZGLBmYrHqBIfnPyx9/avAss2eYd4+
ls+CtCDNbtZWisrn6JQ3FgeVFFncgBQ5oyI8Eu9IBoiucQ5fJrhHgtiNwwXjqGrk
cG+y1w9Oo1YtXzeP11pCsLzeb9gP8pEz993lQHtSisSGxP5HT+ODtsTgdyr2NzAY
ltLLUyV834g3V/JL/Kc0q7oqVesdJg==
=FRcq
-----END PGP SIGNATURE-----

--Sig_/1M=UPsPTMmwHs5piAeunq9t--
