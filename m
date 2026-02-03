Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76F3033E2
	for <linux-next@vger.kernel.org>; Tue,  3 Feb 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104875; cv=none; b=UwgYst4gc0tQN5BCDaGYKOlnLorQM1Ff/pWMIqX7Xs0ZmOQgfaXsDmNeOS3i1H90YQ3jRgd65Ww2KAC2kGflvoV6GmRYhOP5CT+pDZemZGU8FOqqLaQeDSbEh1YBA3dySpdagYlYmSfYTDkp9bRskIAUymcDcEvAs3oNNEN6JW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104875; c=relaxed/simple;
	bh=y3CanROtzDGs4J8qH2HpkKMv7vKMorR2gHZYAoDiiEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuDG8TyMwaxu5rCqsxmfApG3IRKYJORSQDqJsnt2KnLSW1bDjeUdIMNhKPA0fcCYVdTokxaTpYwfKknT67D/xvVu/WcTb7kF9zyf/100TARyoAR3kDF561ackU6I7A9hTQyAfa3n+oN1JKk45SadRhVnH1dxdEZhHXxgITH+trM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=DGwW6Noy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VTqfh3RF; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=DGwW6Noy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VTqfh3RF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="DGwW6Noy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VTqfh3RF";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="DGwW6Noy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VTqfh3RF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B04413E6CB;
	Tue,  3 Feb 2026 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1770104872;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkLco+mcQ/LXocsQcpRSGQsVmu8mb4bSH4gHJJHOeEo=;
	b=DGwW6NoydbVYk0Yxv4X5gw/Nbuv0ubiyEwZWQaRzPKQDEJxxKigXWYe04RIqGCpQE+IAXW
	va0r2uO7dCDHfbtvVw3NijP6B9ECRMBhakQ8tjIvWZa3kUA4bHyDQpQOtr+WDPtDjW1Jrc
	UpN6PuC397o35GRjGX5n+DV17TdBLyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1770104872;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkLco+mcQ/LXocsQcpRSGQsVmu8mb4bSH4gHJJHOeEo=;
	b=VTqfh3RFX04eG9XlZMYgNGamjEzir/4kTbPbebv17jkM5h/FVeZZ5ud5rIaLwzvK6P9Psy
	JCOoXlrfQ7X1swBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=DGwW6Noy;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=VTqfh3RF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1770104872;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkLco+mcQ/LXocsQcpRSGQsVmu8mb4bSH4gHJJHOeEo=;
	b=DGwW6NoydbVYk0Yxv4X5gw/Nbuv0ubiyEwZWQaRzPKQDEJxxKigXWYe04RIqGCpQE+IAXW
	va0r2uO7dCDHfbtvVw3NijP6B9ECRMBhakQ8tjIvWZa3kUA4bHyDQpQOtr+WDPtDjW1Jrc
	UpN6PuC397o35GRjGX5n+DV17TdBLyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1770104872;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkLco+mcQ/LXocsQcpRSGQsVmu8mb4bSH4gHJJHOeEo=;
	b=VTqfh3RFX04eG9XlZMYgNGamjEzir/4kTbPbebv17jkM5h/FVeZZ5ud5rIaLwzvK6P9Psy
	JCOoXlrfQ7X1swBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8DD3B3EA62;
	Tue,  3 Feb 2026 07:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pxB5IiiogWlbZAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 03 Feb 2026 07:47:52 +0000
Date: Tue, 3 Feb 2026 08:47:51 +0100
From: David Sterba <dsterba@suse.cz>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <20260203074751.GM26902@suse.cz>
Reply-To: dsterba@suse.cz
References: <aXtXw3_wMDnrrOxW@sirena.org.uk>
 <541681ab-07f7-49ce-bb74-c3e52b71b659@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <541681ab-07f7-49ce-bb74-c3e52b71b659@sirena.org.uk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.21
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B04413E6CB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, Feb 02, 2026 at 02:57:25PM +0000, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 12:51:15PM +0000, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the btrfs-fixes tree, today's linux-next build
> > (arm64 defconfig) failed like this:
> 
> This issue is still present in today's -next.

I forgot to push the fixed branch, should be fixed in today's snapshot.
Thanks.
