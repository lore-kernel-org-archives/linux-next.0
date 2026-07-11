Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40A44999B;
	Sat, 11 Jul 2026 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755940; cv=none; b=GP5Cq4ylRAsxg2p0sK7fWldYc/CcsfE4Eaohlh8xO4qTrhvbQrhIjgT/u/hs6Rbbd6EKvSKUrx29QDmKIRkSkbYSYTeCG94+nfjp25McWeOxfo5sZLyFxsFVMTef9bw91E2bZU/6RkTLlPLqxJnLQ/zjd9h4PcvrVB7WRUs5SeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755940; c=relaxed/simple;
	bh=E1NK4KTZm30Mlxz0AW2N5aX3muTvtvJV/M5ny+RKYXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZJbdDtJJlUA+aFvL15crWqZHNP/IG5M2kX/2HQm2/SCoRqm9VmKBsuVuz6IeA2aGez0hiImOp6diXK3qrlasjeA/V3FGy00vyrufKpnb1sTyJbvqFitXXIsiBYp+WgwxsH0VSOX/OONmZ2hffkWm5fQ37MOWKCbr5zUAGZCb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuSJzrJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuSJzrJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66BF1F000E9;
	Sat, 11 Jul 2026 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755938;
	bh=yBGwZ+GPUe6dh5NHNBPgtKNBf2oTk7FAdgY2nP33C5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XuSJzrJTLDdxITkgJBOraiHJ4OZOEwqn1Vawt3QghgNlvejF1uYQ8gRf7N+xHkLA+
	 YUpJ6N3ZVeop70lGnLht1IHz62fgQrOQR482qSbLKoG7VM7dxX6VDuA7+DKCXoplxJ
	 E+rwGLayqXeGBA9pudDqwd2BrrqIH1NmuUGgeu1zEqiDjyHLHzZ6OaDfIsADzL1Pde
	 nCtII4PAjYsR3eM3eWagsqkpLktYGELQ/WLesVmpXjNAnEhNf7qyuYuLbyo0nqzfRD
	 yitvyP3VjIw0DfOV2rWXxO6x42Q8taz2moxNWuFZJyh6R8QkLbCY+8dvbsxTNke+CA
	 dBXJwyv7qv+rA==
Message-ID: <e05a4ef1-af8f-4525-9747-08531948ea36@kernel.org>
Date: Sat, 11 Jul 2026 09:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fsl tree
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <alDgvHf9mKOJI1cc@sirena.org.uk>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <alDgvHf9mKOJI1cc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 10/07/2026 à 14:08, Mark Brown a écrit :
> Hi all,
> 
> After merging the fsl tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 

...

> 
> Caused by commit
> 
>    4b265b93b4e0e (powerpc: Move CONFIG_QE_GPIO to SoC)
> 
> I have used the tree from next-20260709 instead.

Thanks for letting me know. I have dropped this patch for now.

CONFIG_USB_FHCI_HCD depends on CONFIG_QE_GPIO but uses in_be16() etc ... 
helpers which are powerpc specific, so dependency to PPC needs to be 
kept for now.

Christophe
