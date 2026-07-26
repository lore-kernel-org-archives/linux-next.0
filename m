Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10D30F55F
	for <linux-next@vger.kernel.org>; Sun, 26 Jul 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785084127; cv=none; b=TOfc256jVxtk9vPpnAZTz4sOZvInIthfXF9VTfrbwUR9SW6zw88jASk/AoejGNely53nNoPFsDfWThG3hVZTs94NFQZl1xjUDT6u67wXE35SxggBVCr9lB2BRZmn0fzQ4WecV+2I/hMPq+MFSbfjSZNBfpQj0jlZRpxByiV4aus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785084127; c=relaxed/simple;
	bh=5ayzNmnRWCbzWEek0cUnWmGqhJIO1oU83wMkBfmlKfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0jYhcXdjQsvyARL32ESuj7tyBUeeg+aAeiNOB52aPzqiDIujcqdP9ubZkd0hEjAUnQppVdf2JxHQBjgJVh6tHpaSG6XBLHS16wwOdWdEsw4KGyyCmMtv3nxZaPJhd0AbyTFL5j4LQs5OD6LcN+bbSNPsc1ErTQdXvd+HvfqqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPViRCvH; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPViRCvH"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1972305a12.3
        for <linux-next@vger.kernel.org>; Sun, 26 Jul 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785084125; x=1785688925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ayzNmnRWCbzWEek0cUnWmGqhJIO1oU83wMkBfmlKfk=;
        b=MPViRCvHXVpOwuEkYs/ECEGyWeIOyNIogMUlmqhOqsHX7Xt35jqXRXrxe8X1VHwyf+
         4ADrwlCb3QGLFh7L3Z/izQ6mfcxom/B5uIEBAIAdwir8wvFNMTPSPm72/2t3KFXGNp3F
         TL94bjnvFfdeOZ3IOv533zxf2CXD8xeQC/D2M/MC44yIvshqRqLeDS8m+0jNhHEpUA9c
         LJ8kB3mZAosyh+9x+QaQIvgwnIGD7muaf+0kG//2KolTY4QE4oIFIAw0Hz3vmusdOy9x
         U0+520pR4xb7fpj+X2wsaMHvupeEGhTlBrru+6Nd4qRm+VcFZInKpCaNydqjEq8HotE4
         6zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785084125; x=1785688925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ayzNmnRWCbzWEek0cUnWmGqhJIO1oU83wMkBfmlKfk=;
        b=B/nhEYer835lwbNlq35rngnKoVJ9r4770Tjv2WRRFJyJiiuR3qNDX1LO1LWZg9X+Yw
         dOuTx5CrHXfJI18Vqh5WW8sa6sWGl2JuwwrF45I5PK9UGFzO/MjvXTBUVn1FlzV1mvpj
         9+iIZYMgJTs+Dm3IkLNn7NlNImafS3vgsJUaiXHuPVWWcyLU96yZrkz1Su0v8fWBZId7
         46NuCiSf1YPO3ZNoNNeigWgFWF7t324IzwlYSP2rVZ12JtZ5oqNGqjLtwcjnRSARb0Ec
         oycaztsOyl8GRkFebRaaa/+09xx6PM5cP9//dpFWSAipe2loits3vdfIbf/aC6C5LBWE
         aoFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+UzW3EucGEKv33chskt0QCDiv657wYWcdC5I7OgHkfcYaM4XpSE3k/iYMEaUuF+YLzLrX46vssUJS@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaOyfIek6Nqylcj/Gm5IgAHAtZ6Yk1jBk27CZGUyjuaGHofFD
	9UtYGBw0KTUoTiwBAfWDg0C094LSbLpe+MGsGd+eMa3t5kJCDNC59qEoZu6KCPYX
X-Gm-Gg: AR+sD11CNzKCStieB6MV2NE5P7YE1CSUAUrKjZ5W+qOJkcnzo0pBnIzkh5EKLnwqqc7
	sXN83AB5IWyur8FNM5xBZMToP13vpl5kl2XFa7bV6RdnZaZEjipyNI/MPRmT9O+GxesEv+sW7X0
	iO7qoPKJA+k60bEnRvf0Vx+WSEMr4ZboLbtnUILQHy/MUBaKDpKCE/shuHjfdKwkTU7S4bq8zvs
	2+EqPCHdzJDEJAdgCNi+awFaSPP13gaXwWEMqstWoVXdsvinz4rQYG+QB3DqfpGdpwC7aRTFjGC
	n1vbSxh6Ed3PyFRO2MRAO+Glu7aBOivbUfgGS/HioofCP1HePyb1XJcQV5cdVQfS/aW4T0uCdD0
	LrA5xyntjQ303pBaqS0zOKaxLSzeITTNcOxwA4T5ynynOHnwpmw1AIQqvAnlm+e49rN+RDRgbPg
	i9/f/55kblEJBNVoxtMPlU2e9q56hMQvlOFMcMN3/CMFU97cET4Vk=
X-Received: by 2002:a05:6a21:2d8b:b0:3c4:46ca:3339 with SMTP id adf61e73a8af0-3c67df119a4mr5107306637.39.1785084125253;
        Sun, 26 Jul 2026 09:42:05 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm42934152c88.5.2026.07.26.09.42.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 09:42:04 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mark Brown <broonie@kernel.org>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Subject: Re: linux-next: manual merge of the wireless-next tree with the origin tree
Date: Mon, 27 Jul 2026 00:41:56 +0800
Message-ID: <20260726164156.71624-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <b99e4a1428546030b61883063b9542dd953a69f2.camel@sipsolutions.net>
References: <b99e4a1428546030b61883063b9542dd953a69f2.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 26 Jul 2026 12:33:13 +0200, Johannes Berg wrote:
> But because I don't think (a) we should fix that in the merge, and (b)
> it's actually very important, I'm just going to leave it as
> "notify_driver".

I traced both paths again and I agree with you. Retrying against a broken
AP is the better failure mode than confusing the driver, and the trigger
needs an AP that reports success without an AID Response element, so it is
not worth changing the merge resolution.

> If we actually observe this in practice and want to get rid of the time
> wasting, I guess we could add a path out that does both, but I'm not
> sure it's worth it.

For the record, destroy_assoc_data already does both. Since f13e573ab3f12
moved drv_mgd_complete_tx() into ieee80211_destroy_assoc_data(), that label
notifies the driver before the link is torn down, then abandons. No
additional path would be needed. The impact is negligible either way, so I
agree it is not worth touching now.

Thanks for looking at it.

Zhao
