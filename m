Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7F1CAA6C;
	Tue, 21 Apr 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777708; cv=none; b=Z2OoXK/eK+R7ayGaWD+WbxNkJGDFvvQVNYjK1K4ZxtOd9fHmPzN8jcv3LgZAtD9zzWzQlTGLbGA7DHcLi+AZTVIPhsolBQ9HAUwF1wT4a0H4GPIIkcaEpVDa8jGvSLTqJf0umHchBGkefUHDWdJx70BQPt8Pv/fbVcHj9djtIeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777708; c=relaxed/simple;
	bh=ssMW6P3PiAuoWqIxp1CHTl9051TcJXCoHdKYPNDOQyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYwaxbBlU0XkVF0XObNq5QVsAn4zFkhvPNZPLKsQc49CujtX+nARWUbcdTZkhVfKYb4QquAObogZNz8auAUr5I2IvD4YYh6kt7m5OzWWXY3XkHnRcnWKJYnZ4DIB/qnQbnfUBjRt4OU2NPICUyqtVb5oGZhHKbpjsyGq5xN3lZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G77Mr4dz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G77Mr4dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C46C2BCB0;
	Tue, 21 Apr 2026 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776777708;
	bh=ssMW6P3PiAuoWqIxp1CHTl9051TcJXCoHdKYPNDOQyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G77Mr4dzm6AkKTt6oKCPTP9yD+xEVL49zkrm6YdGzBSPO5p9vFDsvZ0mT2q9PEr8H
	 YczQOdeDzlqVRChhcFEosdkfXZ2sDwCYTkpbOt+2Cwrylg1h+ytpT1/Uht4fnr2UYe
	 Tp17tWOOCl1YlSEv8GS7vLTLpVHdd1K9iuQ/7BU02jTgWbyGfkzdjkj8WvLmvk4GHc
	 ZYhELwP2xfNhD/xjiCq6410nKfhpuk97DDAwuG0QhR4sUYk807TVdMWNaSKUzNp+2d
	 O4c2W2IHCAi+W5OErgwqjatGwtfwE8IFmOQTn95Hm8xhRT8edJd2Ndig3rP4owgWE2
	 Dh/oNuNGzHZgA==
Date: Tue, 21 Apr 2026 14:21:44 +0100
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
 <c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="28wBtSmeaxd1Id8o"
Content-Disposition: inline
In-Reply-To: <c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
X-Cookie: Jenkinson's Law:


--28wBtSmeaxd1Id8o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 03:06:32PM +0200, David Hildenbrand (Arm) wrote:
> On 4/21/26 14:59, Mark Brown wrote:

> > After merging the mm-hotfixes tree, today's linux-next build (arm64
> > allnoconfig) failed like this:

> > ld: Unexpected GOT/PLT entries detected!
> > ld: Unexpected run-time procedure linkages detected!
> > ld: arch/arm64/mm/fault.o: in function `tag_clear_highpages':
> > fault.c:(.text+0xc40): undefined reference to `mte_clear_page_tags'

> > Caused by commit

> >   99e63a49650cc (mm/page_alloc: fix initialization of tags of the huge zero folio with init_on_free)

> The patch will get resent (and should not have immediately been queued
> in the mm-hotfixes branch).

> Feel free to drop the patch on your tree.

To be clear linux-next merges the trees that maintainers are publishing,
the standard fix for straight failures like this is to merge the last
version that worked.  Sometimes reverts do get applied but more usually
for things that only come up in the final builds.

> > I have used the version from next-20260420 instead.  The commit removed

The commit is also present in the mm-unstable tree, I have also used
the version of that from 20260420.

--28wBtSmeaxd1Id8o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnneecACgkQJNaLcl1U
h9Cyngf+KKNHZ5bbUPztNjWJwjgZtvQMpbxMZPX3GkX/f+6Q32p1mcYYVXe7B9cR
Qw/IOfdNoPcvjX/I/eCZurwepiuEijhb8yDDMNpqUDHs25jp7WmPtJc6omt4f467
a1SrXK9NJuSJ2e5PLd9qeLAp3haVkg/nIzGxv45q3G/YINu29An76Lnk8IdNzYEZ
O0fnBWKpcpj/Pqo6uxnDGy/sqMQ3ygAB1vycN/RQbJqNCYUTZBIWubSwFYPvft/P
lbE4Ui3FBx78tuxnBpfGXO5tLDbCepX4T6uQ6XxufzrwfCDPKvvW0KAkZOcQJT+a
q7eIWNAYilaVMzq3Ehv1rdA+Wywb2Q==
=TNky
-----END PGP SIGNATURE-----

--28wBtSmeaxd1Id8o--
