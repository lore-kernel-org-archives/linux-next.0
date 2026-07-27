Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F2423EB2;
	Mon, 27 Jul 2026 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173951; cv=none; b=kLrXP1xz9mIHuAoPpd6O9DpIbHMupWsij45xGp8/DbtQcllhWdzKzLor+iz0IZWh3dE27GgtOxfFt3fMqP2hwsAiHj0j8OV7pHGvDuU7BfgGbkrKJaAptVZ6YTKZiUAYnp9sAqXe4ceTy93pjUZhi28NO7DK5AYhKRTaFhvs2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173951; c=relaxed/simple;
	bh=9JgWQOE671hga5O++DKISNZTZgDxGlW/9JJrVxEyaic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaIZQNp4oX+Fcqr2TYIXLFTmZ/HcnupLZGLOhEAwlDsuLkgDBP40vrce7J1dpXCNklu7mPdjdnSDHKVZzkAlWOH3G3x8ew4RkZCnM49y6pFXqd1wGnW4oRsYRLXZkQwCuIKAhuAmSuT/2GKdmDsvqvuWi56Ftbl5fMIbGOP5KKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN/OMuU8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN/OMuU8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A07B1F000E9;
	Mon, 27 Jul 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173949;
	bh=qfMaAtJzHc4huKmXP6hk6Anu4zmCZ/7uw95z/SGsjzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aN/OMuU8C/nAPMRbD5J0r9pzImnkufcwauQAmQ9aSWcd/Lh2X3h1Wn+dp4bpbCyr2
	 3Z2AeEaRrpqMyMBRNPdRs9Zs6ShMwiuOdfwTKyNZzxJTEqfgJZFnVZgTxANT8+MFgb
	 BGxAU2SHt/1Yp7uAarOrvbLG9K2tkDvRtOUSpNIJl1M/7X9VX4JCiY9yGz0y59/FpK
	 TvtHolfemETW1BtR4cSs+xkEuQKQl0kQwPn1W254/8HdP3lg41iPHf6J6TCNLumNj3
	 JhRQlKAYYoLq1HcAUXvuSlRINDaoAJk0JI8JpWw4J7Yq0/dH6xRDa/PRM8F/ERK1AV
	 eUdiHKLbPsLwg==
Date: Mon, 27 Jul 2026 18:39:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Theodore Tso <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Christoph Hellwig <hch@infradead.org>,
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
References: <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BLw1oVBj+soLZxlM"
Content-Disposition: inline
In-Reply-To: <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--BLw1oVBj+soLZxlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:19:26PM +0900, Tetsuo Handa wrote:
> On 2026/07/27 2:49, Mark Brown wrote:
> > On Sat, Jul 25, 2026 at 12:44:17PM +0900, Tetsuo Handa wrote:

> >> Excuse me, but what does "successfully unit tested" mean? Broken patch=
es
> >> that do not build, or trigger oops by just "/bin/cat" _are_ arriving at
> >> linux-next tree, which in turn preventing continuous testing by syzbot.

> > You're supposed to make some reasonable effort to ensure that things
> > work, if you break things badly enough and pay little enough attention
> > your tree will get kicked.  To even get merged in -next on a given day a

> You and I are talking about different topics.

> You are saying that I should not submit patches that break linux-next.
> I am saying that maintainers are submitting patches that break linux-next
> (and then stop responding after a breakage was found in linux-next).

No, what I'm describing applies to everyone.  It's a bit more important
that if you're adding things not for your own tree that you don't mess
up, but I do actually occasionally find myself removing trees because of
disruption they are causing.

> Some maintainers respond quickly (e.g. remove problematic commits from th=
e tree)
> when syzbot sends a report that there was a build failure or boot failure=
 with
> linux-next kernel, but other maintainers respond very slowly.

> For the latter example, syzbot is still using next-20260714 because a mai=
ntainer
> who should accept/reject https://lkml.kernel.org/r/al1pElMQZsDfpAYI@micha=
lis-linux
> is not responding. As a result, syzbot is unable to test changes made bet=
ween
> next-20260714 and next-20260726.

This really just looks like another case where you (or someone) need to
commuicate if something is urgent - I would have a hard time telling
=66rom that thread that there's a particularly big problem, the only reply
indicating any kind of problem with the posted patch (from Joshua) was
then followed up saying to disrgard it and there's nothing at all at any
point in the thread or original report about the scope of the issue or
any practical impact it's having.  Frankly I'm not clear that Michail
(who posted the patch) is aware that there's any urgency here and isn't
just acting reasonably and promptly on what was in the report mail.

Even if someone were to click through the syzbot link the report is
flagged as low priority in the dashboard and the config is just a link
to a raw config so there's no indication if this is defconfig,
randconfig or whatever.  There's absolutely nothing in the sysbot
dashboard or list report that indicates to me that this has any kind of
impact beyond "a warning is displayed during boot".

If this were something super urgent I would expect to see people
following up saying clearly why that's the case, doing so repeatedly if
things take a while.  That simply isn't happening here, from what's
visible I really don't know how anyone is expected to infer that this
isn't just a fairly standard bugfix for a routine issue that was only
reported a week ago.  Perhaps this is all clear if you are familiar with
how exactly syzbot works but most people aren't.

--BLw1oVBj+soLZxlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnl7YACgkQJNaLcl1U
h9B7CAf+Lm8kGLXm1Au6vXtOfAYzm+R2hhq7ZrZYlE0C8YjqohCtjckyTKFCWDZZ
m2ao5d142UfpteJuW6pDTdX4RT1qWhgnTyvlaRMUiFobixb+ABDzDZ4iH165j9EP
Cz64GBt2JvPy85vGQLGcnjdXxOiMXenn5aIFmHQ0uTGTcMgaCFpGIOCfFVaOo7u6
/HjK12Thsr+fJ/mJLI0VLU8dviOSnNQI3E/I7NZL8TN/7oM6jlR39akj3sIItnfI
TIv8a4eaxaETFED2/oWUO9W7ztFLoGiu6RVm+3H99douXgx88dlxJCdrqqMR2zSh
c5xOQEfq4eVRLCaKMA5FqZJApleZPg==
=svFp
-----END PGP SIGNATURE-----

--BLw1oVBj+soLZxlM--
