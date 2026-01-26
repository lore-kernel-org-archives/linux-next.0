Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EDE338586;
	Mon, 26 Jan 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432878; cv=none; b=M4/2875RWJ8vx8EFIegIFPReHfHmYUm/hCqRFqhz0rpPLNL9Vjcna+TfCYvv3UPE7lgyceBLEiJEQ9/5HzrL+UBr/CQwu/dwGJXhlDtdrucXQ+8xwjVxhdVOsIzbriMAaLPMd0e/9YDYJBb7VDOYCmaqyVEVVkHY5BMZhwK90FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432878; c=relaxed/simple;
	bh=cOfH95iDKaBe/9QMXpvBhYJY7JBwmjKg8JZci6QJ06E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmtu1bfx99iOl4UxV9rQ7Z9DMR7MzqlfcR76AMBSo5AmB6FGqiy5gf9lYu1bYj6S2YerEdE11DWHYOQpFK/na9PvuJNG53W0Ff3EzE6NtThxF+Zh9Aih9iCHNMYHZXBDa2bIRgIzJW1PqnCkVN+e0tS+0hHG1hC3dNh1Q0QkMeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh6kT9ft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh6kT9ft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1874C116C6;
	Mon, 26 Jan 2026 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769432878;
	bh=cOfH95iDKaBe/9QMXpvBhYJY7JBwmjKg8JZci6QJ06E=;
	h=Date:From:To:Cc:Subject:From;
	b=Vh6kT9fttRYUxV9BCHdRelkBxDZWsZfm+EBNOLqm/NHjZsCfSbktAMxtLHUw9zOAz
	 0fXsY7+D5bsGPQsDz0il4HIcq6ZA3wUA+hLLnzb7AwQ0qIhyFrEJ+AmBRrLqSA1fcW
	 GF+P0blBDtQ2XCvwoRe2xFViGsWZ0P2BntEXe1JvqvQsItyZfx8UAQNtz7stiSnEIi
	 cbunIXX43vWS1jMlmg7JNLFtIV8UNJUHGv8GmwCfZqjpYdRpamYvRba6APSvon8e1a
	 s3nwencmOuDo3ec2CoqmaRfN2CSvyXy2ddyXXAmpWNu7M80+7NdZvbYd5wk8HuQ8il
	 oiQhnrmvSaLIA==
Date: Mon, 26 Jan 2026 13:07:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ntfs3 tree
Message-ID: <aXdnKldyCVLxrk78@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dc524tRZhsXDn8QV"
Content-Disposition: inline


--dc524tRZhsXDn8QV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ntfs3 tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_read_folio':
/tmp/next/build/fs/ntfs3/inode.c:678:9: error: too few arguments to functio=
n 'iomap_read_folio'
  678 |         iomap_read_folio(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~~
In file included from /tmp/next/build/fs/ntfs3/inode.c:15:
/tmp/next/build/include/linux/iomap.h:347:6: note: declared here
  347 | void iomap_read_folio(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs3/inode.c: In function 'ntfs_readahead':
/tmp/next/build/fs/ntfs3/inode.c:702:9: error: too few arguments to functio=
n 'iomap_readahead'
  702 |         iomap_readahead(&ntfs_iomap_ops, &ctx);
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/iomap.h:349:6: note: declared here
  349 | void iomap_readahead(const struct iomap_ops *ops,
      |      ^~~~~~~~~~~~~~~


Caused by commit

   099ef9ab9203d (fs/ntfs3: implement iomap-based file operations)

interacting with commit

   b2f35ac4146d3 (iomap: add caller-provided callbacks for read and readahe=
ad)

=66rom Linus' tree. I have moved the merge fixup from the vfs-brauner
tree.

--dc524tRZhsXDn8QV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3ZykACgkQJNaLcl1U
h9C6Sgf/aVZaIi5Q84l0ny0g41gb5iseFdVpMeIVJEpBfD5PNXmv/BgsI7siYcDe
hLIHZaOmwrhwADEhl+PCzEphxVznIfJuENfENMEEZX6gYyx+/iG9iTpJoXnWN1A+
2s4cbVi/EnZdn16a1XAuZyUs2OEFYbIeNNecCpVKvzEeds4AYrNtTjv5lYmSTs06
YiYrerAR7cqN5FdeChiZ8lSHCe7lFxmg2R5cdFBDyV7TQeuFJO+ALGdgVaPzHUNb
CsxHuBCCmW1x6SduIePgOGMC+Zme5fGNWEuvWk6fTz7cirmIbYzQN9cZ0NvAjBiT
uCWqBkXXSTRIOdcnJFA4KLxN6f3fUw==
=80DI
-----END PGP SIGNATURE-----

--dc524tRZhsXDn8QV--
