Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34FF3FAE19;
	Tue, 25 Aug 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660730; cv=none; b=ZEinsicylOHtcy0LwzcGDbm8mb2Whdk0je4Hv02MfxoLHP2TpY6CW1/i+sCd5HwjaqOPhp/+tufIWLT53QBDTFVFo41m4+m2dlqWeYiZrezdoWrEpA1szTAW+C4cjEnCDSQABvrNZ4TROFDpR829eqSCHQao+eVO8zJsKaRC7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660730; c=relaxed/simple;
	bh=vP/TsZuK2FhMyvwRjXLMdV1rMSYFkJZN+L47fOFJYNE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPD1+4SPzRtzPSwz5uXa/PAG1+1xiEm//rsso5julZTby2xf4YEwJepz6Fh55YOzSkJH0B1Z6rv+d5fSKi0kBfIUJ5Ho5toVZlNGsTvGfiNPFEnh6i81YaH4BXQXL3mHyg9VrNAhJtbWSZ5nkTKftgTpaf7W1p9Nb6MVPERKtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NbzNpGQR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X2rvMVZZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zgeGWqio; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4IUb6Uxy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbzNpGQR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X2rvMVZZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zgeGWqio";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4IUb6Uxy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87CB286E09;
	Tue, 25 Aug 2026 12:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787660722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nldmatI/F4BfH9K/Gso5mJ/b+JO7nJgeuoCDl5pifgU=;
	b=NbzNpGQRflnAqacq30LZ09jZ00k7azP3G0MVkajzE5VOwatGxuIZTwLLE2lVDaU8imvRxr
	XfFROjqqnNEPU5vllbyQ/pMlQgy+MJdhIlS/BkVIKx4Ahk2Y1PtHj9zOF2oCypTyDdGXt9
	5gB8EqYRo8keRE866W/po3IO67/pIp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787660722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nldmatI/F4BfH9K/Gso5mJ/b+JO7nJgeuoCDl5pifgU=;
	b=X2rvMVZZkuI1bzKTh2aAMTro4QbKy7ax6KBhXi4mggL0LRtCiQBrPTSziCRLsrO5WacQ0X
	fhOTCGM/3dCO5mCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787660718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nldmatI/F4BfH9K/Gso5mJ/b+JO7nJgeuoCDl5pifgU=;
	b=zgeGWqioG/1rvRazoDeoe7XmnnmU66f+4xRWT4oV1gy55ZtRCqB64oRVdTQmyIv1kUqXeg
	Shgswi+GYmEiKRJ/KkvGcPAdJi+sixAMs/9XFzFBVra5AF/7tzOH9FzD7goIOWPKrrlJ/C
	xn7+zrJgsoKamvaE/soyVHagekfgIfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787660718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nldmatI/F4BfH9K/Gso5mJ/b+JO7nJgeuoCDl5pifgU=;
	b=4IUb6UxyU8jHXbpksFUmvZ4n52oizI4/PMp1q950RhhqsFW+GpomR7V6gJHzRvrOAWeibh
	oyD6+2hGFz3/t6CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF8751342D;
	Tue, 25 Aug 2026 12:25:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QTY9KqmJjWpXeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Aug 2026 12:25:13 +0000
Date: Tue, 25 Aug 2026 14:25:13 +0200
Message-ID: <87ecfms7yu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-current tree
In-Reply-To: <ao2HDGjk3grFh7w9@sirena.org.uk>
References: <ao2HDGjk3grFh7w9@sirena.org.uk>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 25 Aug 2026 14:14:04 +0200,
Mark Brown wrote:
> 
> Hi all,
> 
> After merging the sound-current tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> ERROR: modpost: sound/core/snd-rawmidi.ko: local symbol 'snd_rawmidi_kernel_release' was exported 
> 
> Caused by commit
> 
>    ab21bde6b13cd (ALSA: rawmidi: Another workaround for false-positive mutex lockdep warning)
> 
> I have used the tree from next-20260824 instead.

My bad, it was a prematured patch.  I dropped it now and will resubmit
the proper one.


thanks,

Takashi
