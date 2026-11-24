Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507502;
	b=WJvpvgYmRt/vh2Mu2q9SZwWnQ+CyrYre4w6kqkX2XPpb7sF12vlRYdg53zhO2qjWvDhU
	 tIscEplGSmS4YrTrbbh0Gn+UV/WnRPz4J3pwoevc5lmZJ2Omj8qJaKZEcvTUilR2i1V97
	 i4JQErFvlG86madtAlPfPwgrt4Y7SFzoxWswcpHKRGnAFbih529nCivEZ14sHkpzc7KyM
	 jNKUCUAjeeTf5rk3WhvC04jRPCetbFmu8RxAKiUq53lMspBcoEcpU3tqnflxmcVGRPTKV
	 2sRuZ3UfIY4lqkFkKUT3TApr4oMtVhjoT2t0+rgzWJ+THp8W0aehSSLT9h+eMeel51Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507502;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3HC82NVkbK8m0ga+W4WqoNzdUyFnsAsAxDCHHKqThXY=;
	b=VYcaJHDKpBjjGxtukApBpTlDbVEQg9X8GZuk8djDrY6VYffaBSykrB0d3IRaHl0XwsDC
	 XbyOdJZcY04ddbymTGNs3OmC7wcrjTTLK4xkRydUI8ZgxYn17poNu7H/IncEQ3JcPk/eF
	 NEHnc3gBa8VVpj3Tk/UDVb9RXCbUVMw1V3rkXfL4sVncvQ3mbn5CLe29jE26E/XLdDhJD
	 3i+iGh+wWV64Ensxhn8e1/BabeMQsGuINKCD14IRXnEeRLdqUbyaZNJQmVojDpRWCDi7k
	 5WYJY4MI+1hkkWxU3CTFNBSRZ16IsmJzJXC26VJIRHRJQdGR+6mol4iA5BDwm+e3pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yi0u1s0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06EB606A321;
	Tue, 24 Nov 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yi0u1s0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA00D1F000C6;
	Tue, 24 Nov 2026 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795507501;
	bh=3HC82NVkbK8m0ga+W4WqoNzdUyFnsAsAxDCHHKqThXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yi0u1s0xTDjXiFCGrH+PYO6uyNf2nNnbcaT2FNBiv1lg45sqzBE1ibk3ba7Cc7CUa
	 /Ga5a8o1TMgnQWK1yQzwoN6N6I6C8AhHBmJhu4GG7OgUXQBQFCjRuxbtH1uK4W9uS7
	 qbdcHKEtOuM4olSP89Pktl9wYkEKIglOSLXESosI=
Date: Tue, 24 Nov 2026 09:04:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Mark Brown <broonie@kernel.org>,
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
Message-ID: <2026112441-reprint-wifi-4398@gregkh>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <20261123212627.1203724-1-sashal@kernel.org>
 <2026112402-squid-king-c8df@gregkh>
 <3dee4f97-5d49-4aed-bb6a-e3f2567566a9@kernel.org>
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
In-Reply-To: <3dee4f97-5d49-4aed-bb6a-e3f2567566a9@kernel.org>

On Tue, Nov 24, 2026 at 08:37:30AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 08:28, Greg Kroah-Hartman wrote:
> > On Mon, Nov 23, 2026 at 04:26:27PM -0500, Sasha Levin wrote:
> >> On Mon, Nov 23, 2026 at 05:45:01PM +0000, Mark Brown wrote:
> >>> I did not specifically identify the commit that triggered this, it will
> >>> be some include file reorganisation which causes PHY_TYPE_PCIE from the
> >>> DT headers to become visible to the driver, clearly there is a
> >>> namespacing issue going on here.  I have ignored this for today.
> >>
> >> I sent a fix for the driver yesterday. It renames the driver's enum
> >> values so they don't clash with the dt-bindings ones:
> >>
> >>   https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/
> > 
> > I'll go queue that one up now, thanks.
> 
> Fix is fine, except that Vinod disagreed (and did not review/ack)
> original PHY patch, so it really should not go via your tree.

Ugh, ok, so I should just revert all of these now?  I can easily do that
too...

