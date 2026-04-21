Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7201E1024;
	Tue, 21 Apr 2026 14:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781025; cv=none; b=hAkTofK+pfiiJdQ+PMa2+61OcC6c+XvOk9roVkIFriv+Q/JqLo+DU3FLjyCLYLPKhewuXnRXpVNKt/IQPszasmJKW0TPP+PI7bQs1bJatdgRAMCTo4jD9xicaG6HaGqRbPAtyT5sT7KpIitAFvfdr3hhvljq9IdS7fDYwMWaurE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781025; c=relaxed/simple;
	bh=bIhj5XzNqJhWOhURqbhwKr/d0j2cQbJ4VWY5FjaGDCE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cTlAIH4uDQjd42ou2JNs8t70+TSMoGB0eJS1msQaaQWPOj0O5BjFe7y2IKBoV5zgvuEsEkHiKDs9N1xyfNoNWwr0Biw5sGesqZ2lVes8/8HuQ01fklBz3WOMl7bc18p7XoItWtUtvRyeyoIqEIjSJd2RBsO9LXx++wN7DoAW0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xnMVl4+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xnMVl4+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30AEC2BCB0;
	Tue, 21 Apr 2026 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1776781025;
	bh=bIhj5XzNqJhWOhURqbhwKr/d0j2cQbJ4VWY5FjaGDCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xnMVl4+B4PsECLNK6sLYAnmbLLsx1zJtR9nufxKyWOMAReS/3Dq8fPlQvl3kPFyZO
	 06t+2KN76WwWihGqhc8nz2lxLuL+tln/Ou8S68RV2Ye+puMshHhz+v8UJzhnb3z6Oq
	 zwpWkFMEhdBOdz7NGN9OS1n1YwYG3PfS79ut+V1I=
Date: Tue, 21 Apr 2026 07:17:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-Id: <20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
In-Reply-To: <a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
	<c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
	<955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
	<2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
	<a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 15:42:29 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 4/21/26 15:34, Mark Brown wrote:
> > On Tue, Apr 21, 2026 at 02:21:48PM +0100, Mark Brown wrote:
> >> On Tue, Apr 21, 2026 at 03:06:32PM +0200, David Hildenbrand (Arm) wrote:
> > 
> >>
> >> The commit is also present in the mm-unstable tree, I have also used
> >> the version of that from 20260420.
> > 
> > And similarly for the mm-nonmm-unstable tree.
> 
> I think Andrew uses the hotfixes tree as the base for the -unstable
> trees. So anything that ends up in there gets fast-tracked into -next.
> Not good :(

Always been this way.  The expectation is that a hotfix is small,
time-sensitive and fixes something which is broken in linux-next.  It's
exceedingly rare for a hotfix to break the build!

I'll drop this patch.
