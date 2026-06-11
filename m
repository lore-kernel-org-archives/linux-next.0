Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D342189D
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781202300; cv=none; b=m/61ic5ppaa3YnGc7u+kMmcOI2cR+pIzaA2e9qho29MDbNswQ09rIZQrE87+EmQsnWwRF6NeI/6KH2MYRPnMjYy4afeK1QqK3wfpxY0SluNgsCYQOUAxlPCw1v2vQWzKPuOa9Km+NMREbWK9tDQILY9o8OXqFOMDTk+XIbb3ju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781202300; c=relaxed/simple;
	bh=owZZJjYzyhDDkhU6hsliIlxsNen07l3Ujri4ZJjJBvg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=V6G9i0ZffWVdnN53Zx3WuNiJsnQRGIzSGVm2oB7gZ7n5mXqtR2YlEwigM0H9T2gUXpdw33Kj5d2FIsnH5yg9ggJMjMCr1X/NbJBJ4UJNbqJE305EQjxrJn6Mvkcgn/Hm9Gm3XEzGgQ8WEiZX15v7zV2fvzIXjpQfGNTATjZMtWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TNCJ2/a3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TNCJ2/a3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BL4k9sHila5h8aTBGt6/5LSrR88aJ3UszVQ7em4g/4Y=; b=TNCJ2/a3Q2tBfb91uYkwnboK75
	YcslXk8l028ya4LvLucA7Nsml9yr4HBlwbYO+yO+9LD8So7t3aDDaPR8f8spg6y6LqK6YSdl7s9af
	VBsEd/AKPtWSTv6JDVlNqxgSxrlX+6keL+s8LNFPqnlKkLvZYfrVf9PMBByJvbCcpIOwRY7tSLZtE
	fafBtVEZj3zudpCh+dmGR9tn8TgesbbrEXEET3CDC7CA18pYlhwrPnBjAqIY+xODwQ3sEn2YLtQ3q
	C3IHm0KRurhPf15lNEtmfADGumftwRouAuQjrwsjlsl2fi8DSfqzg//pEyOjUW4/rYu4eNKHaDX4+
	qga8nuJw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXk5I-00000009stp-0S7j;
	Thu, 11 Jun 2026 18:24:56 +0000
Message-ID: <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>
Date: Thu, 11 Jun 2026 11:24:50 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 10
From: Randy Dunlap <rdunlap@infradead.org>
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, helpdesk@kernel.org
References: <aimIc7ciEUrhXV23@sirena.co.uk>
 <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
Content-Language: en-US
In-Reply-To: <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding helpdesk@]

On 6/10/26 3:57 PM, Randy Dunlap wrote:
> 
> 
> On 6/10/26 8:53 AM, Mark Brown wrote:
>> Hi all,
>>
>> Changes since 20260609:
> 
>> ----------------------------------------------------------------------------
>>
>> I have created today's linux-next tree at
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
> 
> linux-next-202606{09,10} are *not* available at www.kernel.org/pub/linux/kernel/next/.
> The last one there is linux-next-20260608.

linux-next-20260611 is also not present.


-- 
~Randy

