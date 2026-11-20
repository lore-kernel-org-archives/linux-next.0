Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186860;
	b=Jmf3QD5WBfJM6F5TQjDuCbOdyYzYnOFu4d/5bRuxFCxr3GllNLU53b0dL6DlRdwN1RmI
	 LexCYo4TYcbTCWOwCL+K0J5l9EMRS0+hP3I0W7Ah/VVahT4fkFc/wobEGgyL/ho2F9fLj
	 RnrP93Q/mDzDXnxDlNYTRa3y5dFEEVTb9FkEkmTbNxRNE/UoKlJYgAPHCC5O21jZ4b4tc
	 ZNBh21bg3aAZkckmebjsjxxcUByQKJKwDT2FNRTh9js/Nas5ZjFekY+nqN0axTMkcIYVI
	 O3YWgZWVpmmkRH+uUq22Mjgfnf2upZnE3Eshfu+Zbm8zsWV4GMo4hijIfgQzeZ/ae+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186860;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=MnW8KXmyxgF0jKL8129AS1kOZpE+ATFvvnAgEJriMf0=;
	b=rbVee2C1AetJm+Jzu4jGCQMvt1WGN26jMxYMn+LzMl8vnX4bZYs3+jTkFH5MQd16NAJH
	 98cvaZa1c4ymVo0KEqmI13X/8CWgb+WkYTBSwKLYZc8/XjqSLLJZn7Ud7I1BdObT4hYdy
	 +KB+VRM4FN/Nr4xtOx+zDLMBG9bGZnyaF/pM2kVG6TGXU1LeKMHJybWgPBfCJW5H4n5Es
	 6IRhNmX/Hg0RJlqnJ5gqVgXrOMGCCFWfmcsqS03g4zpi1kQyAZ3bptHSAIsTCARHKhiOG
	 pwlHv1GsPqFhgVy8G9AimAalpq7yZ3ef1J7YdKqLUFPclCOcjkOe/KonDMziXrGhTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+TcB8pF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20960A380C;
	Fri, 20 Nov 2026 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+TcB8pF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CBF1F000F4;
	Fri, 20 Nov 2026 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186859;
	bh=MnW8KXmyxgF0jKL8129AS1kOZpE+ATFvvnAgEJriMf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=X+TcB8pF9c4hvOk5n5H2XKH2QsJ9Yr8j/7rfoNLoaBJZO/tANF26ZCo01NvVIzSss
	 yDJ5YodlwDoxyL1+QooO2Kab6MUPKJQtdKaMsC9P4p57rpNgl2GKKw1XP1D+d2wcDy
	 D8CxTfAo9LU2Ni7GNep2UmyEYMg+KVynjIQ/OTvbkRIbk0wZCne8UilEEZ10pkxrVZ
	 SClSFnjSZkzUB90QD4+Zo2ot+7dDi3pDeV5lyBht01Lu3CeXq3qgTn2J0bFnAsr2Td
	 sSmpyDN1TMpgpUbtgGRetuv6G+BaLt9iWKp2vnAGe9js+zRmSCOLz0/DLE2PSHibOq
	 2zAC6TfW96Ueg==
Date: Fri, 20 Nov 2026 16:00:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
In-Reply-To: <awBfXhrj8dYTa53z@sirena.org.uk>
Message-ID: <58q73981-0q03-0r3q-5o96-n8n73o84s6r8@xreary.bet>
References: <awBfXhrj8dYTa53z@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2026, Mark Brown wrote:

> Hi all,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> /tmp/next/build/drivers/hid/hid-logitech-hidpp.c:4714:4: error: call to undeclared function 'hidinput_disconnect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>  4714 |                         hidinput_disconnect(hdev);
>       |                         ^
> /tmp/next/build/drivers/hid/hid-logitech-hidpp.c:4714:4: note: did you mean 'hid_disconnect'?
> /tmp/next/build/include/linux/hid.h:1051:6: note: 'hid_disconnect' declared here
>  1051 | void hid_disconnect(struct hid_device *hid);
>       |      ^
> 1 error generated.
> 
> Caused by commit
> 
>    a9c54220eaab7 (HID: logitech-hidpp: disable works before stopping transport)

Dmitry's patchset has been dropped from hid.git#for-next as of ~1 hour ago 
befor this gets resolved.

> I have used the tree from next-20261119 instead.


Thanks,

-- 
Jiri Kosina
SUSE Labs

