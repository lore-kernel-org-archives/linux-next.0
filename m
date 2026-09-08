Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801245505C9
	for <linux-next@vger.kernel.org>; Tue,  8 Sep 2026 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904390; cv=fail; b=L7cmpKP4ulgUYaRXqEOc7PboUqxtzdprXqECkJmUUP+qIajJgt9XKdK4QJmMECtA3e7u89r0uY+0599982tvj4r+TGm9azlT8yzky5getP29xizLsBG/aLZ0tlbvujrlEPP5ebF987k1xE8ZarSxnMz9jv1jfwgHUhRzpGADPNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904390; c=relaxed/simple;
	bh=/aWJRU/TwaNGkLi+OQ8XmbZeqbJMsbje6pmJJDZ69Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=WKo1d7MP+ePsdCMJy25Lhb4IxiXNUiiNoWBOkUc9TcdtJxAZyxUeohR7ltTDUhjbnrC8Y2rh4ViuJ1b6J7rn9WB9pF8cHu0nSap/d99ffAhfnPggQTQFmRup1bKdwAgwKRXcQM/CduSNhVUg4zfTyHVg/r3nJGTunHORgJZSHVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=7PPe/7L0; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=XK5n6ZbF; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="7PPe/7L0";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="XK5n6ZbF"
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from smtp.sapience.com (srv8.prv.sapience.com [10.164.28.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id A3449480ABA;
	Tue, 08 Sep 2026 17:43:41 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1788903821;
 h=message-id : date : mime-version : subject : to : references : from
 : cc : in-reply-to : content-type : from;
 bh=/aWJRU/TwaNGkLi+OQ8XmbZeqbJMsbje6pmJJDZ69Pc=;
 b=7PPe/7L03RB8B3UVNQr5ge9hA3HfOpyGnRD02cNnjBzsMuTu+Xlxgn30k/hm8ou/qjpmn
 o4xDN6zCCtJ4nL5AA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1788903821;
	cv=none; b=fCRAiYphi4GPv3K99u6ZbANS3/pBncOhKFtJD6ni3Bg85CNh738teyA5pTfetSx8Ke6sP7HCTo2WOQhPZv4Bir4pLXgWarL9uS7ZhCPPrErCHBiyfzH12jGG/D0ljHzOfoJlJ8bU1ty3V+/tGvKD3vK6L9iG2jEAsjl104bz4QHMmemOOzQgPZj519rFLxJjc46y133tTcjno+ANHuGT1PBwaOEfszYru9LyuZqCJy0uetDkMCOaiDIncK0WFfdJPho0k0n2n5n2OgPdOPfDJ2VwW1s/mnV2PzA3twKyH9ColHCTuKQgiOij3katGT4NQuf+rVhkXFFO0Q17SNh/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1788903821; c=relaxed/simple;
	bh=/aWJRU/TwaNGkLi+OQ8XmbZeqbJMsbje6pmJJDZ69Pc=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:Cc:
	 In-Reply-To:Content-Type; b=CRhjtE/sBVYZEiPzt0cf5L+HT1PoGfg2SJsg+DOGkXxE1IDgL4eBMrR94fnNeH6kMSinQwdLnFBX3ewWbEPaIt1GBNZRbAyv4l19FGachZIu/VoF/6oZhhYszPKAUfsPkgYDEM6Inj8EoPJ8fQT8xIoOffWdxWznKmRMcJWVzyJKqkTMlBjaU4Emf2CUDC4qZa/8xFgooteCQG4b7zT0vs/rlMauUE0uCLO20jRDxKuoogzvwjEvL58Ms8rrmaec37uvenwB8740dMA1oJXeSmRhKFPMgn/tqb3cl0F/S/XZOytJpOnAAd0rEJGQYK1D+5Tu02A68TSVdeqcfghreA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1788903821;
 h=message-id : date : mime-version : subject : to : references : from
 : cc : in-reply-to : content-type : from;
 bh=/aWJRU/TwaNGkLi+OQ8XmbZeqbJMsbje6pmJJDZ69Pc=;
 b=XK5n6ZbFVy9zQi09tZO8zvNsUGp3qv740AFVvRkz3R5dI4it0FKd+IZDeV/8MFpfUW/11
 GvVEraxFvw3APMeRybSLxWh0baK+K4Cnz7IdoiAHgreHZokv/N3lKa5nOLcnoIuSKqBESW0
 furDX7x4Fnu5yC5PHZQCTGdfu38yOD5atB6OHd9eaaMgY3SKn6eeAkk1JWQLPgDzT0ClPCS
 ROyLIjiu9WLC0hxUBEzek04HGdERYBjA9RMe0nds6j1vDZzfKz8zVgi+IfSQH2Uv/pWPMtC
 KSbNd2JHfH/cjRGtgsNO9f6Roxuoi7jJJ3rm4ekg8o13akt+WwHEeWfaNOXw==
Received: by smtp.sapience.com (Postfix) id 5EEF6280EB4;
	Tue, 08 Sep 2026 17:43:41 -0400 (EDT)
Message-ID: <b0ed4a64-9fcb-4cc8-9cfd-87128aa178e7@sapience.com>
Date: Tue, 8 Sep 2026 17:43:41 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 8
To: Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aqB2yt4vycjyNYTb@sirena.org.uk>
Content-Language: en-US
From: Genes Lists <lists@sapience.com>
Cc: David Airlie <airlied@gmail.com>
In-Reply-To: <aqB2yt4vycjyNYTb@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZRWJUAQFNkiWtD36SnViAwld"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZRWJUAQFNkiWtD36SnViAwld
Content-Type: multipart/mixed; boundary="------------iJml5q09DYkQaaI1L5GDbii4";
 protected-headers="v1"; hp="clear"
Message-ID: <b0ed4a64-9fcb-4cc8-9cfd-87128aa178e7@sapience.com>
Date: Tue, 8 Sep 2026 17:43:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 8
To: Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aqB2yt4vycjyNYTb@sirena.org.uk>
Content-Language: en-US
From: Genes Lists <lists@sapience.com>
Cc: David Airlie <airlied@gmail.com>
In-Reply-To: <aqB2yt4vycjyNYTb@sirena.org.uk>

--------------iJml5q09DYkQaaI1L5GDbii4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS84LzI2IDQ6NTcgUE0sIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IENoYW5nZXMgc2luY2UgMjAyNjA5MDc6DQoNCkZZSSB3aXRoIFJVU1QgdHVybmVkIG9uLCBi
dWlsZGluZyBvbiByY2hsaW51eCB3aXRoOg0KDQogICAgIHJ1c3QtYmluZGdlbiAwLjczLjIN
CiAgICAgcnVzdCAxOjEuOTguMS0xDQoNCmJ1aWxkcyBoYXZlIGJlZW4gZmFpbGluZyBzaW5j
ZSAyMDI2MDkwNDoNCg0KICAgUlVTVEMgTCBydXN0L2tlcm5lbC5vDQplcnJvcltFMDA2M106
IG1pc3NpbmcgZmllbGQgYGhhbmRsZV9mcmVlYCBpbiBpbml0aWFsaXplciBvZiANCmBkcm1f
Z2VtX29iamVjdF9mdW5jc2ANCiAgICAtLT4gcnVzdC9rZXJuZWwvZHJtL2dlbS9tb2QucnM6
MjY1OjU4DQogICAgIHwNCjI2NSB8ICAgICBjb25zdCBPQkpFQ1RfRlVOQ1M6IGJpbmRpbmdz
Ojpkcm1fZ2VtX29iamVjdF9mdW5jcyA9IA0KYmluZGluZ3M6OmRybV9nZW1fb2JqZWN0X2Z1
bmNzIHsNCiAgICAgfCANCl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXiBtaXNzaW5n
IGBoYW5kbGVfZnJlZWANCg0KZXJyb3I6IGFib3J0aW5nIGR1ZSB0byAxIHByZXZpb3VzIGVy
cm9yDQoNCg0KLS0gDQpHZW5lDQo=

--------------iJml5q09DYkQaaI1L5GDbii4--

--------------ZRWJUAQFNkiWtD36SnViAwld
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCaqCBjQUDAAAAAAAKCRA5BdB0L6Ze23F5
AQDMXa6K09LZm7bLEGnGHC0HYANjdMwT8kbOaD1M435eaQEA12SxcnaJZxOzZZtICddUkdCnj2c+
uHl8FGacmqgklAM=
=f6oB
-----END PGP SIGNATURE-----

--------------ZRWJUAQFNkiWtD36SnViAwld--
