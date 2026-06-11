Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8131E851
	for <linux-next@vger.kernel.org>; Thu, 11 Jun 2026 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205920; cv=none; b=YwX5wTDnwEHhXChN+UKiXrluk3wHsIurNrKik9gqA3D1bJ5cEo7VSQ9uRbdOs2ZYPeXvAlDoXv3+IV/6vMchxJx7b+iCMagGwmE70L2/aEMCbBuBDy14xa8ZoPK9bb5JQxAQwz1Q8ZaHLg+IT94BdFOobKxdhnIraoy3NqUNUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205920; c=relaxed/simple;
	bh=69CP+rUJqMdml70K2jRgCi7aBycg01xUPzjtmYy9DXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEEHZ22p46C2oTeQGUx714s/wIPq8RXoEOG8OR/bdQc+ulrh6gbq+VmVohCFbK6kSLOiUyW5c/dARPpTtJYadXGtXlhaU+zDMvdGCAUm0RmyM+ja4xw7QJLE5498ISmxbzVik1hkPR2xcrIJd2JOqf2Rp8Sywn/Iby3fOnRQE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CmliRVDw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CmliRVDw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=W9U8Xw4zcBtdVCWe0jaKnjmDeXvszByT5N+erPMk6ns=; b=CmliRVDwEbKkqiQ+lSbIUSfVCs
	+CcY7U0XtC3qw5l5UPW/uWr9Qy+do6EWrPlUdj6JgVFgw6lEOPglzej0yhDLrCzmC+/MM5Foo6OJr
	Xz7+Uxz877Lbc5l8SKdHD6rX5+eMMBFJ9ZPm2qoqSqF7QcZ+wfUvWosYmrUl64SCuCMBotshcyOh8
	e5tEruLrb3BoNqhURnjMnrrkuOfM2xUeNeDS3iweDBB2z/ltQP9pl4im5jLzQT2fNSNlxs5l//q1A
	5Rtr44mrWVjNlTjeo1XGk5TTEPiGPsrceu/rdSHzsvdh0swxpkB153JeRxBv+hTzEoew9A5oiTTHN
	cv0Rec0Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXl1i-00000009wtR-1MeB;
	Thu, 11 Jun 2026 19:25:18 +0000
Message-ID: <f4ca5f0b-a897-4249-8b04-759dc2d10610@infradead.org>
Date: Thu, 11 Jun 2026 12:25:17 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 10
To: Mark Brown <broonie@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, helpdesk@kernel.org
References: <aimIc7ciEUrhXV23@sirena.co.uk>
 <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
 <ac803cb5-37c8-4e41-af3b-1c15955cb219@infradead.org>
 <20260611-invincible-whale-of-progress-69ffd1@meerkat>
 <aisC0nU0ZnN7wv6e@sirena.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aisC0nU0ZnN7wv6e@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/11/26 11:47 AM, Mark Brown wrote:
> On Thu, Jun 11, 2026 at 02:39:19PM -0400, Konstantin Ryabitsev wrote:
>> On Thu, Jun 11, 2026 at 11:24:50AM -0700, Randy Dunlap wrote:
> 
>>> linux-next-20260611 is also not present.
> 
>> Not anything on our end, afaict -- the latest upload I see is from 20260608:
> 
> I see kup running and didn't notice any errors, the output is lost to
> scrollback now.  I'm on my laptop rather than my desktop, presumably
> there's something different though not knowingly.  I'm not sure it
> matters, I don't know that anyone but Randy even looks at the patch
> files.

Maybe you should just announce that they are being discontinued.
It will alter my workflow but I can handle it.

-- 
~Randy

