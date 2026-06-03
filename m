Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA933F210B;
	Wed,  3 Jun 2026 18:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780510675; cv=none; b=VPaHGokuXNdWPOmIW5MbDJh9dHG4rM2R4Av3AITLkdhHVxNo1fJb0DyHsQdZVyCMtYDP9dhX9PB53mHeaHtyRC+0IiDl9MIXgIRRljNO8D/DqZZOjBUtgAHrSL7WRFc+6SHTAxvUNS9VaMrO/7oI2Fjv7hzPb0rvl7+yLmNwM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780510675; c=relaxed/simple;
	bh=4uYFAsX8kkXWIxDeqh2fuTt7cXpi+VWm6Vp2wT0GMhI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ffW30N2iDDuSXc4r3eTKPVW6lYLSBmG5dPA+br1BMvPn/SeTinMGPiG2WZ0USNlF61l6z/2tA9pOBev7sRkxiIdf4Q8AlZNw9kIlHukj5JT37BQdxHrPXTrZiFdNn1SmRsIPvXQoBJG7GCULj+haYCDxuELhQNSa0O4fJ/Klpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=D+Do3uBg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="D+Do3uBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29231F00893;
	Wed,  3 Jun 2026 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780510673;
	bh=jWst/yh/X4BZhUgJ2htLQgQ5WP3ByDuqU2U5DKgKG94=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D+Do3uBgUfeVdJOfAC4DVfTDXw4qLKUDet0jW/sCasYwEqjdk8OqWeQ1MdffGajhi
	 VeAs4wAFs5j5X+kbMFWXd1b3NbP8JBAhlaLnEXaWH3plWo+or+5gGwPoOGpnipe6t5
	 CEE+5OlHoZP2hGuwBD4t/vo0vW/qW6WUvjzNv5rk=
Date: Wed, 3 Jun 2026 11:17:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-unstable tree
Message-Id: <20260603111752.b77ca4f4860cf68926f832a9@linux-foundation.org>
In-Reply-To: <ah_2QuKro4gYRP1c@sirena.org.uk>
References: <ah_2QuKro4gYRP1c@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jun 2026 10:39:14 +0100 Mark Brown <broonie@kernel.org> wrote:

> After merging the mm-unstable tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/mm/khugepaged.c:1357:6: error: variable 'pte' is used uninitialized whenever 'if' condition is true
> [-Werror,-Wsometimes-uninitialized]
>  1357 |         if (result != SCAN_SUCCEED)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/mm/khugepaged.c:1458:6: note: uninitialized use occurs here
>  1458 |         if (pte)
>       |             ^~~
> /tmp/next/build/mm/khugepaged.c:1357:2: note: remove the 'if' if its condition is always false
>  1357 |         if (result != SCAN_SUCCEED)
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1358 |                 goto out_up_write;
>       |                 ~~~~~~~~~~~~~~~~~
> /tmp/next/build/mm/khugepaged.c:1352:6: error: variable 'pte' is used uninitialized whenever 'if' condition is true
> [-Werror,-Wsometimes-uninitialized]
>  1352 |         if (result != SCAN_SUCCEED)

Dunno, really - perhaps I fed you some intermediate state.  Everything
looks OK here so it should come good.

