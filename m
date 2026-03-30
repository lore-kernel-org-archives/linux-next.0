Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA53A7589
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857395; cv=none; b=gEIh4ZyPmopWYXWayy+58tBUqEP+noSR4ZCdjptmfBB1LPnrR+rps9lebjQRxDnEdXgXwHm/LmwasFwXoZb5Xex7loF13tUFV023vh2xkM2GFulGQznCn9au3qUzmOxoDgkwEYLPballT6a7XYMxt1QBgfUxA5lYZ54VJUVwD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857395; c=relaxed/simple;
	bh=F4x/kFps7B6igrmbbJd3mm+AaUTk36/URg5TvlLkvDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=M9ekFWR1wG4+nl0+ZlBotE6Q9tX3vY/qqQv2nw6UvwObWRT9SN1EoC8EZ2XXPbmTdGKcpy3yp83vJQETrWYsCF594vQ2ZS/bEiFkehfbCzUWyxUc8e3u1X5elyTdyR8Sev80x/4K4syjuYPZFI9KzxrHghVTNtaAtpqyYltVgqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MVGoRZpl; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MVGoRZpl"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260330075631euoutp020e34fe8765bdc885f09dd410b199881a~hj2TbmjmA1175411754euoutp02p
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 07:56:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260330075631euoutp020e34fe8765bdc885f09dd410b199881a~hj2TbmjmA1175411754euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774857391;
	bh=oSZmpC3weZrOfFszh4F/k0Uyq0Qo2d2k6Wjwtkym/Tk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=MVGoRZplvBTD8vgwIM5oZM0HKVsUJOZvGSaCAxK38LROGIHXNvXPemCyyczlPZy57
	 VtviAm1cpgbOJj6xJ55y2qZ7tUnRnRIJh5GOo5+E3rfWdmu6Z3hwW9XQHkHr89R8rX
	 o1CGhzaYy2xaFPcaPnIjiZlX5BuXdKdxIwyQ3KHg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075631eucas1p2cc480d26cc812bde31120d4347be3e56~hj2TGPGJp1391813918eucas1p2u;
	Mon, 30 Mar 2026 07:56:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260330075630eusmtip29713aa49c5c97e64f4369b789d82dda4~hj2SyDdEV0756807568eusmtip2j;
	Mon, 30 Mar 2026 07:56:30 +0000 (GMT)
Message-ID: <9f63a789-79b6-46fe-8177-b08e1ec120f9@samsung.com>
Date: Mon, 30 Mar 2026 09:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
To: Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Albert Esteve <aesteve@redhat.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
	Mailing List <linux-next@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <acbjaDJ1a-YQC64d@sirena.co.uk>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260330075631eucas1p2cc480d26cc812bde31120d4347be3e56
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327200715eucas1p1953ce4c0b4d4e0cd95844f0acdb7ac3a
X-EPHeader: CA
X-CMS-RootMailID: 20260327200715eucas1p1953ce4c0b4d4e0cd95844f0acdb7ac3a
References: <CGME20260327200715eucas1p1953ce4c0b4d4e0cd95844f0acdb7ac3a@eucas1p1.samsung.com>
	<acbjaDJ1a-YQC64d@sirena.co.uk>

On 27.03.2026 21:07, Mark Brown wrote:
> After merging the dma-mapping tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: vmlinux.o: in function `dma_contiguous_reserve':
> (.init.text+0xbf3bb): undefined reference to `dma_heap_cma_register_heap'
>
> Caused by commit
>
>   3a236f6a5cf2da (dma: contiguous: Turn heap registration logic around)
>
> I have used the version from next-20260326 instead.

Thanks for the information. I've dropped that commit from dma-mapping-for-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

