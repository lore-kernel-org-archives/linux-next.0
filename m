Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957947;
	b=avYDY2aEYghjIx/VpNj1BFfIxTZXH3R/1TZQP0yatMWnybgoWGLlRN9HUUbt6Myr1QEP
	 58tDKiOUeX68Gzxssv5h8dOiodqXkFeosmOWolHVvByP/Xn2yjT+I+wwyUnO5rQVkirfQ
	 c3slVPmUqNSb9JXZMmFC4lc+84jMELC0qgN/s/Jqj39o2hMAAB+rhSybt9ZUTehbG+c12
	 d7ZiMRaKMzYzs9wvoGQCecP98SMTx3r8F+DXF10HphT7arREf7HCyCR+JS2VKfqDtLMm5
	 0CAWjNSCXe8RJa9Se8Q+xVfbuuYtCtI4t0gq13dYgYJo36AcBsWToEfc+U9Atx3XpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957947;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Vfe6Lmb0Y8szuGhbxe934drVDPl1Bo3tH2DpK0EPSUI=;
	b=0/ihqTddR7ZOi62reiMSeJRkUuN+IpB293NLNL51rx08xBlOvdquDMtVYb4L4J7L/2hg
	 v/P6VfMb6Ueh0XbzqMaBZt/9VYDSL4fxeBuilGqZIXEJxnoCnLVq4zNsx3Zr++oXSrmfl
	 KISkn8TZowY0CTIG//sp2RIfXmsv73vBZViXoQwfUB2Ud/52mSbd+zozAjGE0jzfDwTJh
	 9QZ7DWV5HPuQmgCK4YAfvZcJ2uRBIDaocCccxhtA2ROB3XlCyF9o8EYCB9jCtnmmSXKMq
	 chc6+J8h0fRS58S2+w5OeLd3K34AOue1Z86ffBXpPqK6XFjq1Kvgq8cEMGmQwJLhGXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLKfzndJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD6606A31C;
	Tue, 17 Nov 2026 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLKfzndJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9871C1F000C4;
	Tue, 17 Nov 2026 23:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957947;
	bh=Vfe6Lmb0Y8szuGhbxe934drVDPl1Bo3tH2DpK0EPSUI=;
	h=Date:From:To:Cc:Subject;
	b=DLKfzndJ2hZs/cARl3B02U3GntvqA5VRjBDbbiO9KN2XI5GbW26XNryBhnVL7vR9k
	 Xq7JJcgceLE2pfNllmNfmnHPeTn8T7N9uVr87cVuRY4FeNpAImcTIAAo+NT7xJ22+V
	 q6qh3Jv7TBq72mLlEc3mVsj7b2HqG92pZHbs3ROhjylDACzcjFYzUNmNejzYftEuu+
	 OZyH/hSt9Xdg9UDQXCrlLcuHzao9zxOXDeJDyZxwQ8siMumflqZroZNbs40dij8D0s
	 h5fWeDJbV7TyDELl8yFNv0xLPBQc1PZ1XROPBMaqX6wky63I4uQk6tbZVmTRvUOLBR
	 U7Gl76cRPwUog==
Date: Tue, 17 Nov 2026 23:25:43 +0000
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Shao Mingyin <shao.mingyin@zte.com.cn>
Subject: linux-next: manual merge of the scsi-mkp tree with the vfs-brauner
 tree
Message-ID: <avzid_ZRuSyAKfRd@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="Y221Hup2Nk3E+UTf"
Content-Disposition: inline


--Y221Hup2Nk3E+UTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/scsi_devinfo.c

between commit:

  6d14b93c111a1 ("scsi: core: let procfs copy in writes")

=66rom the vfs-brauner tree and commit:

  787fd1429b360 ("scsi: scsi_devinfo: Return an error when the proc write f=
ails")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/scsi/scsi_devinfo.c
index d9093851b23e0,b1f3bcd739b46..0000000000000
--- a/drivers/scsi/scsi_devinfo.c
+++ b/drivers/scsi/scsi_devinfo.c
@@@ -678,14 -683,37 +678,19 @@@ static const struct seq_operations scsi
   * To use, echo "vendor:model:flag" > /proc/scsi/device_info
   */
  static ssize_t proc_scsi_devinfo_write(struct file *file,
 -				       const char __user *buf,
 +				       char *buffer,
  				       size_t length, loff_t *ppos)
  {
 -	char *buffer;
 -	ssize_t err =3D length;
+ 	int ret;
+=20
 -	if (!buf || length>PAGE_SIZE)
 +	if (length =3D=3D PAGE_SIZE && buffer[PAGE_SIZE-1])
  		return -EINVAL;
 -	buffer =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
 -	if (!buffer)
 -		return -ENOMEM;
 -	if (copy_from_user(buffer, buf, length)) {
 -		err =3D-EFAULT;
 -		goto out;
 -	}
 -
 -	if (length < PAGE_SIZE)
 -		buffer[length] =3D '\0';
 -	else if (buffer[PAGE_SIZE-1]) {
 -		err =3D -EINVAL;
 -		goto out;
 -	}
 =20
- 	scsi_dev_info_list_add_str(buffer);
+ 	ret =3D scsi_dev_info_list_add_str(buffer);
+ 	if (ret)
+ 		return ret;
+=20
 -out:
 -	kfree(buffer);
 -	return err;
 +	return length;
  }
 =20
  static const struct proc_ops scsi_devinfo_proc_ops =3D {

--Y221Hup2Nk3E+UTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr84nYACgkQJNaLcl1U
h9CKpggAg+9j/2Q9CwS6GIeMW3VEQRQQZcWFfrGOM07gJ4Ge5hXDywOvrbJH4PJD
tOZTyWzf8bJM1s2DxATh7MM7xhBFe5vBJGRwAQ2952dNtcSnEG6C2eUqTtfF8FgJ
Pqbf6ojPMTzQueYzRk1phh13fNTTdp+bAONsaDYGZRJjhBobnaGzjB6424Nnr/FZ
FEXIu0QfFS8Am+ip4odNXP7JdnL4SBflGcIriqkQVOlXT2j14eXSX3Uy3FWrFji3
n89O6ryXXq0oQeFpcj0mzdyNMUpv4IlYGlUmivWySLLuFYhk/sk7LOXtOpm1IFIs
/iBPIRig3btKhytPRAiam9sqdtMMPg==
=lPXJ
-----END PGP SIGNATURE-----

--Y221Hup2Nk3E+UTf--
