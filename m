Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615859;
	b=0pCYzvWizrk7mgBpRNyPgZFy+YYIB2SkEnYgrrrTUd4yFoDK6FuHSXY9SJwQJO+W5OlN
	 YfO1j3wc4uFwe32zWz/b/P/VQOUgUifOyfsxHC+R76hNuBxi/8AewJyCZDyVW/ubGobLY
	 eVol7QVrhHI/H6fSVNqXtwNW3FeUCYIu89TP63TM7dE5s/K2Zs27JM2KYdNPHcNPjI0oS
	 MIXSkck/uyAneTL69QmRnJDuHWXdZm2RGNRL/dvjHmK0OrbXr/KOeqpEomqCzMaQr3vZU
	 MkCOiCuLcrX3urUbMQk2VWvJ/Qp86IFIO56/4eaVnasLZNqu+KLk+IAVwcE+qboSH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615859;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=D4XlDwRliNQ1rIXf449qGaMXO1jwikzJ7AFA3uugmTA=;
	b=JhLMSq7/7skXn1gkmQrw96x1eTeV2+2q/TfgHRcGVjVBPSgdj4mhpMn6R9I/Ogmn3qhX
	 M7YBotekP70XgfrputZNaICnFF67i4Si0+Md089CboZb6hrsgrxo+6MYmdO0c/DUU1Bqm
	 m+W5MdI2MlMXMW5FVYpQj0YJ1WV3akAbGYd3mdmdcRrDbjB9WviNwDjcPox5dOO5uOKYy
	 LC22O+sZHlj/8z8/9cCg7PM9t7gd7BhhunvqN9AdP1jkLQetSeoxIp0HMSX07IMpnKITj
	 KJbmuH60uJE755165SgqhsNq7Kb/xCBaY+MQ7Lstfbe/Knem7MZuGHZtt2bmYKY9Sow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EveBqfj+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E9D606A68C;
	Wed, 25 Nov 2026 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EveBqfj+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E231F000EC;
	Wed, 25 Nov 2026 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615858;
	bh=D4XlDwRliNQ1rIXf449qGaMXO1jwikzJ7AFA3uugmTA=;
	h=Date:From:To:Cc:Subject;
	b=EveBqfj+yd8zasEAAR8fPL1v2MLr+9hwgH0UsjcQeXb1G8mH/ep+AX4p2kHzIgWGx
	 apYHMNsGleL9UGo/hvQ+/5utOms4LkeufMyJ+sSOboIDHmKhVRzG1jeY77lcxdSv7c
	 J0YBrh7Ec/DNTbeaVniOHauURJwtfzeaJWcKpGKJP4qiA7iI7oRAkwtvtJHzNnop+F
	 JvGnzcjZrLRPpz3g5X2qghJyWls5H10cgpVgfzx5Ju2hFr42dmVPqfdJFWXPKj9GSz
	 VNCc7PO7K4jqfQ8XR363/t4ZCXGtr5T36l8a0X7r+MpTAmHvsm0hO7uqN7usXpJAzR
	 0G8kII6OLiURA==
Date: Wed, 25 Nov 2026 14:10:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsb-f3Z8gHODMQ@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="zMtiYAUyOxG6Z7QK"
Content-Disposition: inline


--zMtiYAUyOxG6Z7QK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  5cd2a045e5c18 ("arm64: dts: imx94: Correct the lpuart9 clock")

Fixes tag

  Fixes: b0d011d4841b ("arm64: dts: Add basic dtsi for imx943")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--zMtiYAUyOxG6Z7QK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7G4ACgkQJNaLcl1U
h9D6uwf+J7ezNZIp3fT+1kuHzX+cNR2po58rDJYiCKyVxCo/H0TIJKyeomdJLSR3
HsmjM9NIWW/n+MIsZyXecSOmqVuieuLyvM9Ttmop9uET/8SBVK81yCvp3+LbEOPe
Hv+QM7SFvywcihHmYl4vMWBBpveGs8z7S/Mu/LggLS/dKxE1ZjgfGO7TndCD2XPw
Yem8SST7j4aBZJYAcHc6Mmr7QT+5s7SUiEEGcJlg86l4FYuYntJV2gh93PMoMDkM
Kx9O0sL6kvkjGFm/SnTM4ku7TCBgH1SzstqRX5YH/q0DsreCe5w5dN/rzzGRvwq0
G26QVWXbe2e0PjgUFVUvdODBicIaRg==
=hqhj
-----END PGP SIGNATURE-----

--zMtiYAUyOxG6Z7QK--
