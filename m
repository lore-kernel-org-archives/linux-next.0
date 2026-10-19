Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444301;
	b=4Y2SgokpnCQUsVKkbnBkwBwST/y6d6xsQ0R8vDI1eSwmjGoBhp82VfX8KtbeLgGKEm/l
	 O53NbdyfMhc1Fk3d4poubabpbWzyKfBqVISrYgThIZSPtCK0Qk5wtC5eVqEzu/nhsZzys
	 eH3Uo3S7mdpPpZ6j3sfLbLmZRlAMx2FFYzagbD0ju6tQO56sel2AKlNWaTUufeIovcL4T
	 G5gr2+MhPbxtPsg0IZl+0g8vlAcVcKFtPJ+zpEM3+dRW5AUXkNmQ9SGijyiWIciSiaIZG
	 FDSrMqWvnjROB8YWggA5McVrOb1cMhPlRDE3aAQonCsG+R5sQ9+SwjdSrIJSn/ahkdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=x6AWTd2Xc8o6IHqxSi1c3sHjzBpCh7XHVhu2pJEddeQ=;
	b=G5aEFLcfze81aY9iGrrWJTPLV6dWCE8hgKW/MrBozex1repU01P4PWkNYEEwa/zK+9CE
	 Pr8EQXEMskX7OOgj6Zx6xQkHE/PzPijHUQYz63/QvXab0PckMdd2c0/aLWteayM4pLtEy
	 58PEcv+60WpNgh/5KaR8af9etzmOYARSOXBSA7kwpPnOZeKt4W2EdDx7JEjfsLNAaTe5b
	 KNWR3nQLZsIIlGmMR06sbNlP9jdoTNq91LxVpSOWpqUizmd+MTrVAkPNkL76sC6eVcba5
	 x4AVk2KtSu6CS5FAfrU153Fffb9YMbKGpv2AQQQSjBUyHaMmCSBYI1TQ8Kx4SkR2IWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=SRhPVjN7;
	arc=none smtp.remote-ip=185.125.25.12
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD75606A31F
	for <linux-next@vger.kernel.org>; Mon, 19 Oct 2026 21:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=SRhPVjN7
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j7pBT2yyzzPF7;
	Mon, 19 Oct 2026 23:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792444289;
	bh=x6AWTd2Xc8o6IHqxSi1c3sHjzBpCh7XHVhu2pJEddeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRhPVjN7pc0iqSmCje3vBHirheLDXLx77MldiqaVXvkUPJrwQ9Y74XQ/oqHOHD1gQ
	 TmoZAwt1CsyRq75AhiabB9gYOfEYHcIVHb7aZ2vBxl6FT9pc59JJaoE0nLoxSo3w1D
	 NSxnGLS3WSs08IoJRRl5t4kR3rXPBZDT5TqAr0Rg=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j7pBS5mMmzCP3;
	Mon, 19 Oct 2026 23:11:28 +0200 (CEST)
Date: Mon, 19 Oct 2026 23:11:20 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <20261019.Za1phooV2oom@digikod.net>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atZepZTcoR9teu-r@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Mon, Oct 19, 2026 at 07:17:09PM +0100, Mark Brown wrote:
> On Sat, Oct 10, 2026 at 01:31:03AM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the landlock tree, today's linux-next arm64 kunit failed
> > like this:
> 
> This issue is still present today.

I removed these wrong kunit checks Friday so it should be good now, but
I notice that linux-next still has the next-20261001/landlock merge
commit instead of the latest changes from mic/next (which should not
conflict).  Could you please confirm that a normal merge works?

Regards,
 Mickaël
