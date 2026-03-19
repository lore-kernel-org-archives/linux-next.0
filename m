Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826B2877DE
	for <linux-next@vger.kernel.org>; Thu, 19 Mar 2026 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942289; cv=none; b=XPjZtGdD28JvCcqKwCXxMdOo2H8FRA4AL2sjTqpALlbskoU6Cy2JWJVTUyZ1aX+j+LkcLCbm8crizgICexhx+IU2W/xyMoAxuGBst6SCGwRia9NBKQ9XU4kN7lGVsjP63nZNbMXNEwd5GPaqcDOI73vBEzXUbt0tHl79ngQwATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942289; c=relaxed/simple;
	bh=X1QJ6VVdH4zc/r5hAtH1hKf6gL2ZUW+M4VW9mN/hY9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWLtZJ77qZKy6ZEhygQiZHb6wcCMkqdfSpQAeldb8gBherZMvCL8H23dlYu1iBaT/o5mcYQ2Mq+GOxBxWHvTyT3V9IaGgbumgmFtOYeAVbcZtffz8tNr6q2TXGKVE9bRYiCBQJiL28fq22oF5bpSTmawkpvo8amSJZih0XNUrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=j4Pam32X; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="j4Pam32X"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fcCZp0JJpzj3Z;
	Thu, 19 Mar 2026 18:37:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1773941873;
	bh=FhmQfj9V+ILCA/jQTSQcX4G6wmxZloB3kO6q6HRLdzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4Pam32Xqpqx8S29FnTmrzQZkjN4ivJginbtd+VL1+K0EPBEGf6hJ7Y0jHL4cRjjC
	 LjgQGBDAx5376iUCtym8LyfhgGFOk9JJnO4HpQ8JHbDWaggqxxUc9egJBBGWwlq4Oa
	 71mNhBliEl0zhWNmpo+1D9XfxjpLyE2HIQeekv2U=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fcCZn1bKXzryf;
	Thu, 19 Mar 2026 18:37:53 +0100 (CET)
Date: Thu, 19 Mar 2026 18:37:47 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Dan Cojocaru <dan@dcdev.ro>, git@n0toose.net, linux-security-module@vger.kernel.org, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Subject: Re: linux-next: Tree for Mar 18 (landlock docs)
Message-ID: <20260319.cheiB9iechoh@digikod.net>
References: <abrYTGOZRH9oP2GQ@sirena.org.uk>
 <f2a83432-f0ee-40a2-a3d0-71eef9db48fc@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2a83432-f0ee-40a2-a3d0-71eef9db48fc@infradead.org>
X-Infomaniak-Routing: alpha

On Wed, Mar 18, 2026 at 03:12:39PM -0700, Randy Dunlap wrote:
> 
> 
> On 3/18/26 9:52 AM, Mark Brown wrote:
> > Hi all,
> > 
> > Changes since 20260317:
> > 
> 
> linux-next/Documentation/userspace-api/landlock.rst:198: ERROR: Error in "code-block" directive:
> maximum 1 argument(s) allowed, 105 supplied.
> ^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> .. code-block:: c
>     __u32 restrict_flags =
> 
> 
> Please insert a blank line between ".. code-block:: c"
> and the code.
> 

Thanks, it's now fixed and rebased.

> 
> d37d3347aa59 ("landlock: Expand restrict flags example for ABI version 8")
> 
> -- 
> ~Randy
> 
> 
