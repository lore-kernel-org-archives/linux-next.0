Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15837417E
	for <linux-next@vger.kernel.org>; Mon,  9 Feb 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639281; cv=none; b=jmXPybBkJbit7mWIEOrH+qQPGvGUugc3KvPQjHSCcKZoUxZJew7RPvH9pm2s1tr2otJE+r+lLGYSNoX/Au3no66APiSegbWYC5xs2VeF7J8YmYy+H6v916XuAHmFWK7IBGsDM4qCO0ORIbInZ8QVSARosuqwSyJHDTuNrYLLwmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639281; c=relaxed/simple;
	bh=H757NCw41ak8RgcNvjxDzN7Z9qC/KUEaLayMYLhEpBM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TfmpbWrXY0+8BuQbPy47QMIP1lZo7W4oo6vD98MkaEzsTedV/6UE0xBsBiTDR1affAwEFTE+Wb8iTT4JW/pIIeoXbNVNa0Em3L7sCSNqJ+7kyRW5cUg19MMcd8du1d0tnf4eZ+bxH44DnB5WXrcL4NLP/cbj0RY21L9ZEsFLqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nn81HcLD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cz2lsIvy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nn81HcLD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cz2lsIvy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nn81HcLD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cz2lsIvy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nn81HcLD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cz2lsIvy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C82E5BD1B;
	Mon,  9 Feb 2026 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770639279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNz07Pi2uRKDAv6B0wio5r/nqDuacCfq1MZ1bQqBnWc=;
	b=Nn81HcLDVqDiYlynR3kppCBDfNet28U+tsm/ydm4mktqLzEpaajt/r+suBpZfq+nSTGQ+L
	qAw3ep4NdYH+puhgzxkZKlRoVrg5vMCjmviZb0yj3AuKiFrgW7CVDQT+GYuYXin5ZU4YHo
	MKE9Q37+tcGEU6HYb0FVIDkGIQaVc2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770639279;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNz07Pi2uRKDAv6B0wio5r/nqDuacCfq1MZ1bQqBnWc=;
	b=Cz2lsIvyXM6PM3SS95oE84kCv+9Wa3fK/5Shcw8UqYo/YeITCjPSWzhA2CzA9+srNlzo1o
	iOG+LoeDdRXP0gDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770639279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNz07Pi2uRKDAv6B0wio5r/nqDuacCfq1MZ1bQqBnWc=;
	b=Nn81HcLDVqDiYlynR3kppCBDfNet28U+tsm/ydm4mktqLzEpaajt/r+suBpZfq+nSTGQ+L
	qAw3ep4NdYH+puhgzxkZKlRoVrg5vMCjmviZb0yj3AuKiFrgW7CVDQT+GYuYXin5ZU4YHo
	MKE9Q37+tcGEU6HYb0FVIDkGIQaVc2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770639279;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QNz07Pi2uRKDAv6B0wio5r/nqDuacCfq1MZ1bQqBnWc=;
	b=Cz2lsIvyXM6PM3SS95oE84kCv+9Wa3fK/5Shcw8UqYo/YeITCjPSWzhA2CzA9+srNlzo1o
	iOG+LoeDdRXP0gDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA7173EA64;
	Mon,  9 Feb 2026 12:14:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EFJgN67PiWlXOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 12:14:38 +0000
Date: Mon, 09 Feb 2026 13:14:38 +0100
Message-ID: <87qzqu15ch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the sound-current tree
In-Reply-To: <aYnOnnINwmcc6qHg@sirena.co.uk>
References: <aYnOnnINwmcc6qHg@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 09 Feb 2026 13:10:06 +0100,
Mark Brown wrote:
> 
> In commit
> 
>   43cc944c8e28d2 ("ALSA: usx2y: Relax __free() variable declarations")
> 
> Fixes tag
> 
>   Fixes: 67afec157fe6 ("ALSA: usb-audio: us144mkii: Add MIDI support and mixer controlsj")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks for the report.  Unfortunately it's a way too old commit and
we've gathered too much after that, so I'd skip rebasing just because
of a typo there at this time.


Takashi
