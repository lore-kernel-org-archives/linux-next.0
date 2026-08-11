Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA42C21F7;
	Tue, 11 Aug 2026 16:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467305; cv=none; b=TfBUkrKqrroFaHGCoG5Vz8Px9zc3uQ/lJzF+mWntRsHsWZqPzQRRIfwwlmuPrM/nHWbb/fVoatKHG29IMnKrWohnBgEbhdTmFvijZUANzoLKwACWF5PCG3lIIa5YzhpKufiREVXGQyYcbp1sFy+DjbYVtmJK9MPaWMMllcp30DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467305; c=relaxed/simple;
	bh=cChe8BfPsOs/vPJ+DLdQ3iNSIhevi67O19UHRePatb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbrXCW7bdWdDfTSjA0YzSg3KyQFvWABi3b1vVJ5gkcuo2434Q+unsEuY6nEQjoG8IfddGlk7KsWH9yW6qbzXX5qddixKwfKG7Jdl76g6diskBtCgEsPkYVwj0FFB4FqFvSluInkW/7RCTg76EkYWfP7uhmLuM21hhuDA/8IgS/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1xAC98b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1xAC98b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6CC1F00A3A;
	Tue, 11 Aug 2026 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467304;
	bh=87b40jnc6VA8mL+qpcyBST+UsnB8+jMbx6tglGl+bgs=;
	h=Date:From:To:Cc:Subject;
	b=j1xAC98bBA0jS9cXPc43eB66pf1o2Qy4ZInvLPLqlSHOE03hoBs/fEMhtUuxKvgZz
	 qJ8F1+3xSvDPiFMFtcl/bfdMryQCWyxrSPN/IHuoxzUmZG9rbiFJ7O0OW4mb96zENe
	 AA3dBHdzlZEEJSPz9flNDbYZ975Gz4NgwHNxPur37JDGL+5olERzJHWBb0pAubBgUp
	 v0pLwC84VLVK4tHA6AcBDH6lnc0Hn1Pk8JSW8hZBAuKpCay7aVoDpCylWBrpyJMNgh
	 gZva7+aZkLl7HxbxXdmlMp9yQAU6ZgTVOcdXvj9x2gIqK8McO2BXqV6H4VQooggqic
	 wrl6JCRNpBUOQ==
Date: Tue, 11 Aug 2026 17:54:59 +0100
From: Mark Brown <broonie@kernel.org>
To: ksummit@lists.linux.dev
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mFbxSc5ie7ZI2xnp"
Content-Disposition: inline
X-Cookie: Take me drunk, I'm home again!


--mFbxSc5ie7ZI2xnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I was reminded by some of the maintainers summit threads that it would
be a good idea to check in about how things are going with -next and if
anyone has any ideas for things that could be done better.  I've flagged
this as a maintainers summit topic just in case but I think it's quite
probably more of a list thing.

Mostly it's been business as usual, hopefully I'll get better at doing
merges as time goes on.  That said the list of visible changes I wrote
seems a bit long:

 - We in theory now do rust builds (at least when all*config enable it,
   hopefully that get fixed soon[1]), given that rust things need merge
   fixups and rust is now a normal feature this seems obviously useful.

 - We now do KUnit runs as part of the builds with KASAN enabled, this
   has been quite useful for keeping memory corruption and severe boot
   break issues out of -next I think.  Prior to enabling KASAN it would
   often flag on a different tree to the one that was causing issues
   which wasn't so useful but KASAN seems to have done the trick there.

 - We now cover a subset of the kselftests, this does find issues
   moderately often and helps keep CI coverage.

 - Started sending out a weekly summary of the state of the world -
   perhaps there's extra stuff I could be adding in there?

 - Removed one tree that was causing issues and came very close to
   removing another, that one fixed the problems promptly.  I'm not sure
   if I'm actually being more pushy here (as was requested), that's
   about all the issues that came to my attention.

 - We now do allnoconfig builds on the incremental builds, this does
   occasionally catch things that are allnoconfig specific which I did
   get some reasonable grumbling about but I think the majority of
   issues are things that would show up with any other build so the
   failing fast is very useful.

 - Swapped around a bunch of the targets from PowerPC to arm64.

 - I live in Europe not Austraila which has messed with some people's
   schedules.

Things that I'm aware of that have been suggested but didn't happen, or
where I'm aware of issues:

 - Covering the documentation builds, I don't think I've ever seen them
   building cleanly when I've looked and IIRC there were some issues
   with not getting error codes on failure too.  I do intermittently
   build as part of the final build.

 - Standard reporting of duplicate commits (the tooling does notice, but
   it's a manual job to actually tell anyone about it which mostly only
   happens if I notice them causing a conflict).
=20
 - Pushing out mails more promptly, there's a manual step where things
   get dropped into my postponed folder and I don't always actually send
   as fast as I should (the "tree for today" mails ending up getting
   sent the next day is the worst for this).

Any other ideas?

Thanks to Thierry and Breno for helping out with holiday cover.  There's
also a bunch of stuff changed with the scripting which they're also
helping with but isn't really visible if you're not actually running
-next.

[1] https://lore.kernel.org/r/20260805-rust-reverse-randstruct-dep-v3-1-7b8=
b2c761d6e@kernel.org

Thanks,
Mark

--mFbxSc5ie7ZI2xnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7U+IACgkQJNaLcl1U
h9DQXAf+IqjcVdYrrkoqV3Y3mHzzK2KcV/uRAHH7OOMdkPjvMhJUcft7PetULCu8
HJK/fhyMkw4CqVGcZkWiQpLlnVA+8zVUku9Noj18F2b5PvRjOJc93K0BqVvAukVk
2jsbJpEu0cw94lzGW0mJ0pjp3V312+MDOIWJqYPKV+ZGX0TOFENGGoj9OzKTP/Du
NxNQn5ASSeC6iCmV669CL0XbNx7O7SaK2SfqscrzzsKRM/G+IoXXveSvvk0ZPdbb
+MJh0OyYfiyNLg7mSoE74hW2eb+WPsIjX2VvtLmYT+UwvvPVDM1Ume+k7aD/ijdI
OXML/kwC8QwI4951UNo7t6zljPmIMA==
=E0N6
-----END PGP SIGNATURE-----

--mFbxSc5ie7ZI2xnp--
