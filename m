Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F84319858;
	Tue, 21 Apr 2026 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782904; cv=none; b=lb9XXkW7U+BobjdryDehhXSPnYTZq5zkaMK91tOaBV1ZqlatcmPj0STA6zCr1MsDMwd/IruQt1uDxBCxon4MnUM8BbpMznfhDBN/JE1CJ36jyXIgb2M4ia8SwZcWCrvmFt5bmR4bURfnlXMUrND90zO9BWXm3QuQAz4B+CwqlLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782904; c=relaxed/simple;
	bh=Jjs+mTfY4jOYxLoGn8MfAAbHhOe5oBKz6vMQv79Fdb4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=i9AfBDtUqaNAOfOQRY+78eXLYbXRxyNmgQvlNahwRpaCLeCZzUjl8i6XX2sbEqkb4MYozXW65Zm1QMcOsn7ahEoo2IATGZgnoj0mc/1UYuypkdhExTrECr7WPVvoPU6+tw3a8z8C0mR+Zi5cv7BM72jZ/EjnFvI/VtZOQu3KzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vmZh4gG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vmZh4gG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011F6C2BCB0;
	Tue, 21 Apr 2026 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1776782903;
	bh=Jjs+mTfY4jOYxLoGn8MfAAbHhOe5oBKz6vMQv79Fdb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vmZh4gG8K5kxUwrzHpUPL/Z7MVxmyJufoYrcBDdgI/2Bk3tYKHhPUD5SPdjzYnbo8
	 xDcdBNGHziYOy5HqOLPKAI4DDIai7Mc75CnsAOUDXBTvvHDwAF2ZSKSQ9XP1EsaDWW
	 xmEmwyES5WJA7bSaJSvDPlZUfRZ6KcOASnot+0gM=
Date: Tue, 21 Apr 2026 07:48:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-Id: <20260421074819.89c55503b44afcba46df5d31@linux-foundation.org>
In-Reply-To: <32f90970-51bd-41c6-b80f-71a8c91ec97d@kernel.org>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
	<c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
	<955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
	<2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
	<a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
	<20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
	<26b33b43-da9a-4587-b331-801c19b07676@kernel.org>
	<20260421072819.b1ab891aef59c45226f25247@linux-foundation.org>
	<32f90970-51bd-41c6-b80f-71a8c91ec97d@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 16:35:48 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> >>> I'll drop this patch.
> >>
> >> I'll resend v2 later. Maybe we can let that rest in mm-new for 2 days to
> >> get some build coverage.
> > 
> > OK.
> > 
> > I *could* start giving hotfixes a run in mm-new first, although
> > 
> > - it'll add a few days additional latency (which people sometimes get
> >   upset about)
> 
> Yes, for some more urgent stuff we don't want that. 1 day is
> probably okay, until we know the bots went crazy on it.

OK.

> > - coverage is mm-new is poor - for example, this error probably
> >   wouldn't have been found until Mark grabbed the patch via mm-hotfixes.
> 
> I get daily build reports against mm-new, for example, mail from this night

Aren't you lucky ;).  Is it possible to add a cc:mm-commits to that script?

> I suppose that was before you pushed the change?

I think so.  I added it to mm-hotfixes

	Date: Tue, 21 Apr 2026 00:12:18 -0700

and pushed shortly after that.

