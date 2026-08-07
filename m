Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E948394792;
	Fri,  7 Aug 2026 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094494; cv=none; b=RWdQXQh9Obwm7BoHMeM1FjEAbmdwQt2MfjPlTKjDLyNvrZTbn/0s7P1GwWxIabjm0lHfsQM/KU/W3rMwQ4m13V8BMB/3pKeWrOzcEF67wmJYiJ9zHDPEOQgK4fc+lrRP4UhYt49y06TOHJw0EjVc5nIJAUwo2WvZeXiXvJKha2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094494; c=relaxed/simple;
	bh=T6IpGrawpIx/DoUSKsgIt8Nzg3Z6J9wJQ+E6CURfUa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJouyxYOHnqPknCQKAlxOiG7Tln+AoAQDlJtrcXmmtvEQ2h1FBUTzNG9Pewx/pzGOg5xaL5d7mjmOks4ik0ss6O6+PLHvSu10LKowgA5dVinSgZCIlcsGauV10C6LXNQjqYOXOYRAvzCe8ZTG6gfvtgfjnhPJOvijaJBw3F3vik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFhJhWqi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFhJhWqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EFF1F000E9;
	Fri,  7 Aug 2026 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094492;
	bh=VBVzS6NBEA104iur3AOXKu3ykvh/X8767xtm0HIQIZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DFhJhWqitg6cqMwsX/Gvb6+JmOyco10X0lwyUxrD/TKXqHS0vFdtWqpfvF49gSiVC
	 z3J3o8nQ2d2SOIppuJwqEnpia7/GKg/zC4fvpJxXMCGVXqOE++9uddnM7jPIRCLMDY
	 HAZKF73zJmiYkfzSpSdbTKviuQCTkcZfkms2j7qh3LEFxO4TEv19XVfRwHYHoemCon
	 JQZrIt216FfiONv9Y1jTt4onpQA0uzFciM68D6xYEO+NcRMj2e8pNcmNz+UwQGBKFA
	 FRrqUBr3g8szssE4wkHTnYb0cbywjj0PKU4PjYEow7y412bx5hDnSZeSxUZL6Zs7Jf
	 0g+MegFVlxgtA==
Date: Fri, 7 Aug 2026 11:21:26 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Brown <broonie@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Kees Cook <kees@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <cyxygrqc6anzi7kdqd4shdg2ycvnlpu5z6j6tua466parti3ty@dwgitlwkshgr>
References: <amjpZ1aYsps44ExZ@sirena.org.uk>
 <20260728134755.501c6ac650c7a3868ae00614@linux-foundation.org>
 <ntrhorleb6tok47d6nr2k7xrpqwkwwfk5cie4v7pc3feia6tmd@hxxgjkkcc2vu>
 <ckrmakyl5pqqdileg6cuusekutpeuz5mtcpic64ml3zzgolwvj@2hnt7zcwqpvu>
 <20260804131407.40a4c72c38c482718894dd9a@linux-foundation.org>
 <kmpimojpjnn53b3mlezkmokoxk5ugtikrupxtobnsl25uhg7kl@xjwnvn577wsa>
 <anTMrBYXYKCpmoCX@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yes3liw3qaht3bos"
Content-Disposition: inline
In-Reply-To: <anTMrBYXYKCpmoCX@redhat.com>


--yes3liw3qaht3bos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Oleg

On Thu, Aug 06, 2026 at 08:04:28PM +0200, Oleg Nesterov wrote:
> Joel, et al,
>=20
> First of all, sorry for the hassle caused by my patches ;)
No worries. I think removing one of those configs is the right thing to
do.

>=20
> On 08/05, Joel Granados wrote:
> >
> > On Tue, Aug 04, 2026 at 01:14:07PM -0700, Andrew Morton wrote:
> > >
> > > How about I remove
> > >
> > > 	sysctl: move the "cad_pid" entry from pid_table[] to kern_reboot_tab=
le[]
> > > 	https://lore.kernel.org/al4C572uhLdBvyzH@redhat.com
> > >
> > > and
> > >
> > > 	sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
> > > 	https://lore.kernel.org/amdveg1m4E4uQlGv@redhat.com
> > >
> > > from mm.git then forget all about them ;)
> >
> > Works for me. I had already picked up the first, I'll add the second to
> > sysctl-next and they will go upstream through the sysctl tree.
>=20
> From [PATCH -mm v2 0/1] sysctl: remove CONFIG_PROC_SYSCTL, it just mirror=
s CONFIG_SYSCTL
>=20
> 	If this patch is accepted, I'll send a couple of followup cleanups:
>=20
> 		kernel/sysctl.c:
> 			collapse the now-identical CONFIG_SYSCTL nesting
>=20
> 		drivers/parport/procfs.c, fs/dcache.c, and fs/file_table.c:
> 			drop the CONFIG_PROC_FS checks, now it is clear that
> 			CONFIG_SYSCTL depends on it
>=20
> Now that I see both patches in
> https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/l=
og/?h=3Djag/sysctl
> let me ask..
Its already in sysctl-next https://git.kernel.org/pub/scm/linux/kernel/git/=
sysctl/sysctl.git/log/?h=3Dsysctl-next
which means it is in linux-next (have not checked).

>=20
> Can I send these (minor) cleanups based on sysctl-next to you right now
> (before I forget it ;) ?

Send them now based on sysctl-next. My guess is that it is too late to
include them in this release. But they will get queued up for the next
one.

Best

Joel

--yes3liw3qaht3bos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmp1o44ACgkQupfNUreW
QU/m3Av/aBGLhXFODL4lzGzmISlIE/BDD/xnd92HNXEDgx2d+/PE9vdn6KPJKxvy
7Y5FhrnbewYNCS2rF1ctDRLjebVdVQGaLrbV0SvI+MdNsoV9CVOjRymChGwNF6Bf
Bu8vUDw9ND+PRQBx+TVMzO6/6VghWWZu4Eas9h+tnw2LIxZ50sEHa/ec0QDk12SF
LwgzFav7dB72JXAahCwqFOhL2cTt1z6XMZRIcJbwnWfvJQQ0esyew5MVYwa50Qnm
3Ji/k52qYGL/WV+wKJbjihBty0y0S2ecbV/0ipK8wBBfdo44gnwrxOd2EruvP3kQ
lYarhjbQOEExcs7DyEWMlNHr4FrxH+54ut+ANThPQyk4ZFCSuMSrVghafbmyKoEg
E+lI9Sa46uixWPO+2EbhYr2CK1J2eQ8x4xZUy7KgBeli8IWtpWGCbZHvFQrFVjcs
cPuie2Lg8QTUIj/EcgBUjkhCYFPstZeEH8OJjDNMN5oXak54rO7RgjQOHc1G681i
wmkJfIoh
=PFH5
-----END PGP SIGNATURE-----

--yes3liw3qaht3bos--
