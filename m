Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE42218592
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826067; cv=none; b=hDEChdxkYSCzq3+azS6SrBva4YKTF27vQ4J01DZt92+9RK1ju3tqrRLyTJZae1hqTUMupMgd7UPDa53wXXnTQRrJaotMQNoav4TNEAqEmdcCftIk33PwYgzOPFp98bDNRz2fO3qhhUT/0M3qodPAhkMsFVgUM44djsTGJ+zTL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826067; c=relaxed/simple;
	bh=3DI3QCT5COXZQoHMx5/YTo6xM4D+564rI0wnxkaJIS4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqZmtapTniumg24iONAqod3rZ/B/Y7/dIMdTVYeMBGkDZOGNKaGttmrsD+ldqVVTbt1gqLzd2V/66+k8cQ74r35c3eC0lPRoQxRK0WFjs/c1ceErvfoIl7lusno3glNAyVHvDRT99payU+x85+NpXJnZhbMV+pF8azpYmSgXh8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lpGyNIbb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z75q8NdK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lpGyNIbb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z75q8NdK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lpGyNIbb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z75q8NdK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lpGyNIbb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z75q8NdK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BA2D5BCD3;
	Fri, 10 Apr 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775826064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCA2SoldNs8DCumkKcnjkdizGsZPEh0GBZpNSfQX4es=;
	b=lpGyNIbbDk1fTKX0QWp9MeE5O7lXY/9SrNkRaGQCdsjtMf03a62TopxkZsRh+nEtFnM6wx
	d82AMMiTKZztBl2rI940imrLv7H1ONNQ1SZZWcT464IADsI4sRHHfL31Pg/bei8plhqD44
	Klfao58Fr1KF9PWGYWUom0pJF4XlhEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775826064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCA2SoldNs8DCumkKcnjkdizGsZPEh0GBZpNSfQX4es=;
	b=Z75q8NdKrMxaU0ABLNZkphghL/VSSk//upcqW9gnRbeZ85JOo5t8WmWtH/42DVw723cInL
	xt4m5DBHtJuPD9CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lpGyNIbb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Z75q8NdK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775826064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCA2SoldNs8DCumkKcnjkdizGsZPEh0GBZpNSfQX4es=;
	b=lpGyNIbbDk1fTKX0QWp9MeE5O7lXY/9SrNkRaGQCdsjtMf03a62TopxkZsRh+nEtFnM6wx
	d82AMMiTKZztBl2rI940imrLv7H1ONNQ1SZZWcT464IADsI4sRHHfL31Pg/bei8plhqD44
	Klfao58Fr1KF9PWGYWUom0pJF4XlhEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775826064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCA2SoldNs8DCumkKcnjkdizGsZPEh0GBZpNSfQX4es=;
	b=Z75q8NdKrMxaU0ABLNZkphghL/VSSk//upcqW9gnRbeZ85JOo5t8WmWtH/42DVw723cInL
	xt4m5DBHtJuPD9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 571C74A0B2;
	Fri, 10 Apr 2026 13:01:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fmEHFJD02GmJEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 13:01:04 +0000
Date: Fri, 10 Apr 2026 15:01:03 +0200
Message-ID: <87se93ezqo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the sound tree
In-Reply-To: <adjlINACNHPtlahb@sirena.co.uk>
References: <adjlINACNHPtlahb@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 7BA2D5BCD3
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 10 Apr 2026 13:55:12 +0200,
Mark Brown wrote:
> 
> In commit
> 
>   5a5fea9a0d663d ("ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0")
> 
> Fixes tag
> 
>   Fixes: dee1bcf28a3d ("ALSA: usx2y: Add native ALSA driver for TASCAM US-144MKII")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks, now corrected.


Takashi
