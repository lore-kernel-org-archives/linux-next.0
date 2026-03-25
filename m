Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731A27380A
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.135.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465757; cv=pass; b=tfdiVQSfU9HCWjqR/F/7KvFpVLCIFcgWlwvs9STxSyXYP1kOFK16x/grl9rVq1lZpMC0LpYbqKvnV/xXvgIv9HGP5qAWGSFfW3xe2o630vOjwxK6660KUqRQ2H0btkc4/WvMDdrIa/9ZTXyzbJI75rYzPlbp9fpBoZDcyNKdPs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465757; c=relaxed/simple;
	bh=24jRlkMK0/onhubFCI6980Bvru7mFOxVMXrwmJVNfVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G60+vrTZkVquLi6ua4kuGFfrLHWzVoqsRsHkbJOjdvOv43XY/Qdvrmivq1wPhW2zGegfbWd4Io5qzMAZuphfq+9cRjYGYTUJ9n0NzjT/UaJsxX+r2vmUCwzLACUNgNc9IqqkUZOZYj5GuGGNfcJ9VEoBzEqkTihtSdZqmkgl0m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ThXYDY97; arc=pass smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ThXYDY97"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PIZYYW2175397
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 14:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KEke
	bpoisVvs9fbYHMnSX9Ein5FICiMvX10axCo17gw=; b=ThXYDY97hQFS1F+lcD6Q
	kgIvNMmfXVlABCeePIsoxPe0FWq2d9b9mkmZaGflM6xiq4ASUqwXQkAAYRyN4oGb
	NChLbpRMuSdETGK75c5mb/VpyY8fT04uIuU3QD6G3+bKcTtr2WMoYU60zGlbxmC8
	fy/Da57qYaE0rmACwvIIUQQUjvMudrUBpZft90E6yu97kTasFGgPy26xl/zbhf4W
	cxX83TJU7YB8gPL85YazNvKlY5kjjWadnChAa0l8h224Ltb57DE8JHo5PUsLou2X
	aSf3SU0pk8BydYc65CymIgGLSiJXU72E8g3y6ap2trDXAd+NEaHU8Wabt0cr9oPs
	bQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4d4gcvb5xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 14:40:27 -0400 (EDT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7982c3b7da7so5607127b3.1
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2026 11:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774464027; cv=none;
        d=google.com; s=arc-20240605;
        b=bwYlZsoXJl7ezP8aTP/xKXK6cU7cX10bVQHWm6NHK6rmCRa/oE1HGCWvHrsXlHnmyP
         nCwM/1h+9VwaCzw0q7rsqPPAE/tO9ygfAtHaT4Gbp/2ldH2QkvadSAulid2Rx3/vZQb1
         sbJhgp7OsT2y4qI/8fuWYTUlNfpf8SVw3v7rpuFj6g0nqaS79JOYC3jEYQvMOwtpX2QR
         KSRa5fgCGQ0IgCzxvLwarUCcxPjat00a0ELQIFxrMbLzxZi2JS2WzRI9fr43LCD3WktS
         OpiOu5p4IFMIViaWea36hWaPf/auPgk70TJmdWWMqlfby/mC43B0zIEWkl4hAe4kriO1
         wwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=KEkebpoisVvs9fbYHMnSX9Ein5FICiMvX10axCo17gw=;
        fh=XIR+eNckn2rpOQVeBLfFw4hPP8B4mUjtbZ7WoV9Vvbw=;
        b=IE/Fxzp9J3B9T2VXBvJejtTmP+B0eoZQ06HmeP52Et/JEEhZxUp0yd61Gd7qkttHaW
         GanGFk8FgvpFdyApWDB7e5GjmjIWXw1wYfAaH8I2mxo4ZXQyhflIzJqESkGhssvO45N9
         Fj+VfF5GAshyJEbBCzHLEX53+rIuedYtLI/zfqh9KhpDGSacKQwZNZ8oDR4khIeCB4sk
         1/M1ehlP9QuT/h6TH08COg0aZe7cYuE5TdAJbp3IFDazHJCRttFbbFCkfMfIT8RuVyWo
         3C5ym1ymbEpXCi4aOsA1cwlHUQJF14haL6N9n48f1axhfhPXUJIwRUh95f2J7sdhugwG
         95ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464027; x=1775068827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KEkebpoisVvs9fbYHMnSX9Ein5FICiMvX10axCo17gw=;
        b=KraXt6gYBWvyq0p/aIprUTAXydijhFvcEu1k6yInbEnIOA9dlDP0m8peySMoMlhbLw
         b8q4G4YBZdIXZUtAgkw+fv0+KMeAQN790Pv/+7aZKWDsliyBNSPtdU2ADqNA+ddDVnpJ
         d+PVkRwVzq89zTtNqgdjuurOJbOuToH4SAT8AopmV5kz6aM+vX9yP+Doi2om0gYtFTvc
         ieLu78lJOuQjK9rA2zBbOGmNtUkFODc4cdppzF6KeGN3rl4zOVb3B9hG8H2vuY2lYo1E
         ByNMsj5ygpIeg5QU9BqjYg4vwMW9tXvY4K4SZRMEUEW9mMLbqV/C6uYPzrzS99KyDe/v
         o0lw==
X-Forwarded-Encrypted: i=1; AJvYcCWi5sHm45bdP/Lojzn+Z40FJSj03MmFum+EHYiJ15abBXSY+qqYMDwCRA/d5+G0BRuDPUCv4scs5AEt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy247oRmY/2K0FWoAZCLLzFapqjaM1hSkGAyNBnZgSpB7rwByne
	7Lm2n5nNG/+bCXpYpA7CzLVp4iMHS8WCeYFF5T51k5Dh1OyBXaFOYM8DsRYdXK7iO6y1oV/k/aH
	m/NTwstw/gzilmR2DgZIUx9hUkrKCrc3PQS0I9I/oxYUGPr2B1PMIdgjH6sk/4za34BqBat075z
	XVjFrVnih7crhgD0UI7xV6egu0XdOQnWJX3Q==
X-Gm-Gg: ATEYQzwhD2wBSoyTYVM0geGfIsthDoc/oRjotgPAYZKzr04KOA4HuwKwP2gwq9CqYbX
	pqXlWSrE+Eyyn8b0MO9vA/49Q5UHGq5IV/u+W5MOBF8i9uwu4zzR3LE8wSVVJa58jfiC0Q8GwTp
	fukAzw1zHjI9cIH0wTzPHbZUzy0i9KiQT1BMiWD13VWYOBMKuZbMD9xSp+Ve0gf0TrKl4eLv7Ql
	MWHN4TX
X-Received: by 2002:a05:690c:4a10:b0:79a:b118:4386 with SMTP id 00721157ae682-79acf728b0dmr45996567b3.48.1774464026941;
        Wed, 25 Mar 2026 11:40:26 -0700 (PDT)
X-Received: by 2002:a05:690c:4a10:b0:79a:b118:4386 with SMTP id
 00721157ae682-79acf728b0dmr45996137b3.48.1774464026279; Wed, 25 Mar 2026
 11:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acPtrrkwagtafDT8@sirena.org.uk>
In-Reply-To: <acPtrrkwagtafDT8@sirena.org.uk>
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Mar 2026 14:40:15 -0400
X-Gm-Features: AQROBzBBmT_gDKBnrGqj4sr13wYIv2mHeKnL0E4WoAULFCGxyEzaoEk2iCr22U8
Message-ID: <CAKha_srZoj2Tk-K4ceserTkH2WH6ewgm2LnEgQPBUDThnwy+vw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm-stable tree
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chao Yu <chao@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zsY5EsPGdyQbrFe6KoAV-PXKe4LJeIOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzNSBTYWx0ZWRfX2vkkDTcr5qgu
 u3v0e0J+aYRf6nGgako4tztV8wqUguwbmCb9pw3znwaMX5PfYkln7HqXrQd5yGx6V8vbLWeXqot
 +E+T20mAskU3dTCkLzGCOUNVAHY+llx73f2E17AjXP1rwIJcVLnE4ulwMXZSm1JOxmGPn2FUIb/
 5CgJDpwQYZCHjNhzu3CrpVDdT9+x0AEt/MvgtmJyZLM8rXpuuBaBRxfsSjckSSoWpGDLHZVytQH
 hj8zLZBYKBhA6YVVYoikk7YW3IPVxydpW3p05Ts2qP26ptEhhixC2yxBcAnDJANaH5HcW8rzmVQ
 dcF5bp1BJIdoX4xNgIXfp1vH/JixH06uxfuKWlRM3BXfh8k4E7C3colJ5bXNkV/VkPNRCfiEwbR
 FfP5V0icuaf9TzMaqGLuDES951vaMcdYkTYWuiSB2Dt6VGHiV/mWL/EbnqS+dVp9/eHZhuHh9W4
 KFeIylI216fhgRKCmdg==
X-Authority-Analysis: v=2.4 cv=Wukm8Nfv c=1 sm=1 tr=0 ts=69c42c1b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=SsB-OO3BMngHh3ZO9fOt:22 a=VwQbUJbxAAAA:8 a=z0KIyXS8W1euCd2lm54A:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: zsY5EsPGdyQbrFe6KoAV-PXKe4LJeIOp
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11740
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=10 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=10 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250135

On Wed, Mar 25, 2026 at 10:14=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> Today's linux-next merge of the fs-next tree got a conflict in:
>
>   fs/f2fs/compress.c
>
> between commit:
>
>   8066a7c76e816 ("folio_batch: rename pagevec.h to folio_batch.h")
>
> from the mm-stable tree and commit:
>
>   d82869456217e ("f2fs: support to report fserror")
>
> from the fs-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc fs/f2fs/compress.c
> index 614e00b8ffdc5,f43ff7ffca60f..0000000000000
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@@ -13,7 -13,8 +13,9 @@@
>   #include <linux/lzo.h>
>   #include <linux/lz4.h>
>   #include <linux/zstd.h>
>  +#include <linux/folio_batch.h>
> + #include <linux/pagevec.h>
> + #include <linux/fserror.h>

This doesn't look right. pagevec.h was renamed to folio_batch.h in
8066a7c76e816 and should no longer exist.
