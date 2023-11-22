Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y96cfWch"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA61181;
	Tue, 21 Nov 2023 19:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700624895;
	bh=3XdM1R8Y2nx5+arVWGSwbDjOVvQdWPpppUUhVOCtl14=;
	h=Date:From:To:Cc:Subject:From;
	b=Y96cfWchw6iSwmO/tYRvsAf8ancwyrEMZXtvzQQi6Aj/RxYrA5xnQ/w/1lS3eL7ei
	 L47zbSq/9nz9h7JrCqzAp2AnaqhFK49EBxCZ8caJnedepowSpKt/p05qICPF05Ti2f
	 BZxjVYHriiRXLAmFHNbXBCaYDPgzVuvn7DBPppumpyQWBFi2pcg8rn7+Ea4GYbjXxK
	 9KfaKiaR9Jnky1/JHlIZgB3zwgoK2eTQQCchPFaTzFWwJTx85oYWkbhJeiqo5ewEr0
	 TtdOTbrrD+6zN8evOMKAl8EONLv2GVq9/4zWsGvzJYS1pB2GPraofp7nnFOoKi9Zx+
	 /1tdXoo2IeTXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZnJv1bqNz4x7q;
	Wed, 22 Nov 2023 14:48:15 +1100 (AEDT)
Date: Wed, 22 Nov 2023 14:48:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the kspp-gustavo tree
Message-ID: <20231122144814.649823ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XJ+XAHN6Y5cnORlaVQ3=xfT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XJ+XAHN6Y5cnORlaVQ3=xfT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (sparc64
defconfig) produced these warnings:

mm/mempolicy.c: In function 'mpol_parse_str':
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:3005:29: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3005 |                 *--nodelist =3D ':';
      |                 ~~~~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:3005:29: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3005 |                 *--nodelist =3D ':';
      |                 ~~~~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
mm/mempolicy.c:3007:26: warning: writing 1 byte into a region of size 0 [-W=
stringop-overflow=3D]
 3007 |                 *--flags =3D '=3D';
      |                 ~~~~~~~~~^~~~~
mm/mempolicy.c:2890:26: note: destination object 'str' of size [0, 92233720=
36854775807]
 2890 | int mpol_parse_str(char *str, struct mempolicy **mpol)
      |                    ~~~~~~^~~

This is using gcc v11.1.0

--=20
Cheers,
Stephen Rothwell

--Sig_/XJ+XAHN6Y5cnORlaVQ3=xfT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdef4ACgkQAVBC80lX
0GyJ9Af/dG8FxlpkxN3jlp49pRPhZfc7k/q4QoEFb+Wzex5OQudaEDbjp5Iut1z4
PLCni6FSzGvcWqNa5G/qFjEkwEXSSW0GgmbX3kOcXY+DXegLQgORgvpijNy63sI4
T6JBcbSV6pzcuiPnZ/csq0KLZNs9GbaPqwqhttX3OvT95pdtaVY/HTJ96niUlgC7
YsbmkCOhUWeI6ZIaBB7nUD53mtAA4VOKCnAhmWbImaH7hf01xeGPRvXYcDO7FFAZ
5tlrv69cgzfWS5fgeY7a1ohqB73JNCy1HBhxmMfG4Rx9bEKD0YP2xGLthCie5eXM
8VUaC5dsR1RTNviRgTTQbEZZjGV/5w==
=egA1
-----END PGP SIGNATURE-----

--Sig_/XJ+XAHN6Y5cnORlaVQ3=xfT--
