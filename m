Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166B1A239A
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775863934; cv=none; b=DCXw13Iqa3a1Eq8z3gEyLLqaQpkLa5STYU8g9XCkPgNqxtP7StR7T5YPT+7r79NaGGr3mZk5cqYF3BJlFd6janw9glGNSVHR/PTR2HirrhkvpTUlAWiciLzJRmViaMU1MHQf+aKERNfraEFtxNl/HeuLlbrwMsZh2YDu95gmWDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775863934; c=relaxed/simple;
	bh=0qivxTH8RMSB1p7NMGBCwGkg5LqiDEtrfcw/mHf9o7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhYKUPANAcCxmsz8kOyZvFt/hVb2M6EIdP/zIlU/ZbXX3ADNwnAP8m2mEp41gKHLKVQVkxDAHSCt/ZxWSbcYuODg6VoDfsGMNIcv++Mtdi9x7QVtfP+k3jnC2S24wA1P9nZ0zMAJzIcAtz2oaySukgc+5b2ZpMIjbUXBxKfxh4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bzJ7J24g; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bzJ7J24g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TSFKfWnr5pkL9nCQG2CIBQ8MRLbSJqYdPr0AgoMU7zA=; b=bzJ7J24gYpAjkoq/2P11q3weSl
	y6G+0LWhStkE1BpgtjMuLZIjvdr2qL/4Pmq8sJXvbcEyK9YIZFpLeYDcHyocVnz5SvWbOFZ+qSFMX
	d5MXcimDt3cKBADrgPwYm+DKRTg+gjy/ibmFSR8GqGTQ8YxtulqrSUKDCgO7wMoc5CmiDZz7Lfev5
	UaLCAIFDuKOcic2zSe7cNys60sI4oo25rI9h6V2cw7q6jJjk8xQglTKUH3R/P9QlmxdpLNwNUnPqU
	WUdeOg1kL9XHzhExNDO5E8+xFHe3JE1GhxQbNBiSNrN9WB5MYjeRb07+wv60bgZQzlsuAHntj4HK7
	U7MGRLtQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLKa-0000000Cvn0-3SSM;
	Fri, 10 Apr 2026 23:32:08 +0000
Message-ID: <e1a1c2bb-cb1d-4647-8639-8ee86b218509@infradead.org>
Date: Fri, 10 Apr 2026 16:32:07 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 10
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <adkN9ZX6xjhARbbh@sirena.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <adkN9ZX6xjhARbbh@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/10/26 7:49 AM, Mark Brown wrote:
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.

I don't see today's linux-next patch(es) at
kernel.org/pub/linux/kernel/next/.

Are they delayed or something else?

-- 
~Randy

