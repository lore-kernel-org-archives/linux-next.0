Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185505;
	b=OPuwphyAbxuJ/YuGuSlkgAGU/nyAqAU0+jdCSMzc5sggBICriGHqgv1c+oTHDavKG2of
	 hS4VPp4eMksAvkp67kpApnePwNwWKCoW3gy5hCfrZTupFCaQQTGSn9VucouZpjxPz7gHj
	 vi05W5FIJjdykfne6/7KD/Aw/NMDoxowUpbF+6oFDfIbmxa7D92oxJHja2zVut+KDFuvF
	 6hY5F+NYcK/Bta4PnFvTMixeIsQ1TNBH4cja6Uc1xpo37Hvwnt6UkSqkA+wCrHkVUIizB
	 6mpf7npGuEMMGzVATUl1oxvYPZgq/LybBDKoGHbWONVPRB30DnQfYkHFccRa2guP2zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185505;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=FiucLThVQpnoepBk/1gWetfX0GaBGBzGty/mxhYcb2Y=;
	b=cOl0Mz+H8PPPePhw5UN7Y9sBJFP6YQnmjBCZ8nla2nS9LnYZqJrVOPA2Ug/t23x9/pSM
	 PxegzFtQKkz8L0prlXRT6DhkVGvr4xWVWVNbbdtYFHifGiVBLGQ8747WVLCmrd/E9HUEa
	 aMGPGd6/xjj/4XH1vnSziAmDpGLppMDxS1In7UHWkmECktaR1H9+oia5piytktRvpGfwR
	 1Bc3kVHlcsEDTT3kC+lZLWSfwOWXnbY2du8H7EBoe0GLifQN/Wtjd40QJxLIqC7ZdyzYk
	 ha09xs3dABkYWfXl4c5XeL4N8EfxTT8X9US4qm+9a+HV5NMZR28/v+jIPxEZm2FNxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvtTaOks;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59214606A320;
	Fri, 20 Nov 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvtTaOks
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92351F000D3;
	Fri, 20 Nov 2026 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185504;
	bh=FiucLThVQpnoepBk/1gWetfX0GaBGBzGty/mxhYcb2Y=;
	h=Date:From:To:Cc:Subject;
	b=SvtTaOksuW8vPtmiJ6hAyk31hsm+vR+XAPOS7ZNdCse6N9CaIgJZaEr4ZI+zcFjxi
	 BU+V77fiSzslZs0sPPqnWYK7b3CXAfYnVstLDKgpL0DnKVh6zB2YWI9MigjdfG3K1i
	 UjvUzyLgCXqXjWy8avKwOealIaXC7YUko3QtYWXdu+ZoPuZsSMxyOE1XYxqTVWPhCk
	 Gcx3WC6Al0zL72uJp+JnLmAUDtWa5r19OXy6oR1vunDo3ZqwdROcC9Ifq8N9fKEDCc
	 8n7A+nVSUKXqtkqYp3B1TcCTpY6zT60pQVVIPyxhnoRGVYC0CV6xqI17Q2FGGPXT7w
	 huTkbcJZc2L4A==
Date: Fri, 20 Nov 2026 14:38:21 +0000
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vhost tree
Message-ID: <awBbXedlwxO4cDpB@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="okMwW0w8SUOsw0FZ"
Content-Disposition: inline


--okMwW0w8SUOsw0FZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ad74886a8429a ("virtio_net: mask callbacks before handing off NAPI ownership")

is missing a Signed-off-by from its author

--okMwW0w8SUOsw0FZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAW1wACgkQJNaLcl1U
h9CFQAf+KgTijhhfJo+0l0BEbuj2WP+LhHMrXM+PqqaY2alzJhSGjZubaSOXXzrG
YvaStT1OSY3OUJXkds6raBSEg/dhRGRwwCjygaMV05RHU3mLB7/W7l7sIeSiTMRY
0mTj856GUqq2I5fXXdhxN3S4aJ2vYycjo238/sth2z1/ixMWkokSLDL/9Ism2aQD
bj8mSOox3KsSWXqMkBZnPr0fFz3+gIUkWX97GF5/qrIdRv9OxLEJojGsjvk3OSyF
agE7MYBaHCYb3WQhM0fsbvVqZO81wCFuQeciRBz6azeBNTvDQ7Oyo1qtMkrMSy50
2OldOg1WRLfS3v3K+z/1f8yA4KhVLw==
=XnqF
-----END PGP SIGNATURE-----

--okMwW0w8SUOsw0FZ--
