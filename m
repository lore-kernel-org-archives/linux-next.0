Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3102D3733;
	Tue, 10 Feb 2026 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700760; cv=none; b=DTN5jNghpW9vU2D99dRLdA4wOhxlGhKBYResZd1EdPDIhPIS2rLwz1FPsIgOCZqVV2b9dZdDu0jcKZpF4a2ix/18y8d5sW9criH+isHz/aveQ1ab8aRJ0O0R+8Pkn9nn+a2RIw0y9na+JLfPJPa8cZTzcq7uB8T+2oHmrf/jJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700760; c=relaxed/simple;
	bh=RO8xhFWKjwhDTNMhmsrm32RpgUP7sLJn6gmilTiP+rg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQ1N8NUaJxmfopJaU94pPj/vwG2jratjtqCj6Hck3xHtTAu84Ta569o1u/F5XpCEvy5ihkjpT23Q7stFE7dlxgzqqQ3IBBG4XibGJ8s+Wv2pCVEO+bzdup6rvFcREmfkWZaQ3y6/K8Ov22KoQlV17MGcaLclbjMyBQIgKlAsXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ideP3PQu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ideP3PQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1770700749;
	bh=PQkOaom1fuMH2JcH7GusxpQcGSzRYXx3nMv6e1NaaFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ideP3PQuuRIUkhM38lRZvpSO42MTZWm0AUwU1MQJO7E24O4rEkS2Lnipv7AXC7qch
	 yepseeRzSGoaX+DVVUTeDBOcOdXZS+qMhsN4goPcvt8rrXoTFkkRK2nwRUhs/VbtIW
	 aQku+//06ynKQ0/J3tfYMAWishZxovv+XpYK6No+b4hMyVeWKRxJdusLRTsM9jdv5G
	 JDSCnt5D0hRAARH/jBJkx03lximO9F2rBaymgIQYDXH+hxCcwNj1BIBy2OLNAwERZS
	 w26qMV5zLqMsG4OlAP9P+WMUFyUL8ZsLDp6Fu9NfAzp4MB1ZMDupC93PWxR/0lGZn5
	 +DjW55mpOE/qA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4f98xQ5Rqzz4wH9;
	Tue, 10 Feb 2026 16:19:06 +1100 (AEDT)
Date: Tue, 10 Feb 2026 16:19:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux Next Mailing List  <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Andreas Larsson
 <andreas@gaisler.com>, Christoph Lameter <cl@linux-foundation.org>, Chuck
 Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>, Dipen
 Patel <dipenp@nvidia.com>, Gabriel Krisman Bertazi <krisman@collabora.com>,
 Ingo Molnar <mingo@kernel.org>, Lee Jones <lee@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, Tyler Hicks
 <code@tyhicks.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20260210051904.1d22a634@canb.auug.org.au>
In-Reply-To: <8b249d75a33bfde87f725e89c2b82c297a2b1b45.camel@suse.de>
References: <20251215184126.39dae2c7@canb.auug.org.au>
	<8b249d75a33bfde87f725e89c2b82c297a2b1b45.camel@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fOni75moMGcGp2gQK+OJsog";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fOni75moMGcGp2gQK+OJsog
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Mon, 09 Feb 2026 13:33:32 +0100 Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Stephen,
>=20
> On Mon, 2025-12-15 at 18:41 +1100, Stephen Rothwell wrote:
> > The following trees are going to be removed from linux-next because they
> > have not been updated in more than a year.=C2=A0 If you want a tree kep=
t,
> > please just reply and let me know (and update its branch).=C2=A0 If you=
 want
> > a tree restored after it has been removed, just let me know (and update
> > its branch).
> >=20
> > Tree			Last commit date
> > =C2=A0 URL
> > =C2=A0 comits (if any)
> > ----			----------------
> > (...)
> > dmi			2024-05-14 11:23:02 +0200
> > =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging=
.git#dmi-for-next
> >  =20
>=20
> I have DMI updates to send to Linus again, so I have updated the DMI
> tree above, and I would appreciate if you could include it in linux-
> next again. Thanks for your work.
>=20
> --=20
> Jean Delvare
> SUSE L3 Support

Mark (cc'd) has taken over linux-next ...

--=20
Cheers,
Stephen Rothwell

--Sig_/fOni75moMGcGp2gQK+OJsog
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmmKv8gACgkQAVBC80lX
0Gxaggf+LN3yBRs+rDdBu6fef9+KWPSYhRu0gMCx8WzitaF0Pnvyn2x2DSxgEc8E
m7mf/rMcrvQ9Rdgpj6t1BTR/OkN9fwzfHD03yDBDWQb+tbTiLIfQimgG4AOZ5msD
TyUskjboOHU5GvN+orpjaD7vwJCnSMJMch40wZWOQKfWBiTfdXePmAASYFij8pai
tNuEam7mx4j5eoh1F/eMt0Di9UtD4gnZkyLQVB2g/xvA73gdVm2MQc/GJ4zdWkce
V0sqtLYDYhUP0bozHEDMFqsO5C4Eo8RputBTV9oc2iqbN3k5XroeRrfALr55oQLX
vP0l8ksEkfFHwTrO7vvdC0VRrJYWLA==
=hOPJ
-----END PGP SIGNATURE-----

--Sig_/fOni75moMGcGp2gQK+OJsog--
