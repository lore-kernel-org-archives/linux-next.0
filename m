Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458604;
	b=V0rRUJ/71Rl9EX0+kE3TQAjix2kJSwjGm214OVL1U2wqXPOK74WQ7Tr5tZudEnJ1K8iE
	 HBmVMhUqWaTakFDrh16o5UbuG7HBxBrryheA2EiVzozpZhG8YcFPO5NckHV87iqPUxR0Q
	 HPvDtcmhC3Nqt0hZal/EZDM6ROAVjuZC7gjp+ZewwQlHTFW/swOPh1eMWu8l7O/vX44b2
	 UkSOpnidGFO9OqYVYYPSN4R5dsssl0VYz1jhlXlhyLzfcn53zfW/12jtAkoDzmZQpdXSL
	 pwTYdFg5+m73MKs8XqsT1fIbLq+ZRWG13oHc2fez5YMGA3aLNbjM0W+1RxMWQjC9SEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458604;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fyUAUi5oxhhYilSiVXE6GLrm2YgJbDWSSc4cn/XIy9c=;
	b=khOhN64jeLYVv8FMqqdZSV0rMnLFHbkdaSpR+S9mhOyKBX0jDRiHjmOLPwoDYvDnBfyZ
	 BRuOgAXq/4VX03Xf0MZfRDz3fahOFk+0OHuR7VYTC6VI3wzBxY5tHLv9o1iVVAMDKRcHc
	 9Nz51FFeWcau9HMdADsaUhaBE4LBQEpXXxSVOzTFTvn8JgwHy/RXnXrAGQVQpcnt+Vpvs
	 niHpP8fFDnCjsVK80jhHSyNou5DTpfXmaLQXfm1VgLM4rwYT/ia49VhAT2jKoXDLIYn/z
	 6eb86CVF41AyEK1QH5j63kESbSLQx/mtrcAhvAKjlIoxwe40uT+75C/+BYqQejpsYvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsPrGeOm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A40606A331;
	Mon, 23 Nov 2026 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsPrGeOm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D120A1F000D0;
	Mon, 23 Nov 2026 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458604;
	bh=fyUAUi5oxhhYilSiVXE6GLrm2YgJbDWSSc4cn/XIy9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NsPrGeOmm+yPzwZpOrUCR0ae29SRTnt9PKP4MPdikgrsulOIkaeX2WX2XFF39+eym
	 f0lxYeHOW4w3XkwmaPpzgSh9eROpTMdTeHoCER5b7lYuP5YWCC0JsiD15I4kMB9NeB
	 KXjw+0NFHFD7tAAGc5K+BYMDsK47E6xOBG8jR7MkAPv2gjInn6JHhEr46WXte5kSJu
	 cu+qD0ZeAx2Kf1vejNPt8S52XwfFOcFBbDEwyyQPEWRvBqv/f95W/wMwAcp8/eol7K
	 pyIGvXq9YuxM6Zq7hF714iYK+wkoiHgXa6ecBurZGC9M2cUfIgUKnMqU8z7wuA84nS
	 +LKH6GwS238Ig==
Message-ID: <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
Date: Mon, 23 Nov 2026 19:29:57 +0100
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure in the final build
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <awR7nSOWkxRm-iP6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 18:45, Mark Brown wrote:
> Hi all,
> 
> Today's -next has a build failure in the final build for arm64
> allyesconfig:
> 
> In file included from /tmp/next/build/include/linux/phy/phy.h:25,
>                  from /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
> /tmp/next/build/include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
>    15 | #define PHY_TYPE_PCIE           2
>       |                                 ^
> /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
>    47 |         PHY_TYPE_PCIE = 1,
>       |         ^~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>   127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
>       |                           ^~~~~~~~~~~~~~~~~~
>       |                           PHY_TYPE_PCIE
> /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>   135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
>       |                           ^~~~~~~~~~~~~~~~~~
>       |                           PHY_TYPE_PCIE
> 
> I did not specifically identify the commit that triggered this, it will
> be some include file reorganisation which causes PHY_TYPE_PCIE from the
> DT headers to become visible to the driver, clearly there is a
> namespacing issue going on here.  I have ignored this for today.

Commit b28eecc89399e5371483f03fecded33a26a8e655 was not really built and
exposed all drivers to DT bindings headers. Referencing other headers,
including bindings, from kernel-wide headers is another suboptimal
choice here.

Greg, that's commit in your tree, how about dropping
b28eecc89399e5371483f03fecded33a26a8e655? Authors probably built only
defconfig and thought they are done...

That commit was not reviewed by Phy maintainer, so it should not go via USB.

Honestly, I do not understand why author - Krishna - combined there PHY
and USB in one spot.

Best regards,
Krzysztof
