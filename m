Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2240D592
	for <linux-next@vger.kernel.org>; Wed, 10 Jun 2026 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781132275; cv=none; b=YcSVPnVJ/ou8+v2ZynkFdZWEQ1gUKQEa7PWmUkGdMlZXu30D87ib103iyvMMLRlTAk8Plg9tfAZvYUDuup9LFDQQvqxZY0rmS5mEZ+ZKsjNwWS69nVGxUYg2omRsd/pinwpjU5o0OzYbP+R+dFNWOYBSR/qWxRNxu6Ge5nX559M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781132275; c=relaxed/simple;
	bh=Y6EtvNYqDrwmtVy+rjc6BHFg2tMQZeGh6M4lioZSb+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uotmrD8xf8XhbN5b/jNeAoCKjIa7yr4Yg9opcHjbc9psD3ejWw3I42VdzDich/Brk+ahQcl3+Zo5QR+ToiLdkC2I8Se/vEmsHqbZ6lqyO0Rd1pbPLw0rJObI+RF3O3BiHmVSSTSGSzUOJC4c9CgXsTXNigQjQtbDj9Id0TkLUko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HinXilvn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HinXilvn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tLFRG+G6Kev6HzYOH+EN+dR2016+TeY9zjqlZrRQvRU=; b=HinXilvnQ3XFEYhDB1240OWaoJ
	+wk5i3WJMWBBCYv/zOoa246ungyLY+OLTs4RkDqRudLyA3IQezeBCuNIaQF7oeW/gVLc5joq+quY7
	tfoPochyrvxZQFvZv/3d3Jb3wDZa30uAZblBr/GYxYO024dZ3039BMJTqpa5FoOmRw1e84Avyz8KQ
	F49Yd+VsCyvxdMDdkP1wtDN0HK9Wm30tI/sYcV94Cm+4hOS0q+oPUSB8uRGplgy82paZ32FbOYKSP
	X5as4721Jv+rsPpXTzDSCeWeE7s4O/o7HfzatdTNjYkcPHaofB1t/OrRWIk6rb63EU8bHMhCNjeH3
	msbPbgTg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRrs-00000008Qsw-3JQs;
	Wed, 10 Jun 2026 22:57:52 +0000
Message-ID: <608ff135-c113-4bda-9812-26ee8f8cdf7f@infradead.org>
Date: Wed, 10 Jun 2026 15:57:51 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 10
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <aimIc7ciEUrhXV23@sirena.co.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aimIc7ciEUrhXV23@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 8:53 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260609:

> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you

linux-next-202606{09,10} are *not* available at www.kernel.org/pub/linux/kernel/next/.
The last one there is linux-next-20260608.

> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.


-- 
~Randy

