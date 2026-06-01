Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF562D2486;
	Mon,  1 Jun 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333165; cv=none; b=WTvW5X3VZeybAQGo1+lOUZ8qQJaxigjs5jvzIWX5e7t9k/pLgm54jK31PpdeYmlPdScbpskv0rNIo7tNKc/f9yCOe75odSultZEhGZZx5p0NMjHmBdHJVDoLwev8JN375s3xqykWOIdLhLfbh8Ez7wW2R569thPPonBwDJcqUgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333165; c=relaxed/simple;
	bh=St8+30md0jCPZM9FKWSxFSDrE6SDOug7CN0whS8MoCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1vjCOkx6/iLlWk92a08G8koeQ0wCjASIPNhroH2uT2afui+0o9zN3dof8hVrQz7Hc0JBqcW0pR1pyjav4DN6PFH7cd/17ZxQVYsoBB+IFzLKviHo1Jack4a8hlL0igXdsmh90CMeE7NMx3HPKlpV3lrB5/jmk0hfZyAPtnjB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEy2hTOH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEy2hTOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158C91F00893;
	Mon,  1 Jun 2026 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780333164;
	bh=Wa7AkSV6hiPnPEheUhSOd+HW3mBsmk1li2aq05rWHWk=;
	h=Date:From:To:Cc:Subject;
	b=ZEy2hTOHkMR7MYumOyk/Y5gEk6zMHxPKEMTWTL8dl1Uc5DIRPSFpZdJ7xiqakW3GD
	 j8Dius6vg87emRZDu25XIGci1hvMelo14zf5ELIk9U4DmwUyGMp0pBQqMpMY9x3doR
	 ljKvZWzwQMhkQtF6moR592u555wdJA2FuSbX8WNqR9n6MhdXHkGpPkLX6jRRiAiIHs
	 4YE/LIBExj/BS2iQW0cNDczb2R2w4aY5qcvjsYgnmk4sDwkkQjfRITZouuhsKDqXWm
	 4kpVxqBfWVdJnXYIfFVoM+4LmZw1PgvwTsGAorutClb3+sUgle1VuQeso/mhJ5XKMe
	 GmEhkL5NglepA==
Date: Mon, 1 Jun 2026 17:59:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: linux-next: manual merge of the libata tree with the origin tree
Message-ID: <ah26aP3LlYp0gxP7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JL5kkwoEXDKoWL2h"
Content-Disposition: inline


--JL5kkwoEXDKoWL2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libata tree got a conflict in:

  drivers/ata/libata-scsi.c

between commits:

  759e8756da00a ("ata: libata-scsi: do not needlessly defer commands when u=
sing PMP with FBS")
  360190bd965f9 ("ata: libata-scsi: improve readability of ata_scsi_qc_issu=
e()")

=66rom the origin tree and commit:

  374a9cb4bd6a0 ("ata: libata: Pass ap parameter directly to functions in t=
he issuing path")

=66rom the libata tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/ata/libata-scsi.c
index d43207c6e4679,0fe7ffded6e24..0000000000000
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@@ -1677,11 -1676,11 +1677,11 @@@ void ata_scsi_deferred_qc_work(struct w
  	 * such case, we should not need any more deferring the qc, so warn if
  	 * qc_defer() says otherwise.
  	 */
 -	qc =3D ap->deferred_qc;
 +	qc =3D link->deferred_qc;
  	if (qc && !ata_port_eh_scheduled(ap)) {
  		WARN_ON_ONCE(ap->ops->qc_defer(qc));
 -		ap->deferred_qc =3D NULL;
 +		link->deferred_qc =3D NULL;
- 		ata_qc_issue(qc);
+ 		ata_qc_issue(ap, qc);
  	}
 =20
  	spin_unlock_irqrestore(ap->lock, flags);
@@@ -1769,8 -1763,8 +1769,9 @@@ static void ata_scsi_qc_complete(struc
  }
 =20
  static int ata_scsi_qc_issue(struct ata_port *ap, struct ata_queued_cmd *=
qc)
+ 	__must_hold(ap->lock)
  {
 +	struct ata_link *link =3D qc->dev->link;
  	int ret;
 =20
  	if (!ap->ops->qc_defer)
@@@ -1808,31 -1794,31 +1809,31 @@@
  	default:
  		WARN_ON_ONCE(1);
  		ret =3D SCSI_MLQUEUE_HOST_BUSY;
 -		break;
 +		goto free_qc;
  	}
 =20
 -	if (ret) {
 -		/*
 -		 * We must defer this qc: if this is not an NCQ command, keep
 -		 * this qc as a deferred one and report to the SCSI layer that
 -		 * we issued it so that it is not requeued. The deferred qc will
 -		 * be issued with the port deferred_qc_work once all on-going
 -		 * commands complete.
 -		 */
 -		if (!ata_is_ncq(qc->tf.protocol)) {
 -			ap->deferred_qc =3D qc;
 -			return 0;
 -		}
 -
 -		/* Force a requeue of the command to defer its execution. */
 -		ata_qc_free(qc);
 -		return ret;
 -	}
 -
 -issue:
 +issue_qc:
- 	ata_qc_issue(qc);
+ 	ata_qc_issue(ap, qc);
 -
  	return 0;
 +
 +defer_qc:
 +	/*
 +	 * We must defer this qc: if this is not an NCQ command, keep
 +	 * this qc as a deferred one and report to the SCSI layer that
 +	 * we issued it so that it is not requeued. The deferred qc will
 +	 * be issued with the port deferred_qc_work once all on-going
 +	 * commands complete.
 +	 */
 +	if (!ata_is_ncq(qc->tf.protocol)) {
 +		link->deferred_qc =3D qc;
 +		return 0;
 +	}
 +
 +free_qc:
 +	/* Force a requeue of the command to defer its execution. */
 +	ata_qc_free(qc);
 +
 +	return ret;
  }
 =20
  /**

--JL5kkwoEXDKoWL2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodumcACgkQJNaLcl1U
h9B2kAf/fdjffYzw2tJ0sSYPT6f+xm0g+diRLFVeWF6KqWqxKnv+PFZjESltmVvp
dSgXrSb+zd+wwTGLx4c2nylHlkMc51rhsMad2YXb7Vls1Gf5Jh9QJ70llwctnrvm
gG0SvP/gitb/HXgmaKaxsiFba81y6ZnFwV9utdd69/tOkx72Tn0XfNc5RgDtqg4f
yA7Eg9mRJ+v5zMs4aXAG5o1SkDCZUo4fdDiAOLqXXFjdBAtrTnGn3ZuEANc+GqY+
2ORIN/G0IdXH6K+RukGoEKz2rTCsdsqNt6zP3VylMVjmrOfiBYmWvIF+VfU0zRHg
ry/QYOsffi4LHiYDvE/W1fKTgSkPdA==
=wp7l
-----END PGP SIGNATURE-----

--JL5kkwoEXDKoWL2h--
