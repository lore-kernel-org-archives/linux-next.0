Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329830CD8F
	for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925923; cv=none; b=Si0O1s35v7mO5RMuFgHUWLulYNVo0nR2RgsRRHkNYdW0/0DA0VgYPLyrrE7Av91qRxk9EfWutce2E+iSm/GALe7pjnBgtkZWBntldU4ufHBU2C2Yc1CAyKcStM+cHoYRVNmimGqRMedkCcDvdUcr3j2ZRta9FFXwHVW7jl2WjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925923; c=relaxed/simple;
	bh=ay+mAB4OAWIAt0PTRKLfWJbvVVq4Ty2SCPKgglkEORw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6No4ByEt+KWfy5X30LoTwJ1ijTWG9BsPWyFgH/VNy2EjNycFsJjKr4ERE7Gra/r8TkQCKo78byc0xDA/koxuNuloVgIDBtoc5XQVCb4hao57S31rX8Vcdk7KDeAuQCDUdC+IBJB/kGQgJHfCEkiB98C4XlszkaAA1Ox5pjPANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IDQ9VDUS; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9BKoLFiX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IDQ9VDUS; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9BKoLFiX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IDQ9VDUS";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9BKoLFiX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IDQ9VDUS";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9BKoLFiX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35645337C9;
	Tue, 20 Jan 2026 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=IDQ9VDUSJQMx/c8IO3huYsiqjvV3BuAQhsNwu72YuhKpqeBM1wkvAPY1w0/iZQYMv5wu1/
	gQpyZaup+sVXPwfQ/tdlrojBYGUNJhau8TIwfizlJHoSOmdfcih2AkYt1qdQZsCRkQDAZW
	l4eJoaj6Ae/2o8kqYqBHhQnu3GNAp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=9BKoLFiXJTEdPlWa6SCTRstvLRBqZDSmag8zKhq+Jtc7n2hVIpqrNJM3ySLzGKhdLsj7QX
	5TnJNv/22yf79CCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=IDQ9VDUSJQMx/c8IO3huYsiqjvV3BuAQhsNwu72YuhKpqeBM1wkvAPY1w0/iZQYMv5wu1/
	gQpyZaup+sVXPwfQ/tdlrojBYGUNJhau8TIwfizlJHoSOmdfcih2AkYt1qdQZsCRkQDAZW
	l4eJoaj6Ae/2o8kqYqBHhQnu3GNAp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=9BKoLFiXJTEdPlWa6SCTRstvLRBqZDSmag8zKhq+Jtc7n2hVIpqrNJM3ySLzGKhdLsj7QX
	5TnJNv/22yf79CCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD793EA63;
	Tue, 20 Jan 2026 16:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AsD2AuCqb2mZTgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 20 Jan 2026 16:18:40 +0000
Date: Tue, 20 Jan 2026 17:18:38 +0100
From: David Sterba <dsterba@suse.cz>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Burkov <boris@bur.io>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <20260120161838.GD26902@suse.cz>
Reply-To: dsterba@suse.cz
References: <aW9wHq0fs8KpLCyj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9wHq0fs8KpLCyj@sirena.org.uk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, Jan 20, 2026 at 12:07:58PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the btrfs-fixes tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> /tmp/next/build/fs/btrfs/free-space-tree.c: In function 'btrfs_delete_orphan_free_space_entries':
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:9: error: implicit declaration of function 'BTRFS_PATH_AUTO_RELEASE'; did you mean 'BTRFS_PATH_AUTO_FREE'? [-Wimplicit-function-declaration]
>  1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~
>       |         BTRFS_PATH_AUTO_FREE
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: error: 'path' undeclared (first use in this function)
>  1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>       |                                 ^~~~
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: note: each undeclared identifier is reported only once for each function it appears in
> /tmp/next/build/fs/btrfs/free-space-tree.c:1817:1: error: control reaches end of non-void function [-Werror=return-type]
>  1817 | }
>       | ^
> cc1: some warnings being treated as errors
> 
> Caused by commit
> 
>    7fcf8455f610b (btrfs: reject new transactions if the fs is fully read-only)
> 
> I have used the version from 20260119 instead.

Sorry, I'll drop the patch from next-fixes.
