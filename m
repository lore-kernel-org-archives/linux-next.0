Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499343;
	b=19lYtSRZUhUmshFYO2sQIKmm+xBRfpl/lE9VPlyEAEUBk2iVW+KfNk+UuI8tHpY6K58a
	 FpgVfDWEUB4cP7YFHFjiueq4i8UfyX0l9GVfghbzABJQioSp+oFIFd4tSuBK2laRocdpU
	 g0ToYSWz2E4I9ZpuuRDW9VRLgtyLNcefjNvj37OwN1HWr4UE3W7rYYMCvt1F03MgpXQ5m
	 XzxT1kFjfiVdDRl0uqKxqJfYC4CzTgWGZMO30N5cnvMi81yJLuXXcglZp2RodYqYiRJgL
	 CFSZav3Gh1zt44Hide6ux5/qj88yZLP/LGzml00dtk0u6plIPWw3fhqN2o8tQgYmaIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=KPbEAvPl/y/xmk/lT++UYTQF1+NtwaKu78SSBDxxR8w=;
	b=140TLqRPxo7RCK20g7EailQd9nIHbrwjw3rEeThJ3Pfzw/sNMngljUP1b/JHJ0XNszlc
	 alhfaIsQeYFY3vV896qSh7bdy9F54Ya1rUiR4dSwHUXj+yS8d7Unf1wokYFQJMclSI/5C
	 paskNqp9aop3hR2qA9+VOGywBg57iiz7iFMZsxr45zzofWrKmkZ9s84m25KuEBl6D6NSW
	 UUz3sNls5AXOMOtTf1n6nqbI4AIpjBu7W0paxvCkpNZ3V5zHh9OsRB+1P3Vt1gpDirD4m
	 b5snxD8bHq+opM/7k2jScsz+eMJfi8DWf4qvT1qEc0/T2zHSCif0A9yBmLhT4vZe71Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NAqPDYQy;
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB3606A323
	for <linux-next@vger.kernel.org>; Tue, 20 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NAqPDYQy
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8BY12qVRz1QTn;
	Tue, 20 Oct 2026 14:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792499333;
	bh=KPbEAvPl/y/xmk/lT++UYTQF1+NtwaKu78SSBDxxR8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAqPDYQyFiwBn7Ubnq+D76aSFPj7HeI9OsB+/dpqs8Z3h+Vf0OUEsGXq+Kwb8e/Oh
	 xQ+iPNnuWYvItWz/u1NGng+DrAISbQAVr1tTEe14ExyNgYlkCcm5YtCvtKMShqxVfG
	 zupx2l2VBryJw4cbbO7dY475Hyo/NDPVbraGJUMI=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8BY05fDGzr0s;
	Tue, 20 Oct 2026 14:28:52 +0200 (CEST)
Date: Tue, 20 Oct 2026 14:28:48 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <20261020.ij4euziuYovo@digikod.net>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atc6Vczti_EjFrQq@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 10:54:29AM +0100, Mark Brown wrote:
> On Mon, Oct 19, 2026 at 11:11:20PM +0200, Mickaël Salaün wrote:
> > On Mon, Oct 19, 2026 at 07:17:09PM +0100, Mark Brown wrote:
> 
> > > This issue is still present today.
> 
> > I removed these wrong kunit checks Friday so it should be good now, but

In fact, I updated mic/next Wednesday with a new patch series addressing
these issues.  I only added two (unrelated) commits on top of that
Friday.

> > I notice that linux-next still has the next-20261001/landlock merge
> > commit instead of the latest changes from mic/next (which should not
> > conflict).  Could you please confirm that a normal merge works?
> 
> It was broken with whatever I fetched yesterday hence me reporting it
> still broken and merging the old version, I've just started the merge
> for today so I'll find out this afternoon if the fix worked.

The new commits from Wednesday don't add the bogus kunit lines (i.e.
there is no kunit_suppressed_warning_count() calls anymore), so it's not
possible to get the same error.

Merging mic/next into the current linux-next works for me, and
./tools/testing/kunit/kunit.py run --alltests works too.  Please let me
know if anything is wrong.

Regards,
 Mickaël
