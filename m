Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526526;
	b=j0tFNnY0t9WvN3JBU/+hTJmH+Ruic+erz5cmZWEJztJxoh78Z6y0TsGCTC6E1bTAoHjZ
	 YhNxIjTSeZViXBbj5WzY4BC9rBsIBVtYOA7KG2y+4+4ED7jK/vb1HTy69IcjXlkr232LG
	 Jz6iUJbpdkki49jsPqHataOeZD0EwmCj+F6C+tfA+UbBayNkfbTvQDsIs6gwxYyc20Kra
	 knxaezWsq5AnPmLWPputBYqF2vqHDRJr8DThe8euzm3lcWBRsb4CUf7Yax9L8mV15RzDm
	 +V05UD1v+uLUBXrcSlC+I5ejkm58htfB8d4By3K8ZOv+aD1s0C+C+FenVLzOri9yEdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526526;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hEQTEzj4z7EGgJGTIqw6/dn7ImQMy7zJW7p2PBefmdk=;
	b=mEYjhsl9L7Xk7yt79P79jBXWa6b8xjIeiZaOCxsK0YpofZdLBuZeqMiOmxU8nRmac73l
	 +U+CuCIiL9vV3EFhL1tcQImaff5Sm3nbexxTxL9SnSnx1DWXfyLnH3MnYSSAHwDDYgdW7
	 OLwdeibdZTx4yWaLizf/TRw7w/rWS/N91y8DoPSl/RLl4fveWqFThoNEPdxHgk2CusbpS
	 +5pzrqYPuev8jbDUajPd30xufXi7TmrNvm8Jy5dmNVhzbg1FgYy+seZoftCfpUnu9FoOw
	 wbhxROs6P1uOdhLcadx5ZHvSmBpTLK2PO8Nhr+Ov97B4xSCmPWWcl5eELPZ+X/PcCmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gruDqnjS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B029F606A31E;
	Tue, 24 Nov 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gruDqnjS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703EE1F000C4;
	Tue, 24 Nov 2026 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526525;
	bh=hEQTEzj4z7EGgJGTIqw6/dn7ImQMy7zJW7p2PBefmdk=;
	h=Date:From:To:Cc:Subject;
	b=gruDqnjSh2K+dAUDky7iY0MgJW23y2NOoi1L+CAR3PsFm4v1rrtJcZ/5q3v3KSh35
	 dL29YhIiEz/0g9CSiYusB/8nccDc5zavFsLlX5FQAyaFskWjwurJvVjnQtZdXeXovE
	 egRC0v8dLHVgpRiPTLgp6s52N8TymnSU3wZx3Tr6wqyq+tc2nduDE+41goWgD0sefd
	 9l58iIMwuR5hQkW8Os69zmRgavy054U8gusa8uQPp8FHGDNSCFU1B8CWmpUVk1mmnm
	 EU4aOA6jcWXxVmuCq8PzFECvtEUKvJcyrFMtG3cemoskaAQVsifhm8TyIvKqrqT6c7
	 wRSAxySzNCfaw==
Date: Tue, 24 Nov 2026 13:21:56 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm tree
Message-ID: <awWPdLOz1qSIxz3u@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="PelgfO685Qq08/4n"
Content-Disposition: inline


--PelgfO685Qq08/4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  d5a8187a567b5 ("selinux: recheck backing-file permissions on remap_file_pages()")

Fixes tag

  Fixes: ea7e2d5e49c0 ("mm: call the security_mmap_file() LSM hook in remap_file_pages()"

has these problem(s):

  - Subject has leading but no trailing quotes

--PelgfO685Qq08/4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFj3MACgkQJNaLcl1U
h9A5hwf/bYKQ/iVqnzq+DBDGMCiGw3VjMNQ/4zdMhVdNW6yotSq9H4wT/uf/z6Ja
ZZcvUY1myMoq6PvXci1A+JUf5KrnAHBr5zc9XsZFaMxDiniG4faO6wtc2SquJW5j
U0Kvd+BhUh9LphnyOpUdpcOTzT63Vk40PnbbpUx8GrDyZWpO3yaVEKIwqTYnOzEs
HPOHLxb7CsPLmE5tIROr7W3V4Ih/fCo6AqgqP1x/xc4wiiP9OLNlIoVun8x6H4fm
FSAzxpxmPo/ucSF0zFdvGXsqFR9ZDm/iHqS7/kN/whzOf86/He5t4v2/dOwtJdWl
PRkQLNluL1ZWO7UoqgHThRmK867WDw==
=wyff
-----END PGP SIGNATURE-----

--PelgfO685Qq08/4n--
