Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337623E0C45;
	Wed, 11 Mar 2026 16:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245362; cv=none; b=r+jccB/Uis53u/gXi+NcGZnQFSozufsPdkiLwRejHyBwKDlorRZVz6VoVIlSAqoGqHmsMtr/6KHU/dQLvyDWBJXsdIS7et164kaxyjbEldg7dCB/BdeLF+xXsYc6SUC03ICmqjK7ANsYtqmQ8/yHjEbqHS8T/t/dbxUKJP0XNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245362; c=relaxed/simple;
	bh=sLYoC4x0PRetjEgC2mMKS7HLMiaKR7qwjU5E5l2BM1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGYAeaV22YCJ9WiA1PBQ+KiroAASuu+kaW+sewqtPnuqG2DD2OUT7f/0YExLxUCum0beIujktMdTyENJpeEi/jYRfukRmsEzchfL4JFPPvZzy5o0Msq0zt7jHD6OwI0UZPQTkf11j96a7fQSBdwbHSHsFyVSNyTNV6O1dJ+mSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vjd+nSSH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vjd+nSSH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W46aJluoqKux6fwx+EHjqsNWBvOg56m85xWwAY0SG5U=; b=Vjd+nSSHq/17q09xsiNJoRR1VO
	KqWXREVgdnt3UaHsRssgj4qnRNZIyBK4hfR/okpYAzJmlwHrXw9vx0N0yDYYX3ML5FvWqh4YCGd/3
	KyiEKYOTwh4AQRL5QPR+nTQUQGc6wg8m1x0MENg07Cvj2lzsu6N9vLpBI1fgh0PIwRSvdUE212ozN
	WZPb96Ufrf8PTGvHOisoPCLIHUYy0oJwyHTJrftM/dARSb9cgc7slLg/Jgd155trVlcEYmum1QS5E
	emglzcFcACfIJe083/q64eF5VTIp8wVzOpjNYAdkxLsyDE80zbAspaMEEBOyrMEXyMtEtVAqnBwsH
	J9k11OUA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0M7N-00000009rjs-3zPv;
	Wed, 11 Mar 2026 16:09:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D98B7300462; Wed, 11 Mar 2026 17:09:04 +0100 (CET)
Date: Wed, 11 Mar 2026 17:09:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	willy@infradead.org, yi.zhang@huawei.com, jack@suse.cz,
	tytso@mit.edu
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260311160904.GP606826@noisy.programming.kicks-ass.net>
References: <abBizpKaBlTZSYh6@sirena.org.uk>
 <1e549c32-ea40-40a1-a0bd-0ee87652ad21@sirena.org.uk>
 <20260311103743.GK606826@noisy.programming.kicks-ass.net>
 <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abF9Ti4pTYnnsMdq@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>

On Wed, Mar 11, 2026 at 08:03:50PM +0530, Ojaswin Mujoo wrote:
> On Wed, Mar 11, 2026 at 11:37:43AM +0100, Peter Zijlstra wrote:

> > [11:17:27] ==================================================================
> > [11:17:27] BUG: KASAN: slab-use-after-free in __percpu_counter_init_many+0x21b/0x2f0
> > [11:17:27] Write of size 8 at addr ffff8880029425a8 by task kunit_try_catch/37
> 
> Hi Peter,
> 
> I believe this issue is resolved with [1]. However, I think this might
> not be the same as the issue reported originally as we the original
> issue seems to be in mballoc-tests rather than extent-tests. I'll try to
> look into it a bit more.
> 
> [1] https://lore.kernel.org/linux-ext4/5bb9041471dab8ce870c191c19cbe4df57473be8.1772381213.git.ritesh.list@gmail.com/

I can confirm that solves the KASAN splat; it also cures the defconfig
hang that was initially mis-attributed to the mutex patch, but turned
out to be memory corruption due to that issue KASAN found.

FWIW:

Tested-by: Peter Zijlstra (Intel) <peterz@infradead.org> 
