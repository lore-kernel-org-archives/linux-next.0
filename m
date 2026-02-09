Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A225D216;
	Mon,  9 Feb 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656842; cv=none; b=bb5D0oBjT7EgGpWwKYqz6KWzWW35qU0fKdSByl9xcELWtA6XD1eeMTZUto7eWwmAB+3lCfgUyANnsvyLxUFEN4tv2+vdfTXG4oNduBaqhrYMSd3xRcPOSYF/sXtACaMdQM0OU7mOk1LlStx+ogZHTjqHhN4M7xLt8/hXg8WHznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656842; c=relaxed/simple;
	bh=VtI4M1FEnfL0jy2uWElTQKyC82jHMev82aNfGGVLcts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jO1VJoJ4qR67Ve2dzzIxQlIOPyp4ftD2w391X5XGenQzilPESt/x2TBZXjnUVAp1WGsAtLY7/X8cTB292ilFyeKtxxcWtcKm0d0Gufl9Dg0vl+B7KJts6o80/LJoU48H3sOVZVhZva+g80/g2eHQ9TvvWsJAvav2Eqly+xQ9R8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVx/wqoC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVx/wqoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E024DC116C6;
	Mon,  9 Feb 2026 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770656842;
	bh=VtI4M1FEnfL0jy2uWElTQKyC82jHMev82aNfGGVLcts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVx/wqoCRhsQi48A8clGh+8VPWgle1oDyLbdvZmEnrxMMsCVES5qfakm7I/JF/3S+
	 3FSGIrj7UWNhX7RWIpAoilT71atwBeYOITowds4m5vv383u0wv1yc1uNaorh7p4v29
	 j3ojpNmRY5kP/Xl5w4gfli0QuaqPwbnN2ccAQBfBHvNmVv/ZPUasONMqnuaq2TiWDp
	 Dt+twKLeCsrYrIYFla9+gOH15/b9SLjjQdnyn6ResrAinKNSnNsXyvSf1ZrUt4y8wD
	 DkUuUUiStUv+c3PtPQsmEQ5BqKUvkDAOpdAR0zUpLfs7zbATniag+1/81FzQOgxWzZ
	 YsW2Kb6Qh4JvQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C7BA01AC57F2; Mon, 09 Feb 2026 17:07:18 +0000 (GMT)
Date: Mon, 9 Feb 2026 17:07:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yury Norov <ynorov@nvidia.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-ID: <aYoURlMX4UQJsekN@sirena.co.uk>
References: <aYoAtbc4L0N-g6C-@sirena.co.uk>
 <20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FsIBGR57Q/T730R5"
Content-Disposition: inline
In-Reply-To: <20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
X-Cookie: try again


--FsIBGR57Q/T730R5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2026 at 08:58:10AM -0800, Andrew Morton wrote:
> On Mon, 9 Feb 2026 15:43:49 +0000 Mark Brown <broonie@kernel.org> wrote:

> > between commit:
> >=20
> >   86e685ff364394 ("tracing: remove size parameter in __trace_puts()")
> >=20
> > from the mm-nonmm-stable tree and commits:
> >=20
> >   27931ee8f45415 ("tracing: Move trace_printk functions out of trace.c =
and into trace_printk.c")
> >   0e730bc067e7a7 ("tracing: Move __trace_buffer_{un}lock_*() functions =
to trace.h")
> >=20
> > from the ftrace tree.

> Yikes.

> How about I drop "tracing: remove size parameter in __trace_puts()" and
> "tracing: move tracing declarations from kernel.h to a dedicated
> header"?

FWIW that diffstat looked a lot worse than it was since it was one of
these git shows as an empty diff and I used diff -c instead which
usually looks more alarming - the change was trivial code motion
deleting code in the ftrace tree with the actual fixup being very small
but in a different file.  Was a bit weird that the parameter removal
didn't go via the ftrace tree though.

--FsIBGR57Q/T730R5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKFEYACgkQJNaLcl1U
h9Ag4gf/dkqOqMv5mbqWVTyXwaJ4lhuFa179nwzDqSXD0bnfQWohU/hNn6Bj3uTT
NnpiKBxcICQb3XfLrXcJjUXP5DQT0bC2HdRijp7i9frURMHR8rfdWEdrEg4z4toM
Gd7ns52sZ7/F+/NzcWzU5wh1OfB9zqy5qZSVqIVn5WVD5ekyJnWTt8ZMxOVjB1Uc
Au2uPoz16KXYJEwI3VLKo1IzEdLNGzboPq/sfwwqS2Xtw+ANvu6OHP+m8DDCt3sF
uthSIAQHqwE+2krrsmlXnjm/f1cOuYJy7H9lhVSkQLWJL/XfCFWtPoRWIh+pMgG0
PcytYqis+H1MX7ov+KEd95gZVBxpkg==
=wngp
-----END PGP SIGNATURE-----

--FsIBGR57Q/T730R5--
