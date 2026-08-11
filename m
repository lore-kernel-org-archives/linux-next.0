Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A33C10A6;
	Tue, 11 Aug 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465419; cv=none; b=uQy4Yf3TL3+c6DXDhveoIHOSQkmr8/2P3sFiE5dn2si6iLd1VfXqfZymISp1rjvE7sEwKSnYjLvfFY/c/DLMWQczOiW4w+iq0mOsxAKwXfaWKwMFCB5T+6gqY323Hm7pZxKXJcpXtGm45GvgraJ2wWgrFHlUmH3uG2SAWPbPqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465419; c=relaxed/simple;
	bh=aXYeryUzifEtAoDqfYb3kM8lVoQSCmLB2H2GeOu7pc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DG29LhJ+wwmGG1PxHMOi/y/lE7aXKk5H0GQnhijmbn4DSrWQQ4KIFvK8ryE1SolJCeVFG9ZxYsR+lRFH/EyirYkQZJmtWDbH09XmPmZ7hFQLkUhgQUP+mH4Skn4ofIHp3xre2/eMjWS9nJrj708Id9kZWIYaRw1v2K7wFAQi2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKnqLOhb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKnqLOhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D658C1F000E9;
	Tue, 11 Aug 2026 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786465418;
	bh=3+Wg5e12p5g3+6Kn8WansyfhpEzXEzqUITK6tf4stG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKnqLOhbQcUeBReb9q5RQ6rKsV4kg8cLtKKHxla1CMnL5MPP+mFoeyQGjGUYObjf+
	 TgBPbr10s+jhUMXHu97LYjRmZ50zyi2ujcufd/r/EQnVDa4UOI86YBNVHWxC0u0mmi
	 B8i8NfwbJU6OfmK64aoKT/HjIJxrArBgB+9SyR6E0GeaoLplpFMQaxVaYPFCxKT3kI
	 8e6gXcNbJZklndjz+uGCr4jAZxqhDmZvv+GzlVedi6zFuzzOFETqPM7bv1DtYvefKF
	 xQVHjZ4JUYizkzPtQdvnNZnzqDSpcPDH4L2p7JaNIlykBGIIuX8gHs6gnHm+xe+xSs
	 acB+V0dU4eHmA==
Date: Tue, 11 Aug 2026 16:23:36 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the f2fs tree
Message-ID: <antMiIWwTOybmHu9@google.com>
References: <ansbnhNDd8s8Inc6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ansbnhNDd8s8Inc6@sirena.org.uk>

My bad. Somehow I missed to add a header. Now, it should work.

On 08/11, Mark Brown wrote:
> Hi all,
> 
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/fs/f2fs/inode.c:1065:6: error: call to undeclared function 'current_is_kswapd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>  1065 |         if (current_is_kswapd()) {
>       |             ^
> 
> Caused by commit
> 
>    7451b3cd93b30 (f2fs: call __add_ino_entry out of the eviction path)
> 
> I have used the tree from next-20260810 instead.


