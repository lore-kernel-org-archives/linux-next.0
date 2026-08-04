Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC9330566A;
	Tue,  4 Aug 2026 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829480; cv=none; b=ITZxdWviGiB0ZpWqt8UcEXpUgc9XzLgZPnyknW8pdjio3KjWfVViWxxiltfZ5f33B1zdXXb15OQrh2LcNHVJUIektThOkLCvipZPZ/uaHb42HMIxPfcZXMKTqdIwWq0VO2J4TOqNY/FazGR6JKU+p655Z42zY//b0OKQTBp2CJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829480; c=relaxed/simple;
	bh=oTGS8znPPV6KjP3m9WZkWwkUBxMAX+3+YezwsNiNO8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5Oqfj4nM2lRvZr0TfWVeM78JGyLtiHTu4NZyEzhHIByPvzp9HbAdWYpSOei/cTIu3wdOm1I7rlTvtZSDe7MBBCIu71FEMbbXTNw54vQ2lY6w+JGnNoISC9zSq8UEXstOHtfNuOpQ3sgjQUXCtGQ9HHiaC+GP67fGSWa1bNC1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRJ9i6In; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRJ9i6In"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCA11F000E9;
	Tue,  4 Aug 2026 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829478;
	bh=IFZUdtaUW2LXi6HV3Vzk6+Rat+K6m3m0aLymj9zpmvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRJ9i6InomGwvMhtNynWx6iWynHcqZQTBRt5HMfIQter/VD5Wrr3lMYD8N3AiCgZu
	 flH2Ehz4RQ06KoqHoPWarZyDfizFejiMZGddGaVjEUKN/f16GWfk/kmxR2Jb1ytYNR
	 zXSFOcRLyNiEJpWhk2Karbzpq+IhTWYjYegpAT/WXAu229Oc9RujghfteY0tdKIvOp
	 CmWrqdLx+ICf5BYLYx1/3i1seXSgAHpsvH8yU/n2LOwehIdOCVvd8yP3K6EfDaRgMi
	 9aRMk4fHpWiz2MakAOAxDpzsqs1hPU8AMfd5l+BN24YRafIlEtpcQJ4jMdl1nUibvM
	 PuCmzXDIaLeAA==
Date: Tue, 4 Aug 2026 09:44:33 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <o56yjhfebz33kt4fxxh3ks2g5eixwvchjexe55nf5dy4ygkygi@7l6hqkbupvhx>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wddg5ecv2h5nvg4u"
Content-Disposition: inline
In-Reply-To: <amjpZ1aYsps44ExZ@sirena.org.uk>


--wddg5ecv2h5nvg4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 06:39:51PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the sysctl tree got a conflict in:
>=20
>   kernel/time/jiffies.c
>=20
> between commit:
>=20
>   842912dea6d51 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONF=
IG_SYSCTL")
>=20
> from the mm-nonmm-unstable tree and commit:
>=20
>   a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_proc=
_dotypevec macro")
>=20
> from the sysctl tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
I just checked next-20260803 and I see that all the sysctl changes are
maintained. So from my side all is well.

Best

--=20

Joel Granados

--wddg5ecv2h5nvg4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGyBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmpxmGAACgkQupfNUreW
QU/QyQv3RnCmJaDzeP4/1B4GyoLI1I3BY8vdg9MNaqtyeRiZawRX9co/jL60vAlC
68pt1j5MSXWzjObT6lmrWdRWJR6t+QAvKk/34TZM0fyp56TpMMVRfWKUT7AI+6cC
aWwQjkwIOo/pbL81W9ZuadC8a02MiT91E124zXriKMa2pPk4W3ruo/6IOpjv7YSr
J2Ri3qQN57SRsay3DfBBNuvd2MSuTMg5YVqEj5KJaJyAtA9aX+3z00HvSfuPgtYp
zqyS/eKYutsffHyID1bmONpuKzOpVKF4EUeDbTkYek8b8kmuExdSU9iq3YA1P8nr
dd/MYZwgMMauBgtr+GOppN/Z4PZhCz87cXTOCdjYXm7eTjApv+R1kXlbmawUkcnk
pk8Xrz5SYTPdZpPRYzfDcML1RcbBN1yZnlDtvGDP3UiQs3L08rpCMXCAic9aBGk0
eD+bu4eKuj43aft3HvilprRSGk8k78GCdQNVfkpF5IAFgQj5rY80SvAcwM370xhs
XPlB9Ik=
=2yoa
-----END PGP SIGNATURE-----

--wddg5ecv2h5nvg4u--
