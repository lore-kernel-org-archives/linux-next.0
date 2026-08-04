Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A4382373
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844134; cv=pass; b=CelSzxFvDbiL9wx3qmUiwBXsDHg0hp6vlds/loUmMFt9iegT+h2lpvRdwxElpjopHHidT+vG0ZvRUZOQSiEMomo/ugTZkyoNFtZhxfv8Q0uhAIRC6uN2dzB7PNVNagLpjNmu7463RusP845wNRnj/DMwmUbXKoBbxzJ5WGqXiiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844134; c=relaxed/simple;
	bh=65TT/dPkm2NZ+PuaNpQxI81g6FdsLLnvwtWAD7UEIf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=od8u4yTpbX+LltORuf8ezsZRI9g4b7V8crym0vmqTGZxRmHSK9+BIuF1r//oQDTxqOrFxee0+dhd0fj0IwNdqWuUH+LewuQZIyZFR7W+cEe41eNBO1ESxzASh3uStGgXgJ3u5Zjie5mrd6k7CxRymrNH1nAnTziO4hvVPF9l4cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=hXFuACZ1; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="hXFuACZ1"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CJHX3821935
	for <linux-next@vger.kernel.org>; Tue, 4 Aug 2026 04:48:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=65TT/dPkm2NZ+PuaNpQxI81g6FdsLLnvwtWAD
	7UEIf8=; b=hXFuACZ1nwXRtHCgMUC87yZzR/h9M406TVUECjOiSTD1KAM6pPL5e
	JYQKeK34a6qIe9IdK+GROLJZifxySzSIhr7G5KwuxfcPGp2Uw2cD5MnPIoN74/97
	7dAKqCUv2tbRgNGzP0MQGjNzi6sR75/daO+3fxbRP3tvmbSbYrf4SnxSVXyazYaM
	+3DF1UtQU+CLTja86imlB0QIYXbTgosDCqZ9HSzRNCulObmqnQk8OspZ0+WuBLUW
	w33cJ/QSPRnDTFc86JdAHU5Lty+/uJggXsWih3INrEYN7bMAi2Sk9DPERJ8VyZ16
	jIOg1Iojl/aHBc2mv5GZjKOM86MsRLD+g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsehf91qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 04:48:52 -0700 (PDT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-82014436716so6395637b3.1
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 04:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785844131; cv=none;
        d=google.com; s=arc-20260327;
        b=ffNRibP5/QBZBdCDyw3CUwUvgT8AsiKf5CcHv+1NYalVgoKUQz0I41rxxeWpXPMSP4
         3xwQoKrNdlq6g4eefcwkmH8x5Fvh4oZKd0YPrP8Yax99yzJhhQ+m8/6dIBQqgGN7akfT
         nmMLiDNQNv7IkwnA/3+ClfnoGjCICOxxlAbsIsijomlZY1bJlBpWehI/Y3PrUG5FXFeC
         Jta93S3SplL0n5rJ8kSgUpJcxUl4hIg55alu4skdSb9V0va+aHIsJcHAeV2z2m7eH/VA
         TDCkB8fzkq2F0CK9aYllHyELgsgK1U86SmS1/orK0oFkGE29AvHulSl5xdJ4lFEGhwO5
         f7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=65TT/dPkm2NZ+PuaNpQxI81g6FdsLLnvwtWAD7UEIf8=;
        fh=CYXJJmHjpUU4W+ov//mxn352JVHBBWJCqaeGU6U95dY=;
        b=Yx6xgeHnfWQRwZ/xewzHkJpMOZnDOwFLqUYzOXNBm9h22CEIeRn9IaeYGESjtnqwLR
         29CdeFUG84sR+BQat6UNKgbCNhMBMItLRj8S0T3dqIbCUYxjFH3Erbr4uS9+T2AHFdTk
         iMoydDincovzFjG1sLrlVj1a0xgcAL8PQ9funFEWA/I3niQlyld9nkksqV2+iBbz9oat
         Mq6sgOdQgx4Y5hadzQFPY3bODxW4HhhPrx6Fdwq1SPxii0VqTXmurA3n8IxhZI7lx3/k
         2az71Xz6L62dpfp2GC/kWIgNASdpTU49rojw/hPBRY7b/iEaIzD6ZyYUD2NvlwaH+5Io
         86Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844131; x=1786448931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65TT/dPkm2NZ+PuaNpQxI81g6FdsLLnvwtWAD7UEIf8=;
        b=ftjZsGX4g0LyuOzEVCBNBAmrSbVA19gLXiFBi6jWD1PvF6r+aD5fbLvRn8xGjxuYVk
         fghw0vP6A74UHSv82+Qtnf7lmIkj2jS4cOphqu+ppniP0wW5CowCVc0CHCqquUHAaK18
         AkcmjwiOoZFdSsMUenWT8RTp5/SZG/6PFQOOM8y2yU/xTCJDEhf9WGTqP0Z0CCvmg4VW
         MlNFVovtxj4BYvWj+IeIhNlqQr9f4Wpf2peMP6sQBCZWbq+eSc8DE32n3wVCxu5NFHWa
         8lS+JcuBPSRViXYf4qTEo/pEBZtZRNrop7uitHYHLHUDuVL56FwqVqw66BuArSoKff3e
         ggkA==
X-Forwarded-Encrypted: i=1; AHgh+RpzV/qRtB1Az46biqIn9s25i/1YamPNYj6VSoyMg7NRBroDp1FEbRJhLrCS0jxVbRkaLeKxQfuXxK71@vger.kernel.org
X-Gm-Message-State: AOJu0YxQRmydIVJrHRD0UkKP5LH67t+KQoHPQsuoLJoNIfEyiuIbA0q2
	wYhaSyuMRMbP9vY5ILmQPYZAXzN41Imk4oWakQ98ZZ+aIegqQZtKdjPcnazO2Y0ET6yYXzjMZsO
	VZWwDehknee6KVFwvBLsTQaqOhKzrfEuqFpflMtpXjZ8ChSqDDnP02pT7+1Fsf082J8YkYecQs0
	dr/83iiMWgPFgSLeTxnqR5LtMBXr0JqfqA31V9Jf+ubKWDa6Q=
X-Gm-Gg: AR+sD124ok3om+sBQxkqO0cOMh/pjxBmqsOOEWWlu+22Z4n2kFq5GcJKKku+n7T2euI
	CsRp9Sf4n221MgaOpeBGNlNm39Tp7nr28IybNj9OkcYkwkL9q0bnlS3PNFid+zCuQ1pHXVNQm+M
	Ton24bnKbiRp8KAvVsZaUNdX8AqtD5JXHsVVKEU0Mrb3kc2OFdnMS96plVJUno6gGWEP4SEsgnc
	kEYKJTyZrKIzHWVFnE=
X-Received: by 2002:a05:690c:6302:b0:820:ddd:6f1e with SMTP id 00721157ae682-8200ddd8078mr20288197b3.36.1785844131451;
        Tue, 04 Aug 2026 04:48:51 -0700 (PDT)
X-Received: by 2002:a05:690c:6302:b0:820:ddd:6f1e with SMTP id
 00721157ae682-8200ddd8078mr20287867b3.36.1785844130998; Tue, 04 Aug 2026
 04:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
 <ff3c03f5-fac1-49e2-be18-66f5ff773596@sirena.org.uk> <CAFsYEO+soZiSo6RoYhmby_ydEAfSri48FKivj8ndbJV-8JDEAw@mail.gmail.com>
In-Reply-To: <CAFsYEO+soZiSo6RoYhmby_ydEAfSri48FKivj8ndbJV-8JDEAw@mail.gmail.com>
From: Mykyta Yatsenko <yatsenko@meta.com>
Date: Tue, 4 Aug 2026 12:48:37 +0100
X-Gm-Features: AUfX_mzqGBOjW_jUw50kdqq1VEiiC9-FDPsNSfOHVPLb1NP-IrttGy2xS1CvBjs
Message-ID: <CAFsYEOKG7=Os-jLadKF2pcfb9Thh20e9HhOvU288fhkBHziLGw@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com,
        "mykyta.yatsenko5@gmail.com" <mykyta.yatsenko5@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NCBTYWx0ZWRfX6gc6j6hFl3wm
 oWkE7IcUz6iO7YBEGvjomVAntxryCgOrom/1W9tzAPrvZgX9//mBQJ0lNCz4XTfmb9eSvJHEDSE
 SxZ95HMT56vVa8LYubfc9Qj/ahnEwUindWE02Qe+IrnrGPm3bhQ8Gni6WuMeQ7Do6OC0UIFFcNK
 wU9XKJ8zU3WgW9hGqBbmH9aavuEe5pykw5s/tojWIfMz1Ps6MqpxF73OyMRjVU9FRtbpc/XG1dZ
 WgopAA2VguAboXYqm23SCVWGFCay3i/ZDMtc4aXrpZKb/rMNl42HBqKMvkvn6OzfXzTz6OrMVb2
 Kzt8m6DmJqyOrbZ86E/zykxX2CEho/XVPQXHOMEvNZU0008T1eAt7u83au/7gQcwIeX61kyv9wC
 rQ02Q1WdRfGitXxcZfyXyCEcDALSo6bHgDfsilPsQteNuk4mqp/k6373bgl3jT1bYsKo0vo7iv5
 laBbavn9NWMaiW27OJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NCBTYWx0ZWRfX05XYqpAyZka4
 NkcS/QlvdZvSv8tZPFSGr3FvRY6ay/wFdFelfkKbI/yHScF0vw6SmgGaDvPyj1S4zOW9RaAkKTE
 k09MmnPSKDvG+27hL/8F59HgpLrjFZ8=
X-Proofpoint-ORIG-GUID: Q1zMLegdAPv_O4IPNOLn2U9-EgBNqdCH
X-Proofpoint-GUID: Q1zMLegdAPv_O4IPNOLn2U9-EgBNqdCH
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a71d1a4 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=QigyTNs3V8I_mNJ-ux0A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01

On Tue, Aug 4, 2026 at 12:35=E2=80=AFPM Mykyta Yatsenko <yatsenko@meta.com>=
 wrote:
>
> On Mon, Aug 3, 2026 at 5:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > On Wed, Jul 29, 2026 at 04:34:28PM +0100, Mark Brown wrote:
> > > Hi all,
> > >
> > > After in the final build, today's linux-next build (arm64 allyesconfi=
g)
> > > failed like this:
> > >
> > > ld: drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x40): multi=
ple definition of `__bpf_trace_btf_ids_dev_reg_evt'; drivers/net/wireless/m=
ediatek/mt76/trace.o:(.bss+0x80): first defined here
> > > ld: drivers/media/platform/nvidia/tegra-vde/vde.o:(.bss+0x180): multi=
ple definition of `__bpf_trace_btf_ids_register_access'; drivers/gpu/drm/te=
gra/trace.o:(.bss+0x0): first defined here
> >
> > This issue is still present today.
>
> My fix for the issue:
> https://lore.kernel.org/all/20260730-b4-fix_btf_tracefs-v2-1-6b66da8dc103=
@meta.com/
> Steven, did you get a chance to look at it?

It looks like Steven is on vacation, I'm adding Masami and Mathieu to
the thread.
