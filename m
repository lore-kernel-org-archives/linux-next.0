Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910CB37F31E
	for <linux-next@vger.kernel.org>; Thu,  3 Sep 2026 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408906; cv=pass; b=oh9s3lhItcJkMpT4wXgyU16DzJ3SaD708l5YhsCRkcFPBxXTQdz4RRli3VQ4LMRZZZMYIzGGArF2Y0qDaQn6+RdSZl82F0f9vq7+OZbVLnkuBrYQdaIr1u/NFAoG3aWapAgbCTcBYK7P/dOjb6Zt0YiBViXjPGUc+yZxmhdwOTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408906; c=relaxed/simple;
	bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvKfexPuLl/M0tZQon2LE5hfCQqvqx255MYq57+VK5m7zlX2/iGLcPlMmFgF9iUZeL5+V/CYicH9lbhN8WRTPGp562FUpWnVmSuRJGN6NXRiCqaLACajnirIXtfQiLM+a8Nm8/NjW0LbKi8APV9uxGUXVRbvrGAs1guY1Qq9ZOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9LFUedB; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9LFUedB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8534d507f59so2392205b3a.0
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2026 21:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788408904; cv=none;
        d=google.com; s=arc-20260327;
        b=ZU+TI3Vsh8akg8KUeonFtg0lI1bCYI+rWHznjYLbkJBSQlzLHtZNd7Qm0QkElKJxRx
         whVOpjVUru94Ka7Do2SLzNN7wL8VxK3tyA3dNh0XLzBvSalu4LAL0neqKGihwvKMW6ch
         Zr3PTvvK1/Pc7/1tfpSmIMOQ4xa9Kro+R+KGNAnicEHRRuyvlbrJEw04dLsniww65mcw
         LEr3xzYDcUfbAlkvaiogG8YghyWxT+GoF9TnoOUMLnZEKW362JQ5uYS4bVTOsL+dOHYD
         I8W7NOYWH+0gq4DOXGEkdaLACYjyUijJZulgJzI5f2I5WT6brZIcwnoaNCX2V/8VF3n6
         PinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        fh=JwDCpRQAKFINjyaciMCmo2phYYDwj65L3khxHdtSbrc=;
        b=WWUWT8GUWj58Cokgol8LJxreM5mZcwpW4p/JKjeciHT5hR/2wbbK0UrlARcqt0lzG6
         FyVGcvBpJ7OhQG+CSNXzc1gUPKjwjd+bEooQWkcENVU8T0ooWEAEZ0t4zztnRiMn/RFN
         DvByJHQbpDNXhXbpMYQkmMwU0mAOePDUfZszfSl7Id8qnfBNzKE1plZvwGzyDbMBFsEO
         cwoU69LCwvkkr+/BvxK8+mgq5AfZIcqfVWb2IsAijHPwj6ey9sh1XqKeCTpy/RMSOEMP
         rgdManKqAnXkuYKN3n2l839I9mkxUUhKhhW2Prup0Ku/EM7Lfeetc8fnIlo5T4YV4fSt
         iEtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788408904; x=1789013704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=f9LFUedBAQgroo545PFYs7yYkfn+d/YqcmRHCbFtOj6Flp8IRA1m2E03JxSIJ1hkMO
         uI+XqK5Zc7xT5idotqW6vwkr6nBsAkYxRI/x2f3SZtBPyu/JZIjpiUj63r1vrXacKjP5
         DVkNYIxDOjKb/V9mWvNA96zijOcmcKIQAGMrk09X2ZBNynAPsSmrU5MxLlXz3k07p0io
         dKy2fUdhDSw/OJ3WWK/99GIKmLNR+Ion/TDQTTZRZSgEB3B6P6r4NfMDO2LttKgs4oAO
         ZzL6BEq/WarE9w74sDLE86ATOoTxvrxoy0KlUkB8/e3AlhSMGru+3rb+RJTHfmEbRxyj
         Fubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788408904; x=1789013704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/CdnSkAI/SEeFBhKT8eXTMpB/EwyptIYnhSh6zIHjt0=;
        b=mt/rN0tvdim4BZucr43TscebaznGCmI7yR8RauG63whP9gH5AdCgJ3e0qLJIqMeDeW
         b2T+WIKPg66rjmD03PKH+q8RrM42nH38E3mnrnQsx8Xust7Wb7gPrtuKErhEHDf09I9X
         CwmJ1o4izUgCWaG0jMgYtzleU+3p8qUv48GoH272fzYmxJESEoxA8UJGndNP6+HFbCr9
         TpjT8Sx/uZp7KdqvE1XCYUdi6Z/zkzx/sbNoegdN6pz76U5KLII1vrMHemA+mk7fGgvG
         N/S9ojoQiYunvCo60pbsy9Sk2v2sdb+FM3GMoYb+Hv6dQxyBkgMMasLcAeaF1dvY5nyz
         ARjA==
X-Forwarded-Encrypted: i=1; AKwUvBylgRme1P8JHxq3HOKvQwhjprPKEfllkc+rKrFOp44nNYUp71KqosCmnR5kWB6+7izeWEfg6gbUxhFD@vger.kernel.org
X-Gm-Message-State: AFuF++kpk6QbcaVKr646BKDfp+qhEDSTmnJG5mptljwaUaynbsF/CrIg
	Xjj2kiVVh7vG82kC0K12A99XDg1eXyexaf2+PYkV2rcS76+c34Fja4Sg3UG9/HQCzGq5DDO6ZYU
	XaBd+/M79J7L4UHiPG0pyMsxVmPp3ZIJ+5bjw
X-Gm-Gg: AYBFou0BRWzQgbdSqKRpkCegVr8uYaC5Mk1OLsS0hbz55ApBDr1walUHoKQxNpZXabA
	wcrticdcGse7dH/0AB96fWuyBv00JpArTOkHHUkrv2xE5TySAMAHGZMdhzmycn3PctRD8NEddij
	zlA9JYARKZ/AGV7FUImpj1zgdH5NoiWMVilozg2HeKerNYa0m96M4duBnJ+b+Za8Sqh58YQLyTN
	D8a3xYQMUiPVK2ednP5eVeaxgPTZvtQmFZCk7bpHOEg5ACVg/RrbgGh873ZU4PCBzHUe6wVfaBa
	kj4KosWivybBGV1abHnvQNBfdwxOCCslPtepXb7GPEZHtUrnf0gV6CJJFm+zeoNk9SlycOtzZs4
	PUOM/khX4UGujS/g9Ez501RFzFNbaGRwLc7K1/M5CIdMQ6DYO9RqKv5YQ
X-Received: by 2002:a05:6a00:23c1:b0:848:62ab:7b7 with SMTP id
 d2e1a72fcca58-85ed93bfe5dmr11990726b3a.16.1788408903612; Wed, 02 Sep 2026
 21:15:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apgNYDiSiPmNZspF@sirena.org.uk> <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
In-Reply-To: <CAABR9nFEbNxQ_oWCvZobOJnmCBdhAdTYfrm=sMzygh28CMFFtA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 3 Sep 2026 11:14:51 +0700
X-Gm-Features: AcwNN1UMURtyEGzADFhhZXlM-8xROk25l_3NLc5C7-jyAaxvLqbjAJcXuOLei6Q
Message-ID: <CAABR9nG4f=3wjoXh7FYLs7R3T1N-wRtPD=UrfPJmuZnhjBf6GA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have sent a fix for this issue:

https://lore.kernel.org/all/20260903030700.132068-1-phucduc.bui@gmail.com/

The patch is based on brgl/gpio/for-next.

Best regards,
Phuc
