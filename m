Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38C3AEF55;
	Wed, 15 Jul 2026 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134399; cv=none; b=pxgww2lSeJhVrkTi6l/kKKo7P5DCuPXEDzjuRPfDV+oHuzWwcgY0ohYcusT6Km/Lz1TklXfoZSejHtzWA7rD+awBlkhS+PIb7lpI5uUQxuEA1bBYiEockGbiB+gaPfeCnZKi0NHPJGSPAN3ToPne9IDXUVA87hVssoeXMs8SkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134399; c=relaxed/simple;
	bh=VMETLwNv9+hj47xAJUpEkRMBPkkHW9FTCNFPZI6cCiw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CYMJri3D1735j1IlFSirq7Cz7Avai8JKoLmSWNwybi5WM2ODvrAoyhT2DhwPm0orJ9vuPVenpoiP3pVfHXY1CXmlzYnRFJ2U07Ev0Gn9PzHsUWWznXbI1lM21sQQKh7NBn/8mZd8A0Lg0diy/fhgGn8/XcpRiNEtqFq0L8oIaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X9szkK4d; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X9szkK4d"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CB1C40E57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784134391; bh=W7b06Px5QXKLqiJ+DQLj8qSMrCOwCoqReCVC8FtvKAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X9szkK4dPgw/VrVsRowgxGcRAw0hv17Lim0FewmyZThf601lEgq5iwHebU8KUFG7s
	 8DBOfrA5vMUjeLYNVGmmvLtOnPJxtfN+oU7yCRRcmsQ50ebs6VgCbF6pC+nxDURCoG
	 J7wodiV5QIt5XNvrNX5jyayd5IsvzhFOBYNfOl9i08ylefV4xgtqV9S0k4+SVXxD1O
	 LD4c+4yLdjU0eHjOdBBJxrkQoBXxaDTkx2LpG7ph7EFEbkGqXZtVP9tGCkvAUjZft2
	 azzm57UByllonitHcRpITHzCekPH6gZdnghHiXRS+9ylEPmljMB+mJgV/2z3nx1nGe
	 HJaJC57TPiqAQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5CB1C40E57;
	Wed, 15 Jul 2026 16:53:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Manuel Ebner
 <manuelebner@mailbox.org>, Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the
 mm-unstable tree
In-Reply-To: <20260715092029.18a9334f73e3b1517f3d47b3@linux-foundation.org>
References: <alep4zhJYFTXqBe9@sirena.org.uk>
 <20260715092029.18a9334f73e3b1517f3d47b3@linux-foundation.org>
Date: Wed, 15 Jul 2026 10:53:10 -0600
Message-ID: <87ik6gb3ex.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 15 Jul 2026 16:40:19 +0100 Mark Brown <broonie@kernel.org> wrote:
>
>> Hi all,
>> 
>> Today's linux-next merge of the jc_docs tree got a conflict in:
>> 
>>   Documentation/mm/hmm.rst
>> 
>> between commits:
>> 
>>   3862d3b51eb1f ("mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support")
>>   94e4afa33bac3 ("mm-hmm-add-hmm_range_fault_unlocked_timeout-for-mmap-lock-drop-support-fix")
>> 
>> from the mm-unstable tree and commit:
>> 
>>   e834ee8e571d5 ("docs/mm: Fix braces")
>> 
>> from the jc_docs tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>
> There was no "see below".
>
> Jon, that little patch is being a problem.  Maybe drop it and I can fix
> it up and carry it in mm.git?

OK, I've dropped it, it's all yours.

jon
