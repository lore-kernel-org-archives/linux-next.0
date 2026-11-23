Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469190;
	b=asRzY4V06qvHopery7LftAbaEYBk+C7Edn6zCsC5Yq/m19HHiA4LUjhjM0MYAH+T+dTQ
	 g6ZQO4awWu2pd5wc+SsnGR58iGmWi5RtoAHCveozRfrdGJR+GaOSVrczA2QwFouEfrV+t
	 Vr6L1d4vuSv/mNTVJd+AHwfbY3gm8JVFTMoWhLu54wJraNwCJ4v1CppRP45ZMkRVCgHpo
	 3ZB+aPqOXV4i5IKBSqCpBULNMOWhSY/DDFUdhGEF/Cv+ezV6YsSOR8zKcpXOpcENsZR6A
	 93A5ENdJXg8Hflq9rCWMKhxY4BnL4UMULhr76XqYGE/BbzLPWW2OFPaQHIfbUDaYbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+iWTLE/0hLAupgxxnA4BzEKPp5orZKZGckOQh2A0pLg=;
	b=wB3GYUkeiZCr++m/VbGiFX/9cis5J17bir7LSp8nSDGJWpOlIBxQxWEA1cGD5Q8k0pKu
	 rEyQa0heBe7Zy1OLyQa9AnqRiEzSHYN/+4QA7EVqYIwMlvaFb4n+++PX9ptLpXdNkt+4K
	 rB76a8B+B0cp14BcmisM8+AG/S63QiNu2LAiAF/xlphsj4wABaTTNrx5B3sMjF/FM1BBp
	 8Jlg6RFPtZjQMeUHD5EiDHTNT1EAmczY+7PxJrb+AtSZYNfpIaQctlE96HfPf+Wnu/cq/
	 auWwp9PktyAhupP6XR5McX7cGCNg5iu8aDURDYOztvWG3WEzZGUiPrVwCc60/obvyPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hY8lg8xN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF14606A32D;
	Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hY8lg8xN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43A61F000D2;
	Mon, 23 Nov 2026 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469190;
	bh=+iWTLE/0hLAupgxxnA4BzEKPp5orZKZGckOQh2A0pLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hY8lg8xNR8MktreoktReE9AmEzJfCNfMJezuMp4ZLABd2RdSrVSb/rypc1M+ZL+fI
	 zUvk/WgZE3QcpSw/Lx2+eknbH/XSXEXV4BiJyMdfU1l5xObRtM7Lv8RJ8UKSEBxLQI
	 4i0ieflGKeAdOYfqA8c+gNW4WC/i/XsuqFI1bjX7D5cbNisp3TW4xaaKrFsV4Btmsf
	 qRdKYlc9qN6oaL/Ta4hcetgF1zoIon0GVfBKmNKHl67yEUcyiARN+V1Oo4odpqn2Rz
	 OzWriP8F5jgsS3Vwr5+TAWzElt/WMHWov+VASVeAXDfzOh7wTdldslwTf5UguIGyz+
	 HpbVQi9MJh1ew==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Date: Mon, 23 Nov 2026 16:26:27 -0500
Message-ID: <20261123212627.1203724-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awR7nSOWkxRm-iP6@sirena.org.uk>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 05:45:01PM +0000, Mark Brown wrote:
> I did not specifically identify the commit that triggered this, it will
> be some include file reorganisation which causes PHY_TYPE_PCIE from the
> DT headers to become visible to the driver, clearly there is a
> namespacing issue going on here.  I have ignored this for today.

I sent a fix for the driver yesterday. It renames the driver's enum
values so they don't clash with the dt-bindings ones:

  https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/

-- 
Thanks,
Sasha
