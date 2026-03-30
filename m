Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B132E6CB3;
	Mon, 30 Mar 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882155; cv=none; b=QuZd06Ri7o6EN8Xhy2jlSDNpS5nf8IH7qZI+YHc5fHjm3pIEZde3/1oZqitnRa9LpB1BCvfaF3Wp9ZT1PmoL1jSZ7B1w8xz05vu7+OxxrGzP5r9l85EAVN2ZSgeIgbzZ+RSadP6wfCEvkyo6UP1ZG5jrpphpjgqPBBHWV3CDa4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882155; c=relaxed/simple;
	bh=xsjU8Wl2FJ2EtOap+eH4hze8sjphkkTqXTkzl5bkgfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7J+il65QiSeW87HPXbp7RHSVgR8NQM3vmNWP043JLJNORaKkO5jLAVyEd7q9mGTmyz1LQm9yEK0YL/McbxJhjVlxUTdqSi19iCO4emElphOO9cDKxecN2CvzWCxkoRpNX9ZtPZgdOd5W9+X/oWs5fJhvBaR9j1ZVZDXgiScLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 77D193F01D;
	Mon, 30 Mar 2026 16:49:02 +0200 (CEST)
Message-ID: <92f6df37-49c7-4572-9fde-3802c5535a2f@hogyros.de>
Date: Mon, 30 Mar 2026 23:48:58 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the pci tree
To: Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <acbrkFFGPIVppK0B@sirena.co.uk>
 <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jm08tRz7Zb60MFJSKYEUt4cv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jm08tRz7Zb60MFJSKYEUt4cv
Content-Type: multipart/mixed; boundary="------------qu1FnxBWVc5Xy4mdn5ctRLQj";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <92f6df37-49c7-4572-9fde-3802c5535a2f@hogyros.de>
Subject: Re: linux-next: build failure after merge of the pci tree
References: <acbrkFFGPIVppK0B@sirena.co.uk>
 <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
In-Reply-To: <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>

--------------qu1FnxBWVc5Xy4mdn5ctRLQj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDMvMzAvMjYgMjM6MDYsIE1hcmsgQnJvd24gd3JvdGU6DQoNCj4+IEFmdGVy
IG1lcmdpbmcgdGhlIHBjaSB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82
NCBhbGxtb2Rjb25maWcpDQo+PiBmYWlsZWQgbGlrZSB0aGlzOg0KDQogPj4gL3RtcC9uZXh0
L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmdhLmM6DQogPj4g
SW4gZnVuY3Rpb24gJ2ludGVsX3ZnYV9kaXNhYmxlJzoNCiA+PiAvdG1wL25leHQvYnVpbGQv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92Z2EuYzo2ODo5OiANCmVycm9y
OiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2YgJ3ZnYV9nZXRfdW5pbnRlcnJ1cHRpYmxlJyBk
ZWNsYXJlZCB3aXRoIA0KYXR0cmlidXRlICd3YXJuX3VudXNlZF9yZXN1bHQnIFstV2Vycm9y
PXVudXNlZC1yZXN1bHRdDQogPj4gICAgNjggfCAgICAgICAgIHZnYV9nZXRfdW5pbnRlcnJ1
cHRpYmxlKHBkZXYsIFZHQV9SU1JDX0xFR0FDWV9JTyk7DQogPj4gICAgICAgfCAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCg0K
PiBUaGlzIGlzIHN0aWxsIHByZXNlbnQgdG9kYXkuDQoNClRoZSBmaXggZm9yIHRoYXQgc2hv
dWxkIGhhdmUgZ29uZSBpbiB0aHJvdWdoIGRybS1uZXh0LiBUaGUgdmVyc2lvbiB3aGVyZSAN
CnRoZSB3YXJuaW5nIG9jY3VycyBpbiBsaW5lIDY4IGlzIGFuY2llbnQgaG93ZXZlciAodGhh
dCB3YXMgY2hhbmdlZFsyXSBpbiANCkRlY2VtYmVyKS4NCg0KVGhlcmUncyBhIGJhY2twb3J0
ZWQgZml4WzNdIHRoYXQgYXBwbGllcyB0byBhbnl0aGluZyBmcm9tIDUuMyBvbndhcmRzLiAN
CldpbGwgc2VuZCBhcyBhIHBhdGNoIGFzIGEgcmVwbHkgdG8gdGhpcyBtYWlsLg0KDQogICAg
U2ltb24NCg0KWzFdIA0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtL2Nv
bW1pdC8/aWQ9Y2RhMTVmZjM5ZGY4MmVmNjg0MmFmZmViOGNmNTdkMDA5MDcwODIyNw0KDQpb
Ml0gDQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0vY29tbWl0Lz9pZD1j
YzZlZDQ3MGNhYTIwMWIyNWU5ZTdlMWNhMjExNDRlMTc5MTQ2NDRjDQoNClszXSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzA5Njg0Lz9zZXJpZXM9MTYxNzIx
JnJldj00DQo=

--------------qu1FnxBWVc5Xy4mdn5ctRLQj--

--------------jm08tRz7Zb60MFJSKYEUt4cv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmnKjVoACgkQfr04e7CZ
CBFPJgf/Ts7rybnvAeFudycP4JgOKKKgiG5Kn+8oWAw+lFmuudfsgDOhMq4/STlm
9TXCSNmxrGlu3d/+73grregP/oFUS+d5gG2W3y0UDJBDVbUqC7ogXypmPitq5WIh
6zP3WbrZxJ7EdUt/VZcu/WtchNkuMyrN/Hr78aIDRtsQSWfISVAsclaDF6vYdTRE
iSzfG1LhxV3kUPfR1QNpyt8fpY2/XEpvYx+RyH97xp9cM65u7iYZMlvKLicmL2Ch
gZZ5nJQg/ix/d7RyZheWaM6VV2ug9BLQ5kt6TLGs511aLFl1Bl7xnLC4zpoKDFVF
LUfPc3mazg3zfyod0hupy1nJb3huaA==
=Ev6s
-----END PGP SIGNATURE-----

--------------jm08tRz7Zb60MFJSKYEUt4cv--
