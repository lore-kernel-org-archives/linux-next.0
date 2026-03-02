Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBDB2AD03;
	Mon,  2 Mar 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467123; cv=none; b=VfHlzR5JpMi3iGphEPrddaSFP1lrUjYvDApnT7KJoJSfYv+mwljxDo8MX9mSPO13O4eWF8he83QY4XwZcKnH3oBSLJey8oqTg5t1SDhsVnes2wMbSON98yK3bE19x9MTgdW7vDFieSVEJx21kE3lr+vHnllz16DD/Q9n6hyTTqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467123; c=relaxed/simple;
	bh=cE5V7z3qniA4GsbtPX4vo9Jc1v1/T+w7xbuXnxILfU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frnX4pUGdE60Tvz70DR9DbQhYSXZG0QaJyC6s9DEIRkJZke0VjXAjRyaWJoQtU8p8EeB5M94lB6oEpBQ0oTY+dbig0MbuZruinmkjUDeczHX8JlTuMU5GpfxyfNRK51OC+naImm0HRSIdQn0meHTTuOyrWFquKPRLRLHXp7s+Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXO767/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXO767/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F55C19423;
	Mon,  2 Mar 2026 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467122;
	bh=cE5V7z3qniA4GsbtPX4vo9Jc1v1/T+w7xbuXnxILfU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXO767/g7hfA9XoWcbT89OVbpRDr8T/EEIBgWZhjGLt51bdYZ5oMruSj6zRwZC1KS
	 Zgr+xMgH8+tiGUIOEk8WWHX21aqz64uGg4/LGlpho+t3qTTtpJwZNMAMv0Fvl5KEA1
	 8SEke3LphFhmGIO228bCQR13p7NQlJqGZgek6RuLTNkzRdvtuJB9OdttaDAPfmSsxb
	 jPhMFhDVJzL4H/AAi2b3rnafXwmc2AMpVW6ZuBb3+qvkioIr71e8WMFA2/FEamZGvo
	 mB4+GjriIOGfbLR3h09vSR4GYJdeLGZ2JauR8+DVuT13qKAD19chdYMrvN+TQXilAq
	 YkyKl1dqQr4wQ==
Date: Mon, 2 Mar 2026 16:58:16 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Denis Benato <denis.benato@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
Message-ID: <aaWzSAThxAb7nEuw@beelink>
References: <aaWXFVxygHFpKNxv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWXFVxygHFpKNxv@sirena.org.uk>

On Mar 02 2026, Mark Brown wrote:
> Hi all,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> /tmp/next/build/drivers/hid/hid-asus.c: In function 'asus_has_report_id':
> /tmp/next/build/drivers/hid/hid-asus.c:732:22: error: unused variable 'err' [-Werror=unused-variable]
>   732 |         int t, f, u, err = 0;
>       |                      ^~~
> /tmp/next/build/drivers/hid/hid-asus.c:732:19: error: unused variable 'u' [-Werror=unused-variable]
>   732 |         int t, f, u, err = 0;
>       |                   ^
> /tmp/next/build/drivers/hid/hid-asus.c:732:16: error: unused variable 'f' [-Werror=unused-variable]
>   732 |         int t, f, u, err = 0;
>       |                ^
> cc1: all warnings being treated as errors
> 
> 
> Caused by commit
> 
>   Fixes: 0919db9f35832 (HID: asus: always fully initialize devices)
> 
> I have used the tree from next-20260226 instead.

Thanks for the report.

I've queued a fix on top of the current for-7.1/asus branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-7.1/asus&id=7b2f88cc9dd4c2b9f3d6f5377b45ed9c90fd2fe9

Denis, if you disagree with the fix, please shout.

Cheers,
Benjamin


