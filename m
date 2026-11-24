Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505295;
	b=AGKTKWjDt0+dLJ7X9lzmjnQR4jUcm+JdUat8zd/GpCcnMUNVefsSyutpDShBUzZAbeoQ
	 5UZtbGmbaA4HaZpHFpoH0kg4OHTYbT/IJhmtx/QCESyn/Vt6UVq2QmfCXwsFEiS0DsAiC
	 SXzoSMHI7ob4xVOU+nI9SS6LOqrYBExzjeSNf2LmEVNg26rTrSy+9AchHBGqYXkwVi522
	 sNv+NFzgnfMfMYyA6nGBzQGKA9Sq5jcv/O+KPXsv5/9UWahhfT8l5ZRGZWTUDIGH9f/a2
	 o2uPUgpnrjXhqY59Vi/yvdMefEuRkFS3F28+RZCS+dgP1A8tc9frk0iSaAUFZn9F4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505295;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=66jrq+oJZdf0irrtzpu4akObhjJYRkg//+AlDyPnUv8=;
	b=BAUlPPvdKhq5l0nqu2JzASZnr89S60TnszAQ0nzG/qH/Qat6qnLUKQ4yYtUTkvN1zcCC
	 uXSAq43KVrKJtNs+OB2OMnHP5HK/wpi/1cTAflPWN20uocretLv7rcuEx3YJe0FRZcQfX
	 gn/Q5GANQ+uYUh4mQnncFFCvX986nNqi9dw/UDgHC9HaaKffm6dBXPIAQi5xFViNXz1oT
	 BBSRrhR1jY4mS9obPckyOpgfongiONkHxoUs9bSfPunOuLDqUQ45GddpNWeKIbgiongNh
	 FAiisfTQGs3QOYTjcdne+RfyKxAdGxoHe5upDSjewMWKJWcEdFAZbbxcOn9sA3DkO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="15/CTDVr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DC606A31E;
	Tue, 24 Nov 2026 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=15/CTDVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A2A1F000C6;
	Tue, 24 Nov 2026 07:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795505294;
	bh=66jrq+oJZdf0irrtzpu4akObhjJYRkg//+AlDyPnUv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=15/CTDVrFH2SxtpCRrv/Y947QZufP/g6l3FNki8VHXKH2JrZsWdGUh9UFqvVpCeAw
	 hMNZRVtFZr52TldkPhxU+uLYGgebjs4LdvlWCSmepZ0tG1wb2COTOQGrI6omSnDRDx
	 5dcdDsWz/CbpmH4nNWzgEKmsgeSAnK6em+bVALEY=
Date: Tue, 24 Nov 2026 08:28:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <2026112402-squid-king-c8df@gregkh>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <20261123212627.1203724-1-sashal@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123212627.1203724-1-sashal@kernel.org>

On Mon, Nov 23, 2026 at 04:26:27PM -0500, Sasha Levin wrote:
> On Mon, Nov 23, 2026 at 05:45:01PM +0000, Mark Brown wrote:
> > I did not specifically identify the commit that triggered this, it will
> > be some include file reorganisation which causes PHY_TYPE_PCIE from the
> > DT headers to become visible to the driver, clearly there is a
> > namespacing issue going on here.  I have ignored this for today.
> 
> I sent a fix for the driver yesterday. It renames the driver's enum
> values so they don't clash with the dt-bindings ones:
> 
>   https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/

I'll go queue that one up now, thanks.

greg k-h
