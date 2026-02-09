Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CF1EEA49
	for <linux-next@vger.kernel.org>; Mon,  9 Feb 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640416; cv=none; b=nYF4fA6Di+3sIYj67R9f1vfARp7ZK689VIkONIDyjQPSMetvtZoM89H5U5Q14yH+it8X4+xzU6jJotI7L2B+3hZql9+yW4x2/Ek6FE8WWSg52OgnM2URFqmzrMppYZ3wTMOZgQ202pLHZoYoetoeKFBECMR9HraGAM7YKQTcBHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640416; c=relaxed/simple;
	bh=RdRDMoYRxbUiizOd5olXNTjMboyQLTsBHV7pnGJNJ/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tItDrXbc0K5L772hMzPC+zrASfvE+i0sGwAurh4ozw9pugA8fZXKybYFoQLcX27Wfnf3tQew+MuWmUpEhtppkInlJAC1pundWD+55I4nnxHOdua/2GF67ZX4LAixkvqaDqj/eFGLsJ6kvHJUJGOtM1/A2yeoYJpq7YdbJBXR7Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Otq/Kvi9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vV/0WQQ4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Otq/Kvi9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vV/0WQQ4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Otq/Kvi9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vV/0WQQ4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Otq/Kvi9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vV/0WQQ4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE63F3E6EC;
	Mon,  9 Feb 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770640414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JudUh6Xo0ub6W+Cb60woIyMcFm8hF8FWgvasNRpmCOU=;
	b=Otq/Kvi9o7wKI6kvX1txRnm+skHlA/I6TnausD2eNQTbz63AEePTEKFgGIsdFD79L0B+kU
	N2xuki2unTUf+x5NiMa16RjVPQW2UVDdJjgys2xwpHDVjMdQHF3nJ9wPZRws16v7pZTXOU
	jJFwCQhhyUMeKJxvmtex7EBuRj+siT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770640414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JudUh6Xo0ub6W+Cb60woIyMcFm8hF8FWgvasNRpmCOU=;
	b=vV/0WQQ4qna/jTAxpEaSkHRtWadQ5ENu+wIcgAZfoPa2/KYUFHamT1IrmJrx7OhtXWYKvz
	LmtoOgm0F1escuCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770640414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JudUh6Xo0ub6W+Cb60woIyMcFm8hF8FWgvasNRpmCOU=;
	b=Otq/Kvi9o7wKI6kvX1txRnm+skHlA/I6TnausD2eNQTbz63AEePTEKFgGIsdFD79L0B+kU
	N2xuki2unTUf+x5NiMa16RjVPQW2UVDdJjgys2xwpHDVjMdQHF3nJ9wPZRws16v7pZTXOU
	jJFwCQhhyUMeKJxvmtex7EBuRj+siT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770640414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JudUh6Xo0ub6W+Cb60woIyMcFm8hF8FWgvasNRpmCOU=;
	b=vV/0WQQ4qna/jTAxpEaSkHRtWadQ5ENu+wIcgAZfoPa2/KYUFHamT1IrmJrx7OhtXWYKvz
	LmtoOgm0F1escuCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9A5F3EA63;
	Mon,  9 Feb 2026 12:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gXkSNx3UiWkRaQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 09 Feb 2026 12:33:33 +0000
Message-ID: <8b249d75a33bfde87f725e89c2b82c297a2b1b45.camel@suse.de>
Subject: Re: linux-next: trees being removed
From: Jean Delvare <jdelvare@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas
 Larsson <andreas@gaisler.com>, Christoph Lameter <cl@linux-foundation.org>,
 Chuck Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>,
 Dipen Patel <dipenp@nvidia.com>, Gabriel Krisman Bertazi
 <krisman@collabora.com>, Ingo Molnar <mingo@kernel.org>, Lee Jones
 <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,  Matthew Wilcox
 <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>,  Steven Rostedt <rostedt@goodmis.org>, Tejun Heo
 <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Date: Mon, 09 Feb 2026 13:33:32 +0100
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Autocrypt: addr=jdelvare@suse.de; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hi Stephen,

On Mon, 2025-12-15 at 18:41 +1100, Stephen Rothwell wrote:
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.=C2=A0 If you want a tree kept,
> please just reply and let me know (and update its branch).=C2=A0 If you w=
ant
> a tree restored after it has been removed, just let me know (and update
> its branch).
>=20
> Tree			Last commit date
> =C2=A0 URL
> =C2=A0 comits (if any)
> ----			----------------
> (...)
> dmi			2024-05-14 11:23:02 +0200
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.g=
it#dmi-for-next
>=20

I have DMI updates to send to Linus again, so I have updated the DMI
tree above, and I would appreciate if you could include it in linux-
next again. Thanks for your work.

--=20
Jean Delvare
SUSE L3 Support
