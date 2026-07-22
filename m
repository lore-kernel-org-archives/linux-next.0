Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22363D9670
	for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 20:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753644; cv=pass; b=cUyuk/2tVYpQybkxb++YBuwseDDlHLwyK3x3whjhOls6fHPrWewMXgRotXZYaOVvljfpCoPG54ZLndyBXOQeYjM7TehPiEW+Xx46YQxW7ViksKvTTyA1OKIEY6j7h7h9asxUcjQNn6lKg5JUynEagvR98rolQ5P9cp+IPpbSMzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753644; c=relaxed/simple;
	bh=eWOazWHJ0TT97xqbRlfrRls9dVlxEnOTHwOajl3Rxz0=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anyWUV+Ia11k1vLaMKXISntUknQukzZGjsbQUXg2lh72twYWKaLdmGLQSX/OpQhQaHq3SZKvU5NPb0fPpFiiJ45A9YYoWrzo0b0dbHGYcRWhXXbUHDlVpmsdwxEXrqfc97tUVhsUPQFxSfLQolvRyfMH5m1EuRZHSc0LPWP+P58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEhMdaas; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEhMdaas"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977168e4f3dso2292119241.0
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2026 13:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784753641; cv=none;
        d=google.com; s=arc-20260327;
        b=k2OEDYh5hFG0qsQssnp2NxkgY8/hnz6wNL51Oj47JWJSvQv6lZAxDb+J9yyy+H2UQt
         axOObOutP1yfixHze8hjTFie5hHVjtAyqHCRmJfXcuA0d7FP6xt+sC2rx06AEodPDjKn
         4jpH5kg+RHq0ysrw4AfTTzMg/AmxWPbE5r1KYpsEHEILRt7W1jDY7Gmu50ExE73aV+1I
         dTZHEVOaKiOv2zdjbKz62+EHU7qqoJXh68WfxgEl5A9cPUlFvbnAWsRb/tZljxcUiP5V
         NRIMM0wXtSVU4UpuR0YpSn7c68jUgqTumttGdfilPGSAVLcv4HIDyHmvf/vm2ibnMyVR
         oaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=AhilNQfsDkJHCCdgzHNOvxzFtZWC+RXb2TKxfn2s3w8=;
        fh=iCCAah2iijznIKsQUy0LVFhbu0SWDlgBSgpfidmfrzQ=;
        b=eg/xj1fCkxeZz9+KRZLHCLmYGxrF3DJJOpfvm6Zn2up4MOgE9WgV6QpETXukl+JpYZ
         /ZmQf7/p+dOTi8FR1draJdDlZNFKXHQdWAPuhZRG365FeDl8sdoej2ZbMBSNpUb2XFFb
         K6kmy+UJpcn0C1NZVYsQRpEPoHisCFsUrwHhgkoYnyc85ESsXpGY90gFRtlSPYlCePTs
         GtAiAUgltEwIefC/tiPx+GkMeG9ZfJ61XUXEJKTmxppMMHs3uxYrLuUkD+Ty83fdTjZp
         qIKae8fBCYA3RxJk7h10ENhMD/JkqQM5LPnAxw/WSnkcnTz8mu+g4/bIMEFobz9XSX7b
         F5Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784753641; x=1785358441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhilNQfsDkJHCCdgzHNOvxzFtZWC+RXb2TKxfn2s3w8=;
        b=FEhMdaasxbkMRUStXSGwM/NJBjnGe/Ab7OIqMPKcdWYWd2lLRSh1mbd1rn1aaxw08k
         83U8aePrHa5ZqKI5O4IR8UwWZBToo/B+6GBA4ZT5YSO/gSRChCZeb4peE0g2jqYN79el
         226eu+MIuoTOXT1q61GiUR+jwqNgm6SwVh8mCJNCjjp+Km7siv+c7yx9Q9jhaRd/gh/k
         jWubc8BKm403whjYQC8HQFQVOt/6QQwMei/QvOMpLdgt59d4Yk178XiHuu53VZrlNOUQ
         NkhEB4qliFXMudLtTcum6+eMPkUxyxGyozLKpdIuD5pcrgrHFK2+mlWXKmQV6TCBDB/T
         37jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784753641; x=1785358441;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AhilNQfsDkJHCCdgzHNOvxzFtZWC+RXb2TKxfn2s3w8=;
        b=ZA5PUZ3R3pCxnvDuJqCUMdtIzVxnUbMnhKphWQR0ADo5m/40iue7aFMpIdDmTqDMSP
         xcFyOigGiUhd+p0E2N8gf7BuIYx45kr8UuW6ClM9Ny5AOQGeUJpPDJWD4v1jKrNrYz1m
         pi3LAzeqVtjKYwBNTNUXxmMg65hesU2qSSz9UelcYksfGpYkcL4RwB7a9BUeckwsbwDg
         oM4+3um4bVNsE5mP3FHz1JYxRlmaH6EWiV51dT11u3rtLYeSTWVvMFnny+BvZIdqP6Ov
         IjqluV04Pggburd/8p5s+sXgBHXzqpGz36o4kZ+xbSWCY9WtdpYpBMpgg13rXR210WD2
         4KwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGd59XfnD6BZIn/rF9p5mdylRe/TaDX8xsPIlCbcjFK5BFiWAWj0PVMdFreG7Lbap+1xbRE/Bmrxnv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2HcGBrvQ5ZlqUt28EXeHsm0S5kxY2e2IFUXkPoqh9ju5VkqaI
	HYdEEc2T2dMY5pZtm4KWGqygzGeDyd1MP7g6GYeNS2uj7aVfLFc40yPdeT4jD2VW68V/bkb/7up
	C/JrCsh20gGIqKucII5Shrgzro+4LI0M=
