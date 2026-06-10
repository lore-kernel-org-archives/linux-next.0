Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9FA349B0D;
	Wed, 10 Jun 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112510; cv=none; b=lAHOlUOcAjcjrLzIFMESYmu2Y2QjUVMLV45tXL83AkX3hK41uUeiV/Udh4WHFoPdoknMhL1SOIA+mTdcY3RxZbUSZlU5VbxFhFdmeKpibcM4BfySB+naeSFChzknFPRLWfB2ias3Gcog4dAdASLNEAb8FBpkk1uUxvWCTqPSRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112510; c=relaxed/simple;
	bh=UbWH7xtEPka23YPaTjlNHgBVDQwrXRiTG8u7Y709vU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saFp1vIcQZjz+M9QPycsBFgcCtr2m9GSr9oNMFld8L2EAnpadGsrVfMp9gtQ+RKJzR1fE1iF29/ynoe3s3MJtsp6JxpFJS2wGsALNSHrwlAn3HU3N47r32qRoIZfTRDHubSZC7b5eIUzE6bQqeNeAs/GcjAQBIZ+q42Q6/cCAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFeAxy/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFeAxy/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925361F00893;
	Wed, 10 Jun 2026 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781112509;
	bh=Wn7QKzDlovPappiGR/eZxVd8+we6CMmMI8bC/x2N+A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFeAxy/du8R4OtAwKhk3TYcXSrbwbhFiU3JqIuSFuBh4ld/9Is8iIMPtGPCyJJotj
	 pD78DGqdB5+0c49HMBBHJ7J1qVwEjmcPTz3NSnEsrDyX4wi88ClKjgXBVrbkB84Qiz
	 Tk9CavS6xwjWNfA+OZ+s3Izd85Ypr2SSi8nYKAVoEOUgtNr4lI4SkPujYNVWT8U0n0
	 xh2mHYMYvwR5J/X9JHXk+XKeK5Vx/Zsvs1vHodRQCXPrInsq9Wa6/mTNde1qBMwBl1
	 Zuujrp0Dh+qk6pRDM7NL2/1rHtDIZSOhT2nX46EdObxfeDOh2ws8xs+498tr65BsYk
	 VWskdLPB+dGUA==
Date: Wed, 10 Jun 2026 10:28:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Tejun Heo <tj@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v4 0/2] workqueue: Add warnings and check WQ flags usage
Message-ID: <20260610172823.GA804799@ax162>
References: <20260529130640.220328-1-marco.crivellari@suse.com>
 <bdce3ef27e358b704541d403d28206fd@kernel.org>
 <a808c387-1087-4826-80de-16252ae315b2@I-love.SAKURA.ne.jp>
 <a85feb7a94ee487fb5b236d86b674c58@kernel.org>
 <5b2dea50-2850-4876-b6e8-ba94b9a85034@I-love.SAKURA.ne.jp>
 <ah2bd_V2QHQftm2o@slm.duckdns.org>
 <4d47c6aa-8ba5-4e17-87e5-bf1e5ecfbddf@I-love.SAKURA.ne.jp>
 <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbca08c9-c6bc-4109-b734-14aedc10c93b@I-love.SAKURA.ne.jp>

On Wed, Jun 10, 2026 at 09:48:05PM +0900, Tetsuo Handa wrote:
> After 10 days of untestable period, the third breakage report came from btrfs
> caused by commit 69635d7f4b34 ("fs: WQ_PERCPU added to alloc_workqueue users").
> That commit added WQ_PERCPU to fs/btrfs/disk-io.c despite the "ordered_flags" is
> passed to alloc_ordered_workqueue() which implicitly applies WQ_UNBOUND.
> 
> That commit says
> 
>   Both flags coexist for one release cycle to allow callers to transition
>   their calls.
> 
>   Once migration is complete, WQ_UNBOUND can be removed and unbound will
>   become the implicit default.
> 
> and you definitely started emitting WARNING: messages before allowing callers
> to transition their calls. I consider that commit 21c05ca88a54 ("workqueue: Add
> warnings and ensure one among WQ_PERCPU or WQ_UNBOUND is present") should be
> excluded from the linux-next and the upcoming merge window. The next one or two
> cycles for transition should be printk() without WARNING: string.

FWIW, I sent a patch for the btrfs issue:

  https://lore.kernel.org/20260601-btrfs-fix-wq-warning-qgroup-rescan-v1-1-aff9a1128f27@kernel.org/

With that applied to next-20260610, I don't see any other instances of
this workqueue warning on any of my test machines. I do agree that
enabling warnings prematurely is disruptive for testing and should be
avoided but it seems like this one is close? That change should be
applicable to the workqueue tree, it just needs to be taken at this
point.

-- 
Cheers,
Nathan
