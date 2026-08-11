Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907D4519B5;
	Tue, 11 Aug 2026 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786469128; cv=none; b=Pp5Pamouem/aQkezB+8a52av1+LSGyH1zIXaVtcyvDIKlUrSg3X2GNP9hzXfVRN7REL+i7O4xVmyQCV4Y6IUQ7/oHTJNx5AqBlru9gDQ57bfalDAReSYOM698Ljlzq48Mj7JAb/fNlka9Tk1+XfSJyYV8SESsH4wwvKSmJMpDSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786469128; c=relaxed/simple;
	bh=5KlOBzBYIW+1+bdaCOSJqCM9vkbvSg24mSmW9KGLweI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQp8jASYcrMbIhBpA14EkRuJ+LfAZDZUhHpDhBpuMXG296mJ1iOxshbc3fdS2DaqOoNu0ibXCbkJt94xRvumEJ0jTjDNWcXV34Gm80dJaSFKb3F9woI8FEJNQJr/cbkLd+gKGrCrVMnMo9w+g1h6//h2HMxzhZab+O2X5IT5+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HZJn2qbX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HZJn2qbX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=L+BWV05XO4xsqcbnbkoKMlIwrmfz8Tu32HRZx+hIv1c=; b=HZJn2qbXUgzXXaZEP+9ipj9RAj
	YLYbtlaS8m+3BUwE2mbVH0SojkklOwS4V3j1bOZMvGXSQh8U42EbS3jKyyR+puJmzICy3x85QrFey
	+roexCs5I/qjib7vVLNsLeRI7+1TatSLh/1umZImbSusRSorqAOp3D53E45Xm9wRNfsqiXiuNGUyY
	CTTuQZpgwVWeTCrSsXfB2I3uaM2cyOB+B0tEODRGz176uETl9X7eUAg2138AZyVEEqRDaG0wJlSLS
	z3mFs0IneNZFyGffSHgOf9edw2SRJyoAKui/Ii97qbFvxY12IyC+fVPfzhUOe1F6I2l7u5uxx+cx4
	9qxd9/Xg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqE9-0000000Edny-0p20;
	Tue, 11 Aug 2026 17:25:25 +0000
Message-ID: <e7911812-9b99-4f94-be6b-597bf202ffeb@infradead.org>
Date: Tue, 11 Aug 2026 10:25:24 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Aug 11 (include/linux/mm.h)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <antIrd2ds2OiEsl5@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <antIrd2ds2OiEsl5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/11/26 9:07 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260810:
> 

New 'make htmldocs' warnings:

WARNING: include/linux/mm.h:2326 function parameter 'vma' not described in 'vma_is_cow_mapping'
WARNING: include/linux/mm.h:2326 Excess function parameter 'desc' description in 'vma_is_cow_mapping'


-- 
~Randy

