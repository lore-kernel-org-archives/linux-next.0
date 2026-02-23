Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE034D4DE;
	Mon, 23 Feb 2026 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849223; cv=none; b=uhbDkjaFfm2x8nVLcZxBCoZ69mUNpPmQwTQYQr2kBp2zGpnGdeJ0VeQB6D+gRRps23r2tGV/hY2AnIxjeAupiEbbeZeJ7gi+NN2LZ5HATfES0czZ3I1myzHZdpxoWvIBqlasHBy3p6x4hl1b2x0IdnkhVKEe8/viTInurK6aGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849223; c=relaxed/simple;
	bh=e9vu2WssLvQms0wD8rTfOhVzJHvp7Yb+QKagc7o40r0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EzKkQxsWH7WnOGOaggP/QIIvYcZuChqphYRt5uJBxAbtQAXKdl8ZGth2YcVbUMsYxc+V+1US4pqmaRStMN0BllhlByBFiSKDddMDVLV84iWbykZhSS0wMSv2PY/Cdw8stsmQ8ui8ah6dlfucdleRS8YELDU/lUzRNKEiULbMqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+6cRZH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+6cRZH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5746BC116C6;
	Mon, 23 Feb 2026 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771849222;
	bh=e9vu2WssLvQms0wD8rTfOhVzJHvp7Yb+QKagc7o40r0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y+6cRZH4uaWfc9OROQCAqUOT0nFV9Igwu7iwFpzhQqyMnL/5+s2S8EsHlP5AznWbJ
	 Z+959gLb7ZbHIZgnySo7PFBrwDWoTR8yvEn+nZwuNRO9qNM5aBQ65P53ZFRQzXfx34
	 46UQEs57m0xtogKMVhML+muWtuoPnly2msXOL+av+W/KdqdFNjFGwAS9G/TET37QiA
	 mfH4c1UDbzsdlOC5qet/FSJi4UNQ4LMtLLoHRRWCVbvBx7koP75VMV+9lpWnqwKFNv
	 La67Cge+P7pmvyP4DiL6gZNi6vwrgvvyYQ85BczKnYuWWzMhpvlp0KXtfrPfyG58Mb
	 ff+ILIG5eH5yA==
Date: Mon, 23 Feb 2026 13:20:20 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
    Julius Lehmann <lehmanju@devpi.de>
Subject: Re: Missing signoff in the hid tree
In-Reply-To: <aZxFiDybKKxezaYc@sirena.org.uk>
Message-ID: <70o4n987-9s87-rrr1-qrrr-r351qs44957p@xreary.bet>
References: <aZxFiDybKKxezaYc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Feb 2026, Mark Brown wrote:

> Commit
> 
>   6b409da663270 ("HID: magicmouse: fix battery reporting for Apple Magic Trackpad 2")
> 
> is missing a Signed-off-by from its author

D'oh, thanks for spotting this.

CCing Julius -- could you please provide your Signed-off-by: line? I'll 
take this as a sufficient reason to rebase the branch.

Thanks,

-- 
Jiri Kosina
SUSE Labs

