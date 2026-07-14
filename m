Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF5494A17;
	Tue, 14 Jul 2026 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042075; cv=none; b=Qf0Wfurvg0APSnFVsrpNjgQrzwfjyiYnCtpWsq1TwM8zLzSaPjCIfIhetZ2wL9/nTBGzVQoaYvgcuZoPBuJoIy7puJk/FQtqG5RwuZaFgSYxNTjRQj6f6e4/erKqWGm2ag8VhlLWjAcXS4CVvECxo2nabEte9L6NL+Fl0vHfQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042075; c=relaxed/simple;
	bh=GTZqBisMdGrbY7VOwtAi2rRufcbpKqRI8ZoFLL28PQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A81XguSnDTy63DmtKiC+o6/JZcsLbA6kzI+N5g71CTROfWFjpa6YayJOHUIrpUrmxn0LiTvEJFFQzWgWyzEg6DC/ViQKpeIrHUEvjdmeRW+rYcO5t7Ikiq3jYUR0QAnvJTzLutsMKKnf/6lTnKFY5Iy4DlmANf06Exir7q4jGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=SOrLMtyd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iE11uybP; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="SOrLMtyd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iE11uybP"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AB72A1D00189;
	Tue, 14 Jul 2026 11:14:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Jul 2026 11:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784042071; x=1784128471; bh=wAmHw6bKLz
	juFrKQBsVke+0B/PWxwFMAXVTgI4u+VCs=; b=SOrLMtydWWSV16wJcGagGQaIjo
	S6s6+HhWtaG5CF+vSWeJLv3v6nlOSOzQW8u+2Plw5VILTrlK2ZoADo7NZOH6Gxc3
	PjyGkMItcRziglKUs42JlnOi+NS4KwB2T+BMZ+mWDJ/TjZul5qJE5oK0XxPE+zW6
	Q09vhkDJXfHqyOvPmwlfYvUK57IsrCOfEewuIH8SCJ+Pxsvpr1u9wtVvcUdaFz8Z
	uTXD2S3Cexs7y1U1nkeIhv7YLuFwu5Q4WOyiT4z8xa7vRO0xxkVxTeX/zrrZu67r
	aPfI0+3iZarFtlBsXVEuPaw6AKMKde2tr6BU8alkbzK544cKXZ8kfsXPPAqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784042071; x=1784128471; bh=wAmHw6bKLzjuFrKQBsVke+0B/PWxwFMAXVT
	gI4u+VCs=; b=iE11uybPBY27PeF0s+J556S65WBPQHchVw8KR4ybLhg0iJsp4oy
	wWGpFRqSrAW/PRT9AOjzpm+sFsWLeAbJ0z8RWIQXQwbxZzqxo0mRA/GZH/UGvw2Q
	ibjQys+9WZMmbAY6gpBRsmtysNQU9ro7pUQYgTtxhh+0TWtyBqgSXKJtbhkGxktR
	jTZP2QUEhzLUDg9WU6aGSzZ/qdllrNzXph5ztoqjGt7MN6btdbk5yrEclZ+CkNUG
	SU1UWSX1O3dHkTd8NQBZVjDEj+32wyeoCl6zmInZc7HgaFSQmhBIYvYWarBHFBhW
	RaA+otB95TGwRvqxSZCMT+znGpsEKJPn8qw==
X-ME-Sender: <xms:V1JWajuLaMLbjdO5W-r15pvNdajaxXfQL0Mo78Wf2axFuLKduVVMeA>
    <xme:V1JWag3K3nhjhnFjnCe6syG1ajiS_oHrVueABhNSYp21jH0Q-4HZXlzAbWpGzS6K5
    I462aID7Z2HY7kfgyZtAxg-DNSFw2I3RDiBloXVmJZm9JcGN58>
