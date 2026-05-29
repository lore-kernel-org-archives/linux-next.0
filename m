Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECC3AD52A
	for <linux-next@vger.kernel.org>; Fri, 29 May 2026 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082609; cv=none; b=GBH7snXgerNu0+5nmQwmBQiO7r+VGW+wHaCRWFm0CvprbFgghtCMVzhNphcsfV9NStIX8NsaIwH2LtAs8KKQUnKDCKwqQByKPPdam9JTUWWU4BoOzs3FFGWCFldk8JP1pc7Psv6XTz+sDsWqtnKwImOxcBCNecIZVPcRjjd3Nkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082609; c=relaxed/simple;
	bh=2/5erPZeQLhOeXkhmNdJqji/zrTTKEM5lKDYgr/XLJI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VRq32J3HAnCsN+d0nvhmdNddsCJl0HlQkjM/+fZh99v/aYa4zW2gQxRU4ZRmGUQZ40BlGdKBG7G9EJYTkmgcBKbNT/GfPRkVvsoge1QvH8FaP/28MHAfYx+8BeprnGEXiBw3BRrMY5DNUKfCoI1SuijLP80jlZsNR/6Lahd/A8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WOg+kRqN; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WOg+kRqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780082600; x=1780341800;
	bh=2/5erPZeQLhOeXkhmNdJqji/zrTTKEM5lKDYgr/XLJI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WOg+kRqN4PLSwY+5LaaAUEyp9Yrd4bkbpB3ZxKCbzc9Z5ZogJZ96GGpgGJFavdDHa
	 9S38s18VVDb+ZAjIsq9BIO1v0jEdUw8SIthm0Sikn7HxaKLEvy0hF9pCA0P24c5VLl
	 BeLBiItaBpiBqU1NYJelEyIQl3FtMjmcDqyefNmE8ZaODfEJQ9wdKrMkExtBIHhQEE
	 v5RiHz++CRby9BUNeO4BHMaroBRfvs7OI8W1/w83jEm6dM52B006gaYIxEiKicC4gw
	 zsE2xkYzrw/sufROT/QJ9XQakYj/+jEnRfiHiLwSPJJrAIzd4D0iyTlG/twlVzyYj9
	 745cnqNyifCXQ==
Date: Fri, 29 May 2026 19:23:14 +0000
To: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hongling Zeng <zhongling0719@126.com>, Hongling Zeng <zenghongling@kylinos.cn>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [REGRESSION] Introduced double release_region in gpib/cb7210
Message-ID: <PpNUbGhrvT8I_KayoDvQYI2PYjmMw1QEkuVBDZz2PwBsVVgPkBXJarc2mBM0IhiH3AQG0GtgqEsDRXNj3yUKEDBaZa25u73pAjvcE6vfRsg=@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 2108f02c579d35d3a88fd192a2796a85dbad6b71
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

There are currently two patches [1][2] called:

gpib: cb7210: Fix region leak when request_irq fails

in linux-next that came from char-misc-next. Patch [1] introduces double=20
release_region (if cb_isa_attach fails, cb_isa_detach is called and it alre=
ady
takes care of cleanup) and patch [2] introduces release_region on region we
never obtained.

cb_isa_attach is set as attach and cb_isa_detach is set as detach in
cb_isa_(un)accel_interface and cb_isa_interface. The only place where I see
attach is called, is in common/iblib.c, in ibonline function. If attach fai=
ls
there, detach is called, where a proper cleanup is performed (and it includ=
es
things like nec7210_board_reset for cb7120). AFAIK, the same approach is us=
ed
for the rest of gpib.

Please revert these patches.

Additionally, patch [2] was cc'd to stable@vger.kernel.org - hence adding i=
t
to cc for this email as well.

Thanks,
Dominik Karol


[1] https://patch.msgid.link/20260503093036.283546-1-zenghongling@kylinos.c=
n
[2] https://patch.msgid.link/20260518022939.16881-1-zenghongling@kylinos.cn
