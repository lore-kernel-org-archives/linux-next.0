Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362D30C16A;
	Tue, 25 Aug 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787687873; cv=none; b=tqJSZ09Z8BL5h+AYzlNEw66swlB16eiWPGBhHavH5mF1XCBt4tGBRR8FgkmaNKV2ntPD4Z8WBhU3dINPjo2ZukBo1ZZKv68Gc1MV88hU1ThNkMqWkkKboDEYnj+l8EQWTdYOM5b7ZVm7nsCJRVHqCsVa5s1vevIgh2jFSTdMXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787687873; c=relaxed/simple;
	bh=BBDZ/X4zTZXqEjNRs79qtKWcMFZwO8ClPQzsG+JmqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8wqkrk2zNsGn7EgPVHqEvHoIwujvzBQWuEQiAkMlXm8bXW7LbPLIXcBggTATpxQ2s+majP3PJ9qoNefqO6AMkI8wN0HgX2ZrhVflfcJ1q2cPkuTCSQOJpbEfA/hbaz4iutB2EIjABAFlVm3gcx5ZM2yWqsoY1gbIB2tigjiRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L6dboAeI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L6dboAeI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t2OCrl5qlYlY8Ug18KCwNXeOxCWPYYl1AZP3jtdkFbs=; b=L6dboAeIhXziYSX24Fqw9m3THq
	HtlXOKeYNgltfSE2L+EUZlkJTfkxMGQ2fSVw3B2ba7BOae5gpQNistv+zbTHZvQhvatU406htD7xd
	sdpaH1xwdImBG2nrn7pXShMF9/fn0OTE6SuoHC3ySuyi28l1M2Lp2E0mvZdFre5zFjSaH+lG9+SUv
	ynySmTUR02/WZF4frhPDo2GkZdXoTrVzYBWRRl7nggDPf65OwTmVeCRgWeTVIswpAcHtOExx0PKz3
	Py2esHyA4QbcdtdA6JvasXjTs4LAODwauhRGpTdZhoHRDsLQxQn7yi5z9AD1YhqH9KO9Funx2ONvD
	OzQT+7UQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyxHJ-00000009dWQ-0SEC;
	Tue, 25 Aug 2026 19:57:49 +0000
Date: Tue, 25 Aug 2026 20:57:48 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Please include pagemap header cleanup in -next
Message-ID: <ao3zvOo2nkMxaDY5@casper.infradead.org>
References: <aox4v6paR4IbJr8j@casper.infradead.org>
 <29f8f296-e49c-4960-aadb-f27d863ba773@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29f8f296-e49c-4960-aadb-f27d863ba773@sirena.org.uk>

On Tue, Aug 25, 2026 at 02:44:54PM +0100, Mark Brown wrote:
> On Mon, Aug 24, 2026 at 06:00:47PM +0100, Matthew Wilcox wrote:
> > Hi Mark,
> > 
> > As discussed on IRC, please include
> > 
> > git://git.infradead.org/users/willy/pagecache.git headers
> > 
> > The net effect is to reduce the number of files depending on pagemap.h
> > from ~9100 to ~1400 on an x86 allmodconfig build.  The Intel test robot
> > has been steadily building random configs on random architectures and
> > finding new missing includes, so there may be some build breakages that
> > it hasn't tested.
> > 
> > My plan is to send this to Linus on Thursday or Friday.  I don't see the
> > point in letting it soak longer; any problems it causes are build
> > problems.
> 
> As I noted in the regular build error mail it hit a build fail on an arm
> multi_v7_defconfig so I didn't merge this today.  It's pretty surprising
> that the build bot didn't hit that one TBH since the file that broke
> hasn't changed since v7.2 AFAICT, I would guess that there's some other
> implicit include cleanup work that's interacting badly with this effort
> but I haven't investigated at all.
> 
> BTW I added the -next list, please CC requests for -next there for
> visibility.

Thanks; I looked for it in the Documentation and didn't find it.

I fixed up the one you mentioned   Then I installed an arm32
crosscompiler and built arm allmodconfig.  And then Intel's test robot
found another.  So in total, three more fixes:

drivers/dma/ste_dma40.c
drivers/ufs/host/ufs-qcom.c
drivers/gpu/drm/amd/amdkfd/kfd_migrate.c

Pushed out a new version (e02cb91d4644)