X-ME-Received: <xmr:V1JWarNGG22_JhUkBDvT2tznbfuiBvf-ovIv1Ufc4CoGqApOlYkc7hrg-LkGh-il_ki9RtOJ1eOKwm3Zp-89sKqCqg>
X-ME-Proxy-Cause: dmFkZTGgfolyFf7MSyEgStVz0JHcfvxYoxBXXaHJ5+kTM2qgkE5pX7NRCZuEgbOAP4aSuJ
    nnI4OHvLci4byfchol1//iX1fCmULX4UX47OcuXnDqGeDm9qRVR4ctKHHLWc/uKm7fyw+4
    GN1puOy9NeyauK26vAjknkhbqwlvOCrfIDsa5+o26ZtvkWjeDxnVSLoImm+rIAxkTXX1Q6
    4mc0HjqL+eKC6cEUzITJcGhnOsZzuGZEz0NzprsfvSXHLgomKDmnOPHcEvFqkg0q5hU4Vv
    /CqAv1OhwSJvi5X/7yXczLkNJNZ6nMhWkp1HkJLksbQGsYCwYCLmy0BxeWo2Wq/6Hg9sKx
    fC2fw0Mqvssz6KPS7coxH2ECfDjLmyKMm26ROQLR5HqIhHPYNThY020ClvAkTcUFArKVl5
    iT1QWRVksbYnPGNbHF1BEts3PWGyH0ixFeZ/yqdlzWvIj9QsQFpt6er/hJHKq4Ym1zJ8UC
    f1hY67Z+H0MEVM3FKdub5oaaHed2fEt+BqBZByHAkfK3PIrenS2B2GAHT2Dj53+Ushkwa2
    OJ5OeP6Jpr9YYV5Mvw5mD+JIDwqzG+11dVJn3tPb/W6HiDcCvfK2PWVCqZmxVbGETOBIgt
    Uq4bLI852vAYR45/3myKrjgyCl52pb3sBbM/WYmiGxm8GM84b5pp0my8r19A
X-ME-Proxy: <xmx:V1JWagUBW-REknbofB3o29chihiEOtCfS0vF7bzkBHDLRD2vUC3vLQ>
    <xmx:V1JWagaNDPGPKtGYcyvts-4sOrIVLGzu3evlJ_0dWW4lLAO3GbjUDw>
    <xmx:V1JWaq2T-jky-s4EOB2m86hoKeEVAE-Ge1B4g-SMW0nkrdPfe4NRxQ>
    <xmx:V1JWasBTBY5tvfGNdB-PEZwKFLiEGFDffsYaMuM1-P-z992rqap1xg>
    <xmx:V1JWapqaWaqgmEuEvYyG5KdTXhlRfbGvr8sfN95CfYulwUCDemuH1eup>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 11:14:30 -0400 (EDT)
Date: Tue, 14 Jul 2026 17:14:25 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin
 tree
Message-ID: <2026071408-colt-vaseline-3250@gregkh>
References: <alTxRkflyqvAaGc-@sirena.org.uk>
 <alYvsW4eRWsA46YU@google.com>
 <2026071439-magnify-submersed-b5c0@gregkh>
 <cc5e4243-d179-4224-a196-7337d1ac51f8@sirena.org.uk>
 <2026071423-joyride-gainfully-f851@gregkh>
 <b8939935-19dd-425f-aae0-8879fe3fa68b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8939935-19dd-425f-aae0-8879fe3fa68b@sirena.org.uk>

On Tue, Jul 14, 2026 at 04:06:00PM +0100, Mark Brown wrote:
> On Tue, Jul 14, 2026 at 04:22:30PM +0200, Greg KH wrote:
> > On Tue, Jul 14, 2026 at 03:19:41PM +0100, Mark Brown wrote:
> 
> > > The resolution in -next today (when it's published, hopefully not too
> > > long) should have integrated Alice's patch.
> 
> > Cool, I'll copy that, thanks!
> 
> Just pushed it out.

Great, I've taken your resolution.  Alice, if I messed anything up,
please let me know.

thanks,

greg k-h
