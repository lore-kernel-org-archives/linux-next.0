Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BCE2F1FD2;
	Thu, 22 Jan 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042549; cv=pass; b=tCADpdrAodQQfAep9yRyOoddfKRTq2+JQfW+i3mtk+v1X9WySRyPbiVtJHYxEhCqFvgzai6FLeS6jOrbzbKE2ueWIvMsv+7B/J/yefcXt8znN5pWDcXpIxxXfrQ4UEL4VLSeYG42fIj+A6JwBLlHkzTPCMkuwQgrmBYsOVR+hlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042549; c=relaxed/simple;
	bh=MTPqLY5Abue7BSFMi5PdX4anUAuK1TWndwE+rZnTQE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvUALc7Mc+MKQT4CBxFxCEOqAqdsLB4nnFSAMjAVaD+BWGWgE7PzGopSi3qGXXEr4NQoPsOjJCDzuUh5LSLSOM1uOoHCHhgQkn6vEbV5UHmJ9sfeDRclxkU0fq/i1hGArI+gRvsF2P+dx0sXuVmiMmRZlzd5C7GPdl6qNLXzckw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=ak8n8GUP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="ak8n8GUP"
ARC-Seal: i=1; a=rsa-sha256; t=1769042540; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eeg6+v31BImrFAh4aef79TgzokA36gT8MkgP8E/Ru1HLI+ta1xwxc5aF26bO5/4II9A1CvJ1ZQMUUO1rK47ZPFBIi3SJb+UtVGsEvwXvfHQeNBB9c1RdgLvdo6S/uFdcpj0+6/S29UkB/GRmHM+cjXnaiGETCjpBsSuPKgsjhBE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769042540; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qzVAzKIsytOEd2LHMYSarQ4VPdN5SGUOFphTAsR4S/4=; 
	b=PaSbIWqOehFrtA+zV2cgdGVdH8UHlAjqMwEar6o9I07qWztl8mhRToeyUczecde3+1rRiMx7CU+UWxL6q7A6DDdBbikpSnnCz4SYPFJOe/uemivrla7GiXP9QqCNLK2PGpLGd3bmgj167aD7+AbD4PYeJLSIMTltnUlZzFwFE+c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769042540;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=qzVAzKIsytOEd2LHMYSarQ4VPdN5SGUOFphTAsR4S/4=;
	b=ak8n8GUPcr1qo/E+CJg/LwmSQria8ht4jZDxEdcQyQmiJQiUp+S57iE/6vb4URRp
	7h88x7vqjkPbgBY8vtny0hAHFIthD9KgkFlQvL1QMOhiX8oBWOWBA1qK0pqNpqeE87k
	nnd8FyliNJlYqMqEd0jGImVXxzRkm03aK3xDh+VY=
Received: by mx.zohomail.com with SMTPS id 1769042539544468.77820565905995;
	Wed, 21 Jan 2026 16:42:19 -0800 (PST)
Date: Wed, 21 Jan 2026 16:42:18 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Rob Herring <robh@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <aXFyakDy3VSRw1NW@um790>
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
 <aXElns7ZpGuZR6ke@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXElns7ZpGuZR6ke@google.com>

On Wed, Jan 21, 2026 at 07:14:38PM +0000, Alice Ryhl wrote:
> On Wed, Jan 21, 2026 at 05:14:15PM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > After the final merge today's linux-next build (arm64 allyesconfig)
> > failed like this, the same issue will be present in mainline:
> > 
> > error: field `device` is never read
> >   --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:37:5
> >    |
> > 36 | pub(crate) struct TyrDriver {
> >    |                   --------- field in this struct
> > 37 |     device: ARef<TyrDevice>,
> >    |     ^^^^^^
> >    |
> >    = note: `-D dead-code` implied by `-D warnings`
> >    = help: to override `-D warnings` add `#[allow(dead_code)]`
> > 
> > error: fields `mali` and `sram` are never read
> >    --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:196:5
> >     |
> > 195 | struct Regulators {
> >     |        ---------- fields in this struct
> > 196 |     mali: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 197 |     sram: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 
> > error: aborting due to 2 previous errors
> > 
> > Caused by commit
> > 
> >    cf4fd52e32360 (rust: drm: Introduce the Tyr driver for Arm Mali GPUs)
> > 
> > I am continuing to mark the driver as BROKEN.
> 
> Hrm I saw you had this last time too. I'm not sure how you're triggering
> it - I haven't run into it myself and I do enable warnings. But I'll try
> to repro and fix it.

Although I hadn't seen this error before I was able to reproduce it
today on linux-next/master so I don't know if it's too late, but here is
a quick fix.

https://lore.kernel.org/rust-for-linux/20260122003746.405370-1-deborah.brouwer@collabora.com/

> 
> Note that for this kind of thing you can add `#![allow(warnings)]` to
> the top of a file to silence warnings.
> 
> Alice
