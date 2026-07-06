Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCC13FF1B8;
	Mon,  6 Jul 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349578; cv=none; b=ZbEHnlLhwBXNQAEv+wLaTR+sk06vkh7L5eOMVns3X4LCxu+ShdGNFSWqDSr7rTu1oWJyceMPgO5KjxQ2zl/TzpzkJrgfWg3FR66tn7okClF9+dFcNa49SV4oOawSPzuiDLMX4fBn8sCHNL7i4TqtF8LAHslFyQLUBDNIYsSumR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349578; c=relaxed/simple;
	bh=mzVRGtO1BJxm7uyxtY8cOFzQE81Bn28lm0w9X3f0t0E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSR7G20l9JaBZMbR2ykPDdSB0oVQUV3pbqAMS1+H4ex17aDvl/87XUocnu0qQi1ulM/LTCcDy40zxHX5s/wH7m9gn2IpflvkQ4sEaEZSHOKohfz4/Umva9+js/BHST027CU2YbJe0d2pICvE7JuBxNCJc9EdLWJADU8KJAU1wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=none smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=BJhA2Bxd; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="BJhA2Bxd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Oi9pNdLhK4jgc8n6ZlBB8tj9f9pFRIsyIGT5hTlxTxU=;
	t=1783349576; x=1784559176; b=BJhA2BxdGdwkcJ/NIdcCistW3QKUCqGI5kXULn3Id/8kUh2
	yCHkyklGP2/m4+G2QK0FEv8nlFf3IAfjxgLPTM9XNegfGwBGbia2iOyMnLuYLWu0gBP9TVLEhUoIa
	sAttB8KQvhjukWNlmhbOgEcmtL2SsRzxZ3st7kYk8Pe/pcGQ77tOzstEKsXHDiQx1pCTSh9W5w3s7
	VMCitvz4oyeaJJf/2g/0v9s2KkD3zT2pxAxfqkr0UAd80Cd9+Cdacjt5dyCcOF7V77Kl5Ahx4TjF+
	IPnSAG7BNYmtqxl0jUxWQ3zTdh+w+kVw4nwMXMBgctJbv4nGOA98yfqfHP5APACA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1wgkgn-0000000DUhL-3mdZ;
	Mon, 06 Jul 2026 16:52:54 +0200
Message-ID: <6f2b3e5d82d50d056ddc7dab9355999541b5d1a7.camel@sipsolutions.net>
Subject: Re: linux-next: build failure in the final build
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Chen <jeff.chen_1@nxp.com>, Francesco Dolcini
 <francesco@dolcini.it>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Mon, 06 Jul 2026 16:52:53 +0200
In-Reply-To: <akvAuzqXtDrttQk7@sirena.org.uk>
References: <akvAuzqXtDrttQk7@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2026-07-06 at 15:50 +0100, Mark Brown wrote:
> Hi all,
>=20
> In the final build, today's linux-next build (arm64 allyesconfig) failed
> like this:
>=20
> ld: drivers/net/wireless/nxp/nxpwifi/main.o: in function `is_command_pend=
ing':
> main.c:(.text+0xa348): multiple definition of `is_command_pending'; drive=
rs/net/wireless/marvell/mwifiex/main.o:main.c:(.text+0xc188): first defined=
 here
> ld: drivers/net/wireless/nxp/nxpwifi/main.o:(.data+0xa80): multiple defin=
ition of `driver_version'; drivers/net/wireless/marvell/mwifiex/main.o:(.ro=
data+0x2c00): first defined here
> ld: drivers/net/wireless/nxp/nxpwifi/cfp.o:(.data+0x740): multiple defini=
tion of `region_code_index'; drivers/net/wireless/marvell/mwifiex/cfp.o:(.d=
ata+0x840): first defined here
> ld: drivers/net/wireless/nxp/nxpwifi/wmm.o:(.rodata+0xda0): multiple defi=
nition of `tos_to_tid_inv'; drivers/net/wireless/marvell/mwifiex/wmm.o:(.ro=
data+0xe60): first defined here
>=20
> due to
>=20
>    4c477f8bfc1a8 (wifi: nxp: add nxpwifi driver for IW61x)
>=20

Well. I've dropped the merge then. Jeff, please resend with things fixed
up.

johannes