X-Gm-Gg: AR+sD10/q65NhUMCJecSDmVTWGAZBLNZgwXGpET1/H0AnV11WlNWLrZHIfCWhOp9xe+
	IdO9tMyfJFpV7WE+IvmuE1L7+hGFuRCk3iMRKh5XBeVA3JDuyy1EHSsV2xRZZQerlmnmCYO1rA5
	9jC4X0Um77I5f63+YHeLGoTwZCeDhUW0TD80W091VUSLcsKq7VhkfthnxAanaqazrG9Mh/CrNLW
	N4zrBDIjOiAlIgWODG2rf+Botu2xMM7u85K1vdpHtlm9ItxV+7wnooKBM22
X-Received: by 2002:a05:6102:644e:b0:745:31e9:f3d2 with SMTP id
 ada2fe7eead31-74d5e6d4e30mr65081137.10.1784753640571; Wed, 22 Jul 2026
 13:54:00 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 15:53:59 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 15:53:59 -0500
In-Reply-To: <amDoh8ypkkAY-vvc@sirena.org.uk>
References: <amDoh8ypkkAY-vvc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Enderaoe Lyther <enderaoelyther@gmail.com>
Date: Wed, 22 Jul 2026 15:53:59 -0500
X-Gm-Features: AUfX_myj0hhez84pVYC1y9jATG3_SizvJW7anBM1iRJVpaUMvQJ5wMHKqS46PIU
Message-ID: <CACHPgzzDmfDii3MVsjukiGYqZrd+iKur6T2+iRV11YBdqof3=w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the wireless-next tree with the
 origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes.berg@intel.com>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for carrying the conflict resolution.

I noticed one semantic conflict later in ieee80211_rx_mgmt_assoc_resp().

Commit 035ed430ce6a2 ("wifi: mac80211: avoid non-S1G AID fallback for S1G
assoc") added:

	else if (status_code == WLAN_STATUS_SUCCESS)
		goto abandon_assoc;

where abandon_assoc destroyed the association data with ASSOC_ABANDON and
notified the driver.

After f13e573ab3f12 ("wifi: mac80211: notify driver before destroying
assoc link") folds the driver notification into
ieee80211_destroy_assoc_data(), the equivalent target is
destroy_assoc_data, since assoc_status is initialized to ASSOC_ABANDON.

next-20260722 instead has:

	else if (status_code == WLAN_STATUS_SUCCESS)
		goto notify_driver;

which bypasses ieee80211_destroy_assoc_data(). I believe this should
instead be:

	else if (status_code == WLAN_STATUS_SUCCESS)
		goto destroy_assoc_data;

Regards,
Zhao

On Wed, 22 Jul 2026 16:57:59 +0100, Mark Brown <broonie@kernel.org> wrote:
> Hi all,
>
> Today's linux-next merge of the wireless-next tree got a conflict in:
>
> net/mac80211/mlme.c
>
> between commit:
>
> 035ed430ce6a2 ("wifi: mac80211: avoid non-S1G AID fallback for S1G assoc")
>
> from the origin tree and commit:
>
> f13e573ab3f12 ("wifi: mac80211: notify driver before destroying assoc link")
>
> from the wireless-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging. You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc net/mac80211/mlme.c
> index fa773f3b0541a,d577252dbb9f1..0000000000000
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@@ -7140,7 -7191,8 +7193,8 @@@ static void ieee80211_rx_mgmt_assoc_res
> {
> struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
> struct ieee80211_mgd_assoc_data *assoc_data = ifmgd->assoc_data;
> + enum assoc_status assoc_status = ASSOC_ABANDON;
> - u16 capab_info, status_code, aid;
> + u16 capab_info, status_code, aid = 0;
> struct ieee80211_elems_parse_params parse_params = {
> .bss = NULL,
> .link_id = -1,
