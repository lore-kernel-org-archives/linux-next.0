Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B03B9618
	for <linux-next@vger.kernel.org>; Fri, 27 Mar 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618888; cv=none; b=AgVzb62vaAi2BhCdibc9qPVDb395YQ+/CtOw3Wb8fyE2UVuesE1rxz/yQ86yuIbq5e5095GBmU+gf5n26Fx+z1bxq6r2g/Yk6pSQ0/KKJ1baqOt/G1YbabmsG8bn0HAtNkfXbfHGx/qwqw4pBoQP8wktzskn9ehf8i4bj8PZs+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618888; c=relaxed/simple;
	bh=ZUqhaB7Z3neO+oKks+SaEVr2SiPyD98hVlC0/Etv+f4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ApWJMpief4ydni0XjALfuKBfXzIkuRp6MCQPthbv73oIALPCuvmWQV3GgSN/yOeFd2vRpgXgd6gjQhWalqj/Y741G6eaiZ+OBb/FHeUpqurdBgM5HC0Vv+18WSgkBUsArC5vj16FYvvtz2OPjByEBF2e1WW8Mk7Nfm/R/x8j6jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ovF51P+n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0NOvIyiJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ovF51P+n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0NOvIyiJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ovF51P+n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0NOvIyiJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ovF51P+n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0NOvIyiJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8A2D4D339;
	Fri, 27 Mar 2026 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774618884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVqdsOX9UIYygn/TESMFrPVAPM3wgeJCiRrpEOpHHcM=;
	b=ovF51P+nANbL4OL4UUCZUbz5swsCy39KGnDG288gDxyYcyI1kPL69HYwbDNpCVE+mVZQw0
	LfTNInC3SrugwU1F7BaNquxBYkVWFEimPRzD181ADK1mvq7Voy+uuwjb/1c/4B2v2Etm7o
	J3KSI2VLmcq0i+34fec33vdUTbOY9LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774618884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVqdsOX9UIYygn/TESMFrPVAPM3wgeJCiRrpEOpHHcM=;
	b=0NOvIyiJCsbD0/FlaN07pPUmzHf8qqr7Q3vPPaZTX2s9Sr+/sfaBvvDCmfvLOBS8kmOdMx
	JJ1GpMNSulzMZbAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ovF51P+n;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0NOvIyiJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774618884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVqdsOX9UIYygn/TESMFrPVAPM3wgeJCiRrpEOpHHcM=;
	b=ovF51P+nANbL4OL4UUCZUbz5swsCy39KGnDG288gDxyYcyI1kPL69HYwbDNpCVE+mVZQw0
	LfTNInC3SrugwU1F7BaNquxBYkVWFEimPRzD181ADK1mvq7Voy+uuwjb/1c/4B2v2Etm7o
	J3KSI2VLmcq0i+34fec33vdUTbOY9LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774618884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVqdsOX9UIYygn/TESMFrPVAPM3wgeJCiRrpEOpHHcM=;
	b=0NOvIyiJCsbD0/FlaN07pPUmzHf8qqr7Q3vPPaZTX2s9Sr+/sfaBvvDCmfvLOBS8kmOdMx
	JJ1GpMNSulzMZbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A31204A0A2;
	Fri, 27 Mar 2026 13:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N7NoJgSJxmkBIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 13:41:24 +0000
Date: Fri, 27 Mar 2026 14:41:24 +0100
Message-ID: <87bjg9qtiz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the sound tree
In-Reply-To: <acZ51-4zNhu6lyag@sirena.co.uk>
References: <acZ51-4zNhu6lyag@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C8A2D4D339

On Fri, 27 Mar 2026 13:36:39 +0100,
Mark Brown wrote:
> 
> Commit
> 
>   3ebaf5b77ac6ae ("selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER is not enabled")
> 
> is missing a Signed-off-by from its committer

My bad, corrected now.


thanks,

Takashi
