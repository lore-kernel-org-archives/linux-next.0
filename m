Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0EE3BED60
	for <linux-next@vger.kernel.org>; Mon,  9 Mar 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067062; cv=none; b=bdGD4PtAfmCLoswZfOAhFLV0gsmtOHk6z6OGgO2Q9W3RcpHJoCFSCzx194hSDk0bK29DnZdQKc/CAGYg7IP3GaEPOOVdal6xzm19zNMCAREivl1mf3221IwmxbvdYqPKyTlepoQGfMAuEQaDJfY+NJg25yNfywiFQrWr2E8/tB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067062; c=relaxed/simple;
	bh=L5AXMEbLQCYjsmwYGQ1r4Xg21Xm7KJ9Gx1g9wISpCng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxaT7lGm5OZiyV6w05QCoD7ol4lXwpjqgKh5BY9yGvWXlFQfustYTpYEG09oO9Xlx9P8BkQhTCBngETmTbWnK0KgIE8JAKMAt54wnb+CpCZouVCxxaF4OtoIUdZ7/Wxv0ro795Lkn3ejPps2KV29radzLDSz/v6NmivFIpylfx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L62ui3o8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sd4qenyU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L62ui3o8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sd4qenyU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L62ui3o8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sd4qenyU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L62ui3o8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sd4qenyU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C5644D230;
	Mon,  9 Mar 2026 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773067059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sTKRQezu0MEWyYy3Id6AoKrDFlweGZc1n1eyrc6hPXA=;
	b=L62ui3o8xIVygCvCwtAag8aA5c2fuBN6xbIS6D7uWLSDbxsPTAYn8SExVHSoyjOMo1PvpD
	WQrckZKN9afZQ6Wyx0n1oZZZJ6e4UJU5f8hv9RdL7HU9eCPGl4Je1LjMqYCahAMgaQpB8T
	K7Fg/iftmVfsYl3F3RFYTercHr34/gQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773067059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sTKRQezu0MEWyYy3Id6AoKrDFlweGZc1n1eyrc6hPXA=;
	b=sd4qenyUC0x5H987OR8Qlqm7KmOBvd3R1ENacGjPI7UaJ/vDTiZf9wRHB3cdPHh0TIBIbM
	sOl8+OPx/rXZHwAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773067059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sTKRQezu0MEWyYy3Id6AoKrDFlweGZc1n1eyrc6hPXA=;
	b=L62ui3o8xIVygCvCwtAag8aA5c2fuBN6xbIS6D7uWLSDbxsPTAYn8SExVHSoyjOMo1PvpD
	WQrckZKN9afZQ6Wyx0n1oZZZJ6e4UJU5f8hv9RdL7HU9eCPGl4Je1LjMqYCahAMgaQpB8T
	K7Fg/iftmVfsYl3F3RFYTercHr34/gQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773067059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sTKRQezu0MEWyYy3Id6AoKrDFlweGZc1n1eyrc6hPXA=;
	b=sd4qenyUC0x5H987OR8Qlqm7KmOBvd3R1ENacGjPI7UaJ/vDTiZf9wRHB3cdPHh0TIBIbM
	sOl8+OPx/rXZHwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 431523EF4E;
	Mon,  9 Mar 2026 14:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /ZvqDjPbrmnjUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 09 Mar 2026 14:37:39 +0000
Message-ID: <3ff83209-913d-47f3-9939-98f1a2535c04@suse.de>
Date: Mon, 9 Mar 2026 15:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm-misc tree with the amdgpu
 tree
To: Mark Brown <broonie@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aa7alzO1DPSnmSIs@sirena.org.uk>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <aa7alzO1DPSnmSIs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Flag: NO

Hi

Am 09.03.26 um 15:35 schrieb Mark Brown:
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>
>    include/drm/drm_fb_helper.h
>
> between commit:
>
>    1837c76b780a4 ("drm/amdgpu: Move test for fbdev GEM object into generic helper")
>
> from the amdgpu tree and commit:
>
>    6d438685340df ("drm/fbdev-emulation: Remove empty placeholders")
>
> from the amdgpu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc include/drm/drm_fb_helper.h
> index 15274b8a1d978,ca214b5c02833..0000000000000
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@@ -271,6 -271,119 +271,8 @@@ int drm_fb_helper_ioctl(struct fb_info
>    
>    int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
>    int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
> + bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
> + 			     const struct drm_gem_object *obj);
>   -#else
>   -static inline bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
>   -					   const struct drm_gem_object *obj)
>   -{
>   -	return false;
>   -}

You need exactly this part of the #else branch.

Best regards
Thomas

>   -
>   -static inline void drm_fb_helper_prepare(struct drm_device *dev,
>   -					 struct drm_fb_helper *helper,
>   -					 unsigned int preferred_bpp,
>   -					 const struct drm_fb_helper_funcs *funcs)
>   -{
>   -}
>   -
>   -static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
>   -{
>   -}
>   -
>   -static inline int drm_fb_helper_init(struct drm_device *dev,
>   -		       struct drm_fb_helper *helper)
>   -{
>   -	/* So drivers can use it to free the struct */
>   -	helper->dev = dev;
>   -	dev->fb_helper = helper;
>   -
>   -	return 0;
>   -}
>   -
>   -static inline void drm_fb_helper_fini(struct drm_fb_helper *helper)
>   -{
>   -	if (helper && helper->dev)
>   -		helper->dev->fb_helper = NULL;
>   -}
>   -
>   -static inline int drm_fb_helper_blank(int blank, struct fb_info *info)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>   -					    struct fb_info *info)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int drm_fb_helper_set_par(struct fb_info *info)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>   -					  struct fb_info *info)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int
>   -drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>   -{
>   -}
>   -
>   -static inline void
>   -drm_fb_helper_fill_info(struct fb_info *info,
>   -			struct drm_fb_helper *fb_helper,
>   -			struct drm_fb_helper_surface_size *sizes)
>   -{
>   -}
>   -
>   -static inline int drm_fb_helper_setcmap(struct fb_cmap *cmap,
>   -					struct fb_info *info)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>   -				      unsigned long arg)
>   -{
>   -	return 0;
>   -}
>   -
>   -#ifdef CONFIG_FB_DEFERRED_IO
>   -static inline void drm_fb_helper_deferred_io(struct fb_info *info,
>   -					     struct list_head *pagelist)
>   -{
>   -}
>   -#endif
>   -
>   -static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>   -					     bool suspend)
>   -{
>   -}
>   -
>   -static inline void
>   -drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, bool suspend)
>   -{
>   -}
>   -
>   -static inline int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>   -{
>   -	return 0;
>   -}
>   -
>   -static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
>   -{
>   -	return 0;
>   -}
>    #endif
>    
>    #endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


