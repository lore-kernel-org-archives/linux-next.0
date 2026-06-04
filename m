Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB253368BF
	for <linux-next@vger.kernel.org>; Thu,  4 Jun 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586403; cv=none; b=RBzq2ULH0umKzL/+KOVBM63+MyGRke5jWNT93mSqxPdtwa+jnRpucdLt4XqSpGO6hQAKS9ZFGoolv1ze9UQRHdeq1hKHp5F3UQKtQS7lR/65F9n1ja3580vXA5991pzJ77Rmaz3NH83OXEx3ZKWKy7Cs/GmpyIRM6lG0/2teOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586403; c=relaxed/simple;
	bh=YN5GdDh1IrEFd5bzN+b40WU8g7y8zKT5g/OPFO79+yM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyJdBbKuJaGSF1aSARNs+WsIf0GTO4HTYSJkm7MPZUUDmjr87wmcbwxqrQqEYBgpsE66lXZYlT8vG5JIcy8eb4t3SLiwxp/kUBMDpK30JrBSsAtODLQNnInsvz5YQvkL1e8aPq7UsvB7U+d4u/DP8BDYDNXBPfGAZ8gF4gmY83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mufE1v4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JKcM8M2L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mufE1v4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JKcM8M2L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mufE1v4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKcM8M2L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mufE1v4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKcM8M2L"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 99F9B683FC;
	Thu,  4 Jun 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZUMI5hz8QEKD4WdFNOTKCacXOfTe6an0+MGsLAA6CA=;
	b=mufE1v4sqHIn2lusHCPqglVTifw4sUzaGdSl1vkpNjYpcF0kuG9BKUAIKNqCXKmonbeEv3
	FU02n4JIVAh+i7Qtko9oqnpine5qtpRNW2ke79I3ZRIvvDSyXka2SrTiZ2Druj0DGEV5uM
	H9MSCdRk5PuETbUAvCzqUtrZ96gZE6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZUMI5hz8QEKD4WdFNOTKCacXOfTe6an0+MGsLAA6CA=;
	b=JKcM8M2L5h+iUfErkS83uFosqizWX6YiyMYurxu7yjYrCGRvKleiW9FiuD0j24C/4IR6zP
	Tt+gHe+8d/9/iSBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mufE1v4s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JKcM8M2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780586400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZUMI5hz8QEKD4WdFNOTKCacXOfTe6an0+MGsLAA6CA=;
	b=mufE1v4sqHIn2lusHCPqglVTifw4sUzaGdSl1vkpNjYpcF0kuG9BKUAIKNqCXKmonbeEv3
	FU02n4JIVAh+i7Qtko9oqnpine5qtpRNW2ke79I3ZRIvvDSyXka2SrTiZ2Druj0DGEV5uM
	H9MSCdRk5PuETbUAvCzqUtrZ96gZE6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780586400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZUMI5hz8QEKD4WdFNOTKCacXOfTe6an0+MGsLAA6CA=;
	b=JKcM8M2L5h+iUfErkS83uFosqizWX6YiyMYurxu7yjYrCGRvKleiW9FiuD0j24C/4IR6zP
	Tt+gHe+8d/9/iSBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68B67779A8;
	Thu,  4 Jun 2026 15:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MQdFGKCXIWoVIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jun 2026 15:20:00 +0000
Date: Thu, 04 Jun 2026 17:19:59 +0200
Message-ID: <87zf1auycg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
In-Reply-To: <aiGUoChmVKE-xwvC@sirena.org.uk>
References: <aiGUoChmVKE-xwvC@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 99F9B683FC
X-Spam-Score: -3.51

On Thu, 04 Jun 2026 17:07:12 +0200,
Mark Brown wrote:
> 
> Hi all,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/sound/usb/qcom/qc_audio_offload.c:1045:6: error: unused
> variable 'remainder' [-Werror,-Wunused-variable]
>  1045 |         u32 remainder;
>       |             ^~~~~~~~~
> /tmp/next/build/sound/usb/qcom/qc_audio_offload.c:1046:6: error: unused
> variable 'mult' [-Werror,-Wunused-variable]
>  1046 |         u32 mult;
>       |             ^~~~
> 
> Caused by commit
> 
>    f1f16e1809c8f (ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation)
> 
> I have used the tree from next-20260603 instead.

I submitted a fix patch now.


thanks,

Takashi
