Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF548AE20;
	Tue, 21 Jul 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646383; cv=none; b=Pa2QwCZf1lm4wGj5uhhCBOu3J8OdQyZWXG4+xfE2l8qbAYprcjn9f21FfGP26aFyq1/7RUulmwoJwUmznZc11MXMQbbeT6HbNWcfvg9qjovkjJPdsg/O2/uZoZiTNMiI4h8lEmsztZiup2JwmUwiIpCttCOKVv8Uy14K9mqPIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646383; c=relaxed/simple;
	bh=njgdWOLRxuOoeELBEVYbGYANyDDlqKRO90zNc4uyVK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7HteRw60lZswJbuWEIEoNa1lALDUqc4hxcYG6FqQa2k1WPGa8n1neiFQNyOBnZdgypflM9sQw+jX5crA92mnwcHr87Y5EKVk5VIBzQ045GNHrL6GnqxVBtuBjlSpZuV5ONp+2M/sxMV7EZvuTMcqpj2cV9um5HUhp9yC2KUFCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JHSNZVax; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JHSNZVax"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C308840E00E6;
	Tue, 21 Jul 2026 15:06:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id s3kmtAUK9qb3; Tue, 21 Jul 2026 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784646367; bh=K4J503/cckP3uMHUg/Mdge2yUAs/r/SyQrJLoIipz3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHSNZVaxhF7gP0YjbyYsvalh0XF4LMpN2UgagAEH2Mv3FfZDZw+1pGNyK4GLfYtAl
	 EMlSpXmwf1N34Mm0CJnQidU4Fm0zx1qTsCAUIOe8shnL68otWYjjUeZAi2VTl5PCnw
	 33wZ6StVkx1URhTMN2ToLD0Zae94e6S+Fp66cPrAEWc+ruZZFTCt508u5u0UBm9fzX
	 +VAvvi3+xI/djTjl+4GAbacEL+rz0TLcgrwlnqKoj23mSHJ8lm0KvJdkdZ/ErfWsr/
	 KgDUShj5W7Avj3poBO92Y0rWK95qsAxZdnwllahOk/SucsDCfQqqiTrf4ivNNA1KxC
	 wRFozF4SxkRCdzrJK330e3gkKb83/jaLInvdS9uBMeSnAY8X68kv8VW06+EVaP/vIl
	 kRIsvWz3iv+sUUujC3lTJz1nsmgaALQDuSYZu+Ee3A9XmDdMisE4NRlqqO51YhyPsf
	 myJOJeVNQHssyIPI1trsoiXwah3U6ZR7QNL8cQG6RSOAjkhYKZNiBqFXfo/WU2WnO8
	 kR+K2yWHhQtNFebWuZ5mIgjERplJei/e/nYEsFeLIRhJ1Ex013u20AHHqepa/8XQXW
	 dC0QaQzNAkumBuNlw4SqCRkFFRHmt/enP0n6xlE1dTTRKLR6mEt4ruHz8orzzBfDDQ
	 /idXiq1rJWOcQuXf57Nzm3xI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3269140E00DC;
	Tue, 21 Jul 2026 15:05:51 +0000 (UTC)
Date: Tue, 21 Jul 2026 08:05:47 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	syzbot <syzbot+ee7ecfcd0e3f185e835a@syzkaller.appspotmail.com>,
	"Denis V. Lunev" <den@openvz.org>,
	Vishal Moola <vishal.moola@gmail.com>, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
	peterz@infradead.org, sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING: locking bug
 in change_page_attr_set_clr
Message-ID: <20260721150547.GCal-Ky_X99ULTLK2Q@fat_crate.local>
References: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
 <20260721022448.GDal7YcN_64rndpnHI@fat_crate.local>
 <al9LYQPufAfqvMYT@kernel.org>
 <al9jHTONTrsImlVV@lucifer>
 <20260721135323.GAal9504VvxYHpcPtd@fat_crate.local>
 <al97bRuyGo2UpCv3@lucifer>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al97bRuyGo2UpCv3@lucifer>

On Tue, Jul 21, 2026 at 03:03:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> You mean the series that changes core mm and has strict dependencies on core mm
> changes and solves issues elsewhere than x86 CPA, that one should have gone
> through the x86 tree?

We do immutable branches for things like that. For example.

Bottom line is, there needs to be synchronization across trees when they touch
the same file.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
