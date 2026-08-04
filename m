Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040A73F6C39;
	Tue,  4 Aug 2026 07:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829006; cv=none; b=Ue+SvdMgwMZv5dk5bDbLbMigWdXZszXAE01WGKwfy3rUXGH9eTZVYhkZdV06C83UuqGS95U5YTE7itj//O4hjvm62waetrE6BeXvEjnJB5m6dWLSSmjRJqWOhd8jI7zulvBjPXjMRtQUv7D2+jRvSsP8F3p6AE80OEpUNT9NAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829006; c=relaxed/simple;
	bh=qRlIXZXQIHhRQPmWqA0H9zZHnU/qXbm+vF0Z81Zfhnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuVWyFKlGVQHmitHcn2uajyQNs2Fnrv3SRLoORPsIum597r0OCb3WqAui2J92Tf0Fgdog+b0cuElFESrSmWWvGgrsQFgTWOTS5/9MeJgfnR+3gfVcrdBiz198wO4ivbJNhPVcJp1FYi06SJCdRvBt74VJ6aNC2+HSJsGJ/x5Hqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9S7XP/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9S7XP/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176411F000E9;
	Tue,  4 Aug 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829004;
	bh=yKZuY9x08n9PIcsFiJoidcM7ssRDt18NlOHoiD7DxQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9S7XP/j37bhMjsUbyGF5XzP+hwtyctcbPIJ6A2Q96xNza1xUNxvvP4tfnOusdMRb
	 5J0+Yg6OjwW/FEOkATHcha5E2vayUIDFCNSTWnaHSZKWSLtnEcjaIujFLDxBnzC7xB
	 tVychJJ8Q3YoET2S4ca7JGg5hblqgfMoKmFCo2KLXmUmerY/CmYju2Y8Gn7MLEeJOi
	 HD3QfgiE97TC70EJN21x9Wa20LgnTfVHVTleruTweGj8oO1t9IJRuRxaZz0+Rr4lz8
	 Xpzrqmihmetf0g4h7IYlhEHeYvi3TMY1tHqCzbcOUL9fekN2wGXiOQnf1wyqZYIuFa
	 dGUWoyk/px8sA==
Date: Tue, 4 Aug 2026 09:36:38 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <kees@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
 <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d2dnosdiyf2eykj3"
Content-Disposition: inline
In-Reply-To: <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>


--d2dnosdiyf2eykj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 01:47:55PM -0700, Andrew Morton wrote:
> On Tue, 28 Jul 2026 18:39:51 +0100 Mark Brown <broonie@kernel.org> wrote:
>=20
> > Today's linux-next merge of the sysctl tree got a conflict in:
> >=20
> >   kernel/time/jiffies.c
> >=20
> > between commit:
> >=20
> >   842912dea6d51 ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CO=
NFIG_SYSCTL")
> >=20
> > from the mm-nonmm-unstable tree and commit:
> >=20
> >   a3c70a5a9f944 ("sysctl: Generate do_proc_doulongvec_minmax with do_pr=
oc_dotypevec macro")
> >=20
> > from the sysctl tree.
>=20
> Luis, can you please grab both
I can put these into sysctl next if needed. Do you still need both of
them to be there?

>=20
> 	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_table[]
> 	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com
I do **not** see this one in next-20260803. I'll just add this to the
sysctl-next.

>=20
> and
>=20
> 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
I see that this one is already in next-20260803. probably went in
through mm tree.

  23a24c8a95c5 sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SY=
SCTL  [Oleg Nesterov]

Let me know if you prefer some other solution.

Best

--=20

Joel Granados

--d2dnosdiyf2eykj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmpxln8ACgkQupfNUreW
QU+7tgv9Fc7IJ40OakzLFgsPtWtj4I3eZZElTbnV4hx8fxEr9ZzrzEl/Slc4Z3v+
eDaCPPbEQ3I7Rdnc7CuuUtwOL4QeANlKfc79VdrG+tW9c9A06Es7UzoPSQQdqIKY
/BwriS5YywqUXikue5h5tFVW8gaIrg2ehr1PUov/I8hVGO0WbndM00Jm82Q47s/N
fD0vIpRBBtyCmG3lLUfi8YASwdRN5GkRkSQSYLc5QeJcoMjPcZza+6G8nc+7rLaI
sIiE6XRgauZsD5/XYsQrWlNe5lBWNn1WDtsxLLTM94uSCcjCfVK+ZHGvv0vexALV
TgR9POYq2hyRQ/LzjpBKh/QDt9NIfKG/OsgfO6P6W82qxcz83tg+ivtEZj9VYXQU
RO5i4tC76AdfkB95hvi2TwCHJnkvV+bfXgUA3OFXKemo1ppdO2kaVVgS4QopSHoJ
O5hHg9HBidce/fHSrXVxSUnp0UclHagJySRNyG9wC8Q91xZ7OITd8AyBwTPr04I5
EhcbFgPP
=T0C6
-----END PGP SIGNATURE-----

--d2dnosdiyf2eykj3--
