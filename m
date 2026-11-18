Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012661;
	b=H+IEs92/JNtnN8+GhGO1poH9Ha6Uayo+FgBRd/BXPkqVj/2Ak1OEKmjtl+vhkC126tix
	 9b66VK8Bl6TsLdx2ZHxZwLl6y/HC1FzY8mOM3y+PVrprEeS5C6C98Mb94ATFg02Vgl4Tp
	 RwtAJonP9SPupZEWRcQoTGitZMyDuCIkLuW1jKgXeU95ZUiOCvKvjlX7rH7z5Cyb5hVPO
	 PUfdnsS2eO+te2KveOIunNjl0w3x1WWMWRPJZE4Q960n3lmQ9Oa6tzLNT5NIN3lzpdDoX
	 I/nyA9ehuu60JQpCBbqAqTRkRaIUnXqre5pJiS/7Q9yPc45Ek81tgqDmcfAOC+i9O+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=M8S88rZuNHpGn0XPLr+/UWjHCI32uW3us9gY7vMCoXg=;
	b=EHVaZMNmj/DpL6ypqArTrHL6LCDQH2tN1bmXB+PprcCZyxOPZXaqMOawesLSKbfnUkz9
	 NMp/wWo43nedl7gcsHkU6Xcs1se08KHKahMCN+DThbgdtApqM1CspF4Wb4rN1rc9eqoit
	 I/hEb4dQ06FF9xJXp3el6hj5L096ScvcqGmkhXOVmPW+RWfHU4DktCi2HQ7WtWL2OTvtN
	 Ej5w3ECx6+4kRu1mvAGrE7S55YulRC2IiNALKTunvmkNvRzwnObncBo8Y5Ljn2KeHmwkn
	 KE7wKxuGmB8JKBW0knbZFs8NeXSqB9mvR6JI80MY7ojbR8L/r+pdmQJrKRWFZHs8oAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcdYtCDI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDBA606A33D;
	Wed, 18 Nov 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcdYtCDI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF771F000C4;
	Wed, 18 Nov 2026 14:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012661;
	bh=M8S88rZuNHpGn0XPLr+/UWjHCI32uW3us9gY7vMCoXg=;
	h=Date:From:To:Cc:Subject;
	b=LcdYtCDI8cX4enYOJL7MX8xDNT9Ax2YRAK0RXvZ/bat0IKtuRMaxvjH3wH6jBma24
	 KJWV6XNMVjpLJ0Vff4nm4ewsK1iOJ3m7Aweabl1/Zv/ibbXdh3MmwoIIusSeCBxpPU
	 KWq4NmKWTAxGV0PI8k+DVWpLgBDX4I7Or2gK/0ANC/l2WvL5aNs7lVMRSLkM1K9s6u
	 Ws1wS9O43v6Ax+plqlQ1ZlatePKxIFWxu822ow0qD3JzEOZQyJCxHYmYIesc3dfCEO
	 cp7P/5TakyaTAAJXBlKJK7PgKD4GdOQ8hvit2u7eaFw7cP4EFcvFQHrMAnheq8eZ+q
	 S7cbr3+vI7F2A==
Date: Wed, 18 Nov 2026 14:37:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: linux-next: manual merge of the mtd tree with the origin tree
Message-ID: <av24MbMORkbY00UX@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="LWngBwPTqKzJkmYo"
Content-Disposition: inline


--LWngBwPTqKzJkmYo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mtd tree got a conflict in:

  drivers/mtd/maps/lantiq-flash.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  fd1cc5b1dc4f2 ("mtd: maps: lantiq-flash: fix NULL pointer dereference on =
probe")

=66rom the mtd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/mtd/maps/lantiq-flash.c
index 519126abb9a5c,5c2ace302b50c..0000000000000
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@@ -118,11 -118,8 +118,12 @@@ ltq_mtd_probe(struct platform_device *p
 =20
  	platform_set_drvdata(pdev, ltq_mtd);
 =20
 +	ltq_mtd->map->virt =3D devm_platform_get_and_ioremap_resource(pdev, 0, &=
ltq_mtd->res);
 +	if (IS_ERR(ltq_mtd->map->virt))
 +		return PTR_ERR(ltq_mtd->map->virt);
 +
- 	ltq_mtd->map =3D devm_kzalloc_obj(&pdev->dev, struct map_info);
+ 	ltq_mtd->map =3D devm_kzalloc(&pdev->dev, sizeof(struct map_info),
+ 				    GFP_KERNEL);
  	if (!ltq_mtd->map)
  		return -ENOMEM;
 =20

--LWngBwPTqKzJkmYo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9uDAACgkQJNaLcl1U
h9DhJAf+LH7UixCB8AKWSxd361pgh3FDwzOMh/OAfG268cfOd9crdFjVl7iZB96J
6P7jc7pKKqh3hv0ghuuRfkGUWmhZjXbG9CYt/yDe0lSu69TZRuLerbYJNPXYNQmr
PlOP8lt2j25cFZx1ndmSZ6S2nzBe32vOS200NBLlHzMJRn2VLJszjg53mtwOka/t
el6LtrQhBq9I2T63RrHe5WCvH3alRpBSDswKdE5ybnbn+ffUbVDVJ1Z1EX88FkJJ
1lJJN4nn0NCTWqTmbKZ1RtHq4cbJ3jbPcLlWCetPBqOxSmnlI6qQ+0byorfctEK3
4Sjec7AToi2JaHaN4Yjse6rmcEgr8A==
=XSA8
-----END PGP SIGNATURE-----

--LWngBwPTqKzJkmYo--
