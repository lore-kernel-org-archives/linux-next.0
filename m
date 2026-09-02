Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B33A7582
	for <linux-next@vger.kernel.org>; Wed,  2 Sep 2026 06:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331956; cv=none; b=rupirs1Qcstrr+IJbRjlawhIXIzk7bCAA+fnBK+CYaFEK/uMhkHBa7uluDZf0IvDChzUN5dtHpTsFLfIbfeTg0mjT7bAR38uB5Jd5wMc0M4nM44y3sL+deahdCpOZTFFe3pUiJCpNe8MHxB8eKW1fkng3iV5/z3OSotje+vhowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331956; c=relaxed/simple;
	bh=SFLNJW3/y68+ywsyqgnt8Epk444+hXcB7QE+xPQLM0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dw9I7B/HbvkuxmjUV3fZtNHlOq/ciskGO+jmK0ZlsjpDTnwQBAXEaUc3L4Pnnh2PQukDFOjK18xHuj2j9U9pzryN1YuMjheAyPJHxurbl8OiJMAG/1Tsw93p0JQfS8w34qyHG9GNp9SpT3+RBOaIzwconj7LVe8t1BHdQmfWeFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRY4/6G7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRY4/6G7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso6381265e9.0
        for <linux-next@vger.kernel.org>; Tue, 01 Sep 2026 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331946; x=1788936746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn4PAkw0tahIVVTtwzVrKulou125O66ZpuD5FdtR8Zg=;
        b=bRY4/6G7ht49TB7j8RLlE0tMoT8BuZvTf/cPgX2EGAyxjEma51qWv1M1fMwi781NXf
         xdfvGTV9iMtpg4EcrGsn04/GQjUnxt2pSD+4XV40OpYyLWkp9rRLmzUSgAnxd3Pz4j+q
         IOLNFVOtzfeP/KDwg7VkEWgrhg6yhVpFYMm/VQrCeBAN9Xv6SgNpm3rYCxs1HVqxbo3E
         XLFUcaz4rZC9bfzLqGgU9/NweHRK9zKhrMmjc6bLFGgIIeC6xHTJ8jUv9lXfdQtWmgl8
         ZAduUsSJBqBzZZLDlPYA374aRindxihIVr30zkmgO31yBW+dPbhBEdVu++2TjjbfNR5f
         J7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331946; x=1788936746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xn4PAkw0tahIVVTtwzVrKulou125O66ZpuD5FdtR8Zg=;
        b=pVbSENenR4ikZYykkj295YlU8ckH5IH2BVaXWGnw1JL1xemx7O5LBGzvmD4+LRpsoU
         INb0QGTaFe2f+QpDoZ69dItXx7mw1t5+VJxPeLYa8tzfWsR1+DN9omvEKXdqLNnVtkP1
         hcAz2sDYejYnZrBt7wWzCJWGYaDlQqCGt4dDpnBzfg7nOcTXwsRev3hhWS4gUhqfNgzk
         oL8Y/T/qgCk/9hbLOZT+xQyJlUGKnYoEM0/4SD3Dr7mzptOOw98efTHCbgb5BoIeaL9i
         3JYPGeETz+JgrC2rrWPsVG4ehkqXwCnr1c9KNiopdEZpr9RoO8/U5pWzmC65c/V16uZE
         pbeg==
X-Forwarded-Encrypted: i=1; AHgh+RrjOFUbUJVBSe72n87G+2rmesGMhcURH1tB0nMMqgqwaZRf2N500IrevKtW1Rv6IdD+w4luE4qf/sIp@vger.kernel.org
X-Gm-Message-State: AFuF++mJNdLQ3IPSif4R7u2tM06VZmeYYTnLL2aEznNmlh62fQrFP6iM
	Eu4NYFenRZ8DXN9Mvu9j9EFdYA4MZjBF0sfYCyLIaBERaPYbV6Ws7f18
X-Gm-Gg: AR+sD12bPlakuJJ+dkOyFPh+iPGE1vn+RFK1pDqCDSdxDAs3tcFGx4YlghVB/sm0387
	h8ta2a+nbVGJMm9ETBOwiNSI71yeWA1ybHEV8DBi3J4nDbbipiMmU1AVKXK1F/qzv4l08WN/z4s
	jaLxxLkhun/t2Rz533IuvvuDpSmO2VTMvbj11GIehoDNx/zJ84Ou7Alrpek1cUBTq3BCPY8QZuF
	TxBPrXouZyrQJAtp7/dUJx7hQow1faYlQARd3kjbqdP8E914viqIqwMj+bD2eyFM1qL3SlBL2YV
	9amKthdIqOFzC7dgIlJxCROHetUuEikplWPHJE3yBfObUaw3V630S9DTvY9hT2jdv4waq6pxO9w
	Ys9DR0vlfMKu/wIRzRDuILDA167ibodvxpdis6DgLZZBs0hA7TZE350og3C5CIoGDxeZMdHoKJH
	69Olozvohz6ZZdLzkZjV9kKbfzDj/nOwaBOSOABngAXHIgJQYBZFvce0+IUj4/eKemZT1/PyA30
	g==
X-Received: by 2002:a05:600c:3f0b:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49ce7c316aemr13532185e9.8.1788331945999;
        Tue, 01 Sep 2026 23:52:25 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm123486195e9.5.2026.09.01.23.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:52:25 -0700 (PDT)
Message-ID: <3cd2c640-3ce8-4163-9f7b-3abba46ae072@gmail.com>
Date: Wed, 2 Sep 2026 09:52:24 +0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <apbbvQSfUbzYRFaw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1.09.26 г. 17:05 ч., Mark Brown wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
>    408 |         ad->card = card;
>        |         ~~  ^
> 
> Caused by commit
> 
>     699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI codec)
> 
> I have used the tree from next-20260831 instead.

This seems to be due to an interaction between two patches:
1. 9af2c1d4f847 (ASoC: ti: omap-hdmi: remove unused *card) / 
875e906efdc4 (ASoC: ti: preparation for Card capsuling)
2. 699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI 
codec)

Both (1) patches are in the tree and remove the 'card' member from 
struct hdmi_audio_data, while (2) was already in transit. Patch (2) only 
reorders the existing ad->card = card assignment, so it still contains 
that reference:

+	ad->card = card;
+
+	snd_soc_card_set_drvdata(card, ad);
  	ret = devm_snd_soc_register_card(dev, card);
  	if (ret) {
  		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
  		return ret;
  	}

-	ad->card = card;
-	snd_soc_card_set_drvdata(card, ad);
-
  	dev_set_drvdata(dev, ad);

