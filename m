Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE03E1201;
	Mon,  9 Mar 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071882; cv=none; b=p2tbsWgoBp+GLzOLBL3OSnayQlF6ZI+40hhsmfCjif3J2ifJYeCzHE1iYQ3xTljO73Vihd39jRYEer2/nId7SUHOeagRj4kVZnNq68ee+kW2Osf34GXeYRO1kkQUkCYa4mS3c3gXpYOO80LpgrDLqwhoZhxIKYdRotCXgV59DgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071882; c=relaxed/simple;
	bh=t7I/A086PHf5VX3OYJsJLwYlNT3Koq5gTox0mi75ivI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jR0uAsRHdBp9cgexuhoaOcbbMKJNMuNrTOqZVKilXS4i/p5CNx0MDP3QXYja6N0SmOCsydqXQ8IFbyW0NfLj0PuUvoZcWWEgxR0t6pN+/8lBcjtP81T9a7vRXo9amfKuLNwwkz98adAeWI80BNmrhWcnnZ2w4Qgamsl9JJ00J8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMa7N7bL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMa7N7bL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E251C2BCB1;
	Mon,  9 Mar 2026 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071882;
	bh=t7I/A086PHf5VX3OYJsJLwYlNT3Koq5gTox0mi75ivI=;
	h=Date:From:To:Cc:Subject:From;
	b=MMa7N7bL2HbdqoBfSH2mKu+vmETlBVVqIOM2hgnfZO7f2vvRM70CHalzv12dS1TTr
	 4KiXYcnJsr0L29iOMjIthwGMXzLVbtfHZdHI1noBqtV6CdR0HshlH/CrVux+9OGAsC
	 GBJuzeKWmxYCymjTGzKcJLhSIe/zDn12+Ej0yWic2fDrGD91D3dP4z8Hf9H7HfJrxQ
	 gHdEEGKdJhMKtiIsJSU1dvvi1uRaqMsdkkngCOjcc2ZQ+NN4AAFZrI6bs9mIvZPHQz
	 Z+8WNXSEO/5snI/HY81Y3n25ePigLTL+x11ItT0SVBHBxY4L2akPWVvACQK4WzEPOK
	 tBMdp18QM5lOA==
Date: Mon, 9 Mar 2026 15:57:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: linux-next: manual merge of the libata tree with the origin tree
Message-ID: <aa7uBn7h20yFEUF4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpRZPfSLlEX5mcrx"
Content-Disposition: inline


--CpRZPfSLlEX5mcrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libata tree got a conflict in:

  drivers/ata/libata-scsi.c

between commit:

  aac9b27f7c1f2 ("ata: libata: cancel pending work after clearing deferred_=
qc")

=66rom the origin tree and commit:

  9a5eb2adb1ec9 ("ata: libata-scsi: simplify ata_scsi_requeue_deferred_qc()=
")

=66rom the libata tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/ata/libata-scsi.c
index ad798e5246b49,4225c6d7ff359..0000000000000
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@@ -1694,15 -1697,10 +1697,11 @@@ void ata_scsi_requeue_deferred_qc(struc
  	 * do not try to be smart about what to do with this deferred command
  	 * and simply retry it by completing it with DID_SOFT_ERROR.
  	 */
- 	if (!qc)
- 		return;
-=20
- 	scmd =3D qc->scsicmd;
- 	ap->deferred_qc =3D NULL;
- 	cancel_work(&ap->deferred_qc_work);
- 	ata_qc_free(qc);
- 	scmd->result =3D (DID_SOFT_ERROR << 16);
- 	scsi_done(scmd);
+ 	if (qc) {
+ 		ap->deferred_qc =3D NULL;
++		cancel_work(&ap->deferred_qc_work);
+ 		ata_scsi_qc_done(qc, true, DID_SOFT_ERROR << 16);
+ 	}
  }
 =20
  static void ata_scsi_schedule_deferred_qc(struct ata_port *ap)

--CpRZPfSLlEX5mcrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu7gUACgkQJNaLcl1U
h9CTwwf/fSQgzOR/V7LzHDDEbGrZfqzmYyMwydd9ddGoo49azjt3iLysB8rnMbbG
NQkk/W0lmxM5sa6W2I0KiuMVed4Q/UqtqVKhirhRj1Z59ko3O4+6MTcuQlV+5TbO
1OPBS9cY6lWbZPIqo4ExIHmf+nZ+uAg4ao2bssdRaJpiGXIMKRewHYy8HtzFczor
6hiHqbK/CObTFBlBqhxvvY3XAMQf2k+LKiMAswgcatbifyXQFeSFYLtRf8Ygm6iY
RiwUrJQcaIlcpa3H2Yj0t+fgxNVJrAwEnzmvVNnISRT5DX1+pi65rLTi8b9jYe+9
Gi9IFdZmOT0UQPKpc2bWBR/CWUB2jQ==
=KVbL
-----END PGP SIGNATURE-----

--CpRZPfSLlEX5mcrx--
