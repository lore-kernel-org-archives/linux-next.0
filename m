Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C9376BD6;
	Tue, 21 Jul 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642040; cv=none; b=bdlrOsGWQgcyjnth7dQ0ly/RuBG4ROY+1DQl9mnUwiTSlKI4Zt5/RJjrpp/ehbQXUMJybSOvJ9qQPN0b0wsesOjmcRdNRYH7OfADa8h6p6Xqm4QEvUROGR6Ma1NK8KF7y/6STQCcziXfrTLHROVtCPZwE+Yhls/Tp/EsQ3MGPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642040; c=relaxed/simple;
	bh=S/pG24v96dcXReMVoOpZfuMMNAPzBNZK1sf8llTe0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZNAPpjfc7ilYo9jFnVIfjMynb5ejvmj45rqKWm0mtoikzSTRG8J+2ZybTfrWtKmTvv+kEUMlynd6qCMN8Mxz0bdwuXMq9HOvY+x9GIs9Afh5w6usvJutjhiOs5tijAe6fqInUguK0AAraXJTUaa0RYhrDdhcJ1K6MKYpP3j8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=O9qyA6jh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="O9qyA6jh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9E0B540E00E6;
	Tue, 21 Jul 2026 13:53:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KLELq57u3Ev2; Tue, 21 Jul 2026 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784642023; bh=N4FiO5KBeN4l1xuh+JRHbGqva/LWQ0cyg8zDRxYAWrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9qyA6jh2DjZNt0DolDw8r/eDKVDyJ1rBeEnPflfyWCfXvg6JFmTJu5C+QtWbzFnG
	 3dwh1ydToZMVJJIOdgSySlqwCNAsTAkU3/W8FRW3mCkYhpxKvfz35/A9dj6FV6ihla
	 4HM9ppJBL2hEu0sCHZCSJnywcLACtirGJYb5oCUAR2KVnsvlQdP6Xd9JsX5U3nwxFM
	 QCWHp1UcvmhDjnW7O6q9m5+UrrlwDjtEbpbkKXOnEYCHdvkdsOt89lDs8U5lsepfTX
	 L3AV0femClgmWVo4kT+LQLVEwo6CZHyzPVFzZAJHoAIU6T68e3hdHhGkNx2vbOE0Y/
	 8xMWEufPDz7ZLvqkzTkCoMe+/I3s5FahTEfqxqCxaNlRzq46KxxNtBW6KEvkCK4OtD
	 6XSX1dlOOOSDj7v077Ddrs5PGDz/LUjUmaz/it8CMmi50LVB9dCI0ZsxwZ0yZmm9Rq
	 4Ol7wo+cnFuIC8tRXLc5+St0eYC23veUO6JTsJX8d7H7C10MbAvJ4ZWrRsDBlG17HP
	 7stx/sPXOK4j/TETk22lPc8NmbZl0x8ep037cGODXSsFiGYr1A6beFvUKPKCv9AC4S
	 hTyCbnu6BUIZA74Fdbm+Xn6rNQNZoR+Rnm0+5An/S2lXirZnJ6xoxGIl6kJge+NymO
	 hAE2RHnF0o8+Pm/rd1BtfxkQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2200540E014C;
	Tue, 21 Jul 2026 13:53:26 +0000 (UTC)
Date: Tue, 21 Jul 2026 06:53:23 -0700
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
Message-ID: <20260721135323.GAal9504VvxYHpcPtd@fat_crate.local>
References: <6a5e53ed.f1649fcc.2a4208.0574.GAE@google.com>
 <20260721022448.GDal7YcN_64rndpnHI@fat_crate.local>
 <al9LYQPufAfqvMYT@kernel.org>
 <al9jHTONTrsImlVV@lucifer>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al9jHTONTrsImlVV@lucifer>

On Tue, Jul 21, 2026 at 01:39:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> OK so this is a screw up with merging.
> 
> Two fixes are applied at once here and they are NOT compatible :)
> 
> Denis's ([0]) holds a spin lock over the operation during which an older
> revision of mine ([1] - current, probable next revision [2]) tries to take a
> sleeping mmap lock, hence the report.

Lemme guess: if those were merged by the same tree - tip - where arch/x86/
changes belong, we would've caught it, right?

Pff.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
