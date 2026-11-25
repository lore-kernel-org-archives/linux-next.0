Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627276;
	b=Nuzr1//vXSL9RygvYpqX9pyqRqWRW9lmCis8H1uiKjyQOekvMFj0xtBouEx/a7OpybbX
	 qHSAGQT6luD0Zqusuu4PyyP4cc76eaiNegY8d76Fxc9yP1YE3MvRQv65MOtiyFmbbxsbq
	 5nHOftC2j2RZZ2JGVUWGcZ1K4QWDq+FPNLh+MpZTgFtt8KYfh5TFIpO+2VZGrR8S70s1y
	 HIHi0XX00x4Moo9gru5jwVzFFQfeRewbWQ2Y56c+dAADbdUiSVLmjhloyZGpJjdHccjTD
	 LkP0j5CnydDMveLMDNG1wrsOZ8jZ3lIqZ42XDoj6BQaCIATWj1eV+DjQQ9nML0oz3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627276;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=CATs3TxPb2vkWWE7w05gWjPu03+EIy3BoHy+nnXpb7o=;
	b=dqMCItJK88E16zqtYE5ktfDKDlxxRvawyps9X8hpYbYYVC1C7y7sX8ghw72montwZuem
	 /CpZlA8UpRP36hVL0C3WyiuQw17UZG5cSC0Lgtk05KcriBHB3v7iPM/aUI61KUwJ33q0P
	 FtKsWxYJYoEyen63Le3eVKW54iIEgfNENM7sMSLRYFHV//zzt0XuxNArJaxEv3FvnEM+u
	 YiIdqczZP3hpMg9TuC+xjSlMmAaY9uZMLpsA4PhEu/kiUTUL5ztG6RaGgTu0rnArjiHbL
	 nzbHsKAsXKf9szWrV+Ct7CspvgjiYEq9LPjptnC0iWQ4NcigwMdP5fKidIEXoHGN1QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF60q2gN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64301606A329;
	Wed, 25 Nov 2026 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bF60q2gN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A333A1F000ED;
	Wed, 25 Nov 2026 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795627275;
	bh=CATs3TxPb2vkWWE7w05gWjPu03+EIy3BoHy+nnXpb7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bF60q2gNA76l8mBLbhhGwscR8T8mKZo+sY6Th5D2m6IctFwJRlVU6thx2MriPKnmn
	 ce1qhicNuvCMs5CPoo1b5muD9bDR4tgP0Tja3dSdukPwlVsPqMXQjWQa/UJikKpsLh
	 rtqCe9/+4E8yBRwo9bVTIDfb7UYMX6YDde/q5W35nrTNYn9Mc5Ija23Xx4ock4xVBW
	 PH6LTCMV8aOCO87zcGZ5Vsz2Y7ACJRzHDisi1kCBi16squW6LZPBRaL1K8SovVXd8O
	 miDv0ojoUowsIj1WPVJJfOZks+xvfW4+bdh2+KC8tnAql72jupcuqUWEywJaohXB4F
	 ba8eFZ4V8Sf0w==
Date: Wed, 25 Nov 2026 17:21:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure in the origin tree
Message-ID: <674edd30-0087-4341-8a13-3c306583705b@sirena.org.uk>
References: <awbpOaMZRkKXbq1H@sirena.org.uk>
 <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="214qslik+t1TzwFq"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgG7RgD-rMiXa9wgirV9ztTLtdg3nj7_X4smR0TEx83aA@mail.gmail.com>
X-Cookie: -- Owen Meredith


--214qslik+t1TzwFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 25, 2026 at 08:24:22AM -0800, Linus Torvalds wrote:
> On Wed, 25 Nov 2026 at 05:57, Mark Brown <broonie@kernel.org> wrote:

> > This is happening repeatedly on actual hardware (ie, -accel kvm is
> > operative).  This will have been caused by some aspect of the ext4 merge
> > that's tip of tree, the new tests were added in 3ca8192f79504 (ext4:
> > expand KUnit tests for fs/ext4/inode.c) but I'm not sure if they're
> > identifying actual issues.  These were in -next yesterday and did not
> > cause any issues there so it seems likely they're flagging a real issue
> > that's fixed somewhere like the vfs-brauner fixes tree which would have
> > been merged first.

> Well, it could be me having messed up the merge itself. There were a
> few conflicts - but I was being careful and they did look quite
> straightforward despite my annoyance at the timing of seeing those
> kinds of conflicts.

It's definitely possible of course.  Probably worth mentioning that what
you've pulled in was the main ext4 development tree yesterday, not the
ext4 fixes tree which was still at the previously merged 8c4f6e3376348
("ext4: introduce a mount option for iomap buffered I/O path") which
makes direct comparisons a bit wonky.  What came in during yesterday's
merge was never in -next as a fixes branch so didn't hit fs-current or
pending-fixes.

> So I _think_ the merge is fine, and judging by the actual failure
> reports (eg inode_test_write_and_sync_metadata()) it is because the
> tests are testing things that were fixed by commit d25c14b2d79e
> ("ext4: use sb_find_get_block_nonatomic() in
> ext4_get_inode_loc_noio()")

That commit was in your tree before the ext4 changes (the ext4 changes
were the top commit in your tree today, I nearly just rolled your tree
back by a commit) so I'd have thought that if the tests were verifying
those changes then they'd pass?  Possibly something from vfs-brauner, it
looks like Al's not updated his tree since June?

--214qslik+t1TzwFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsHGQcACgkQJNaLcl1U
h9BYAgf7BKlZE4XZ3SENc9EK5i+5k2gW+1d1ABnPZGWznDoYKpB7UyDputDvh0+D
USA3+Fym5GSx7bvUEmKtQMuYB8oVl50NPL7fRs3iV9Xp+7kFUCHR/ZUeWqAUe611
lc+bcxgBLe5SUWm00TOt3kft81YEh+O/10HWIfnCtq5Sk/Vg6s/D4kWwla8MK9nr
b08y6fyHfJ+s2KEjc1r4XZOoGAeEoHBxAoqvxbNvjMBkLnPl3Yuc9G2SI31mXQ+q
7+DpuEf12fFq2rlNtNT5I0tfi5NUfu5W6TttnC5OTC6cqnXED00PV82WApqRHlvz
t+9C9M1lTDNlKapzTNjJD4bC1pk2qA==
=O7Cb
-----END PGP SIGNATURE-----

--214qslik+t1TzwFq--
