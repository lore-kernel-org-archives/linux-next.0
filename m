Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21D36073E
	for <linux-next@vger.kernel.org>; Mon, 13 Apr 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776106605; cv=none; b=n+Lwt71r133D9KDzO3vX9nLPMveiGEleZyeqOTAm37Tt1Uqr4yIiKRfX65vDReq/qHUa/fist1BIvK+/oxFUvCEC9cRBWbw3yMXPBQ2aTP2AOdqPf9gzA3UhAn0JjnmL+8DH4fs/tcdlopsDvwTl8VnbooO5j87s49P0RUFY81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776106605; c=relaxed/simple;
	bh=sA21BOiKtjGp4c5Oxz1nSz4Cgd9OsrJc3ubp1pJYJwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEcUWC9ZrZNu3IEkjgeqByoXAsP2OCMtK0ETttpQ1OUQG0VvfwnPFznosYiH+dFUOunxHe/T7CXQm5unJGSyQovwpuNBnGfsn2hJFp20uaRqlmMB2O5fpd43M/UGATm9kX+cW578BZ4s9umdNfDIe0BeAL/y058iuZCuSVomUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gZWP9Qfh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gZWP9Qfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20BCC2BCAF;
	Mon, 13 Apr 2026 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776106604;
	bh=sA21BOiKtjGp4c5Oxz1nSz4Cgd9OsrJc3ubp1pJYJwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZWP9QfhZgygYBChLRyjIjohdsSQIqs8uSaVN1lO0hc6/hfCkp0/5bgWZxi8FikoK
	 Y4Veth43qa+xAslbH6Nu8Fv7lymsovGj2g/to7WQQ1gXcUHGZ1W7+A6TaUcHX9VzXP
	 UzmyhMf6gDn7Y9w+js+Pd6YF8Er+CLAbS+5P5Lfk=
Date: Mon, 13 Apr 2026 14:56:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 10
Message-ID: <20260413-foamy-ethereal-hippo-5ba6bf@lemur>
References: <adkN9ZX6xjhARbbh@sirena.co.uk>
 <e1a1c2bb-cb1d-4647-8639-8ee86b218509@infradead.org>
 <adog99ZrlIi-cWnF@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adog99ZrlIi-cWnF@sirena.co.uk>

On Sat, Apr 11, 2026 at 11:22:47AM +0100, Mark Brown wrote:
> > I don't see today's linux-next patch(es) at
> > kernel.org/pub/linux/kernel/next/.
> 
> > Are they delayed or something else?
> 
> I have no idea, the script ran.

FWIW, we never received the command for 20260410.

    # grep 'PUT /pub/linux/kernel/next/patch' /var/log/messages-20260412
    Apr  6 15:06:24 gl kup-server(broonie): Cmd: PUT /pub/linux/kernel/next/patch-v7.0-rc7-next-20260406.gz
    Apr  7 13:53:07 gl kup-server(broonie): Cmd: PUT /pub/linux/kernel/next/patch-v7.0-rc7-next-20260407.gz
    Apr  8 16:53:28 gl kup-server(broonie): Cmd: PUT /pub/linux/kernel/next/patch-v7.0-rc7-next-20260408.gz
    Apr  9 14:49:08 gl kup-server(broonie): Cmd: PUT /pub/linux/kernel/next/patch-v7.0-rc7-next-20260409.gz

Regards,
-- 
KR
