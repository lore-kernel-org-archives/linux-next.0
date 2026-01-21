Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8846047ECE8
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990048; cv=pass; b=bBpucUUJmLSIbjiUlReeF73QJLC+HwibqORWCaKIy7iz58u4SAG4pzcxo84latowsvb6bU5eA3SauhWBF4mAYJPyGa4ixpzDGw80lNjDRuyfjzsPV9SXmC7+oumIAwFIfg+7Ta+BLgDng8tdOaCH3rybTkrhbRz8NbHM9Y5/tMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990048; c=relaxed/simple;
	bh=64P3afR2xMWfrPDCKoO6VKBycg6cYnEgcUv755uGP+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHlJzIzOypYGGJyZaa+jExvsWmvZEH7JvxGBmqOdvdwCxMt30Al8LSC/sVFxUcSIVNx9l3Fvxp+EQy0ZjAQKwNF36trjMeMNVg5Ojz01QJqVjWeo5dREUXa7xxUPPIexKp2ZcEZBVA++S4/wkHDiVPWEAmozKr+asXz2nJU7IhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOB5+Tr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkzgJnRe; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOB5+Tr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkzgJnRe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9j1ua2840557
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq8XN0geTsl35uvZ13O5wVAoDHJO2PWvZykLWCL899Y=; b=SOB5+Tr5tkIq0iQ9
	6UHbozJFYBAsnfeBHJQ8iSC/7EFzu4zleNJtXhq4neko5WjswbsBb2kLmnPjcCbO
	Q8BzcSSOLFJXT5P/l5Ii0BWVGAWFqV4wEgFkG/8IWo+/SKiRB6H0Ju4FQ8GS+sgF
	Fvrxzzl69veNFksM0OiOLfZseZ3A/CYd/f3ZZPyLwqQc/KTWXDrLLBlMMC9Hz9kZ
	lNe8KBhUYGJ+eRFJy/KflzZCuo0LaVOG92zKlWu/emkwqRZGK4G9nteFWamSs4VY
	oyR9sndkvzRlFEWWUaTNVXNnGWJiUh1bSAxR3Opcval6afFbmoX68tio2X7+s8ZY
	mThH0A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1sghb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 10:07:26 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-790afc07667so71290527b3.0
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2026 02:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768990046; cv=none;
        d=google.com; s=arc-20240605;
        b=i7/YMAVpq/3kp/qWStLpkPSAMGVJi42QSvQuJXyZn3kuzifIpoG4KygUsAh7BsEafJ
         TgiaCLbzU/Uwh01vYUrddrIbtlreFboycLqHw5FVEVF+MHBbDPL4p+DPjRv/fCcXG/Zm
         FJHTCfLOSd7H57hilA9o6GhAtrcOCHwRyZ9PRs5NEWUnECwlscwTey4tmdDxcACOMM7b
         JkQe+EMkepgjm77I3bwBftAjxUl4EI+zJNrhz++D2H5A6ZFHbmXRUvyIxr8HpFBFylyp
         1JFNEC3y1BLGrLW+dSwCIAFzjYuJLzDf6Xtc8YF590Llj6g06NvjW0wOsS4W6PYJhlRR
         pdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qq8XN0geTsl35uvZ13O5wVAoDHJO2PWvZykLWCL899Y=;
        fh=4vciY26RL3R+jt9UmuBuKahwhV1U7mszmjkOlcg4mzo=;
        b=Q+uWf3KobMqVhi6TuIhm4Lj1NsHeY6BfjI/r+Zhr2vMvoTpumpYF5F3yEcaK9jPxUn
         7pVBxP7qoqBfVu3/L3RrcNlFOfShfGGRrPuBhaTCIqhODth/GWgVtP9impUsmeR6vws/
         OkWUu4X+ajuqcuLGONuRk8giw9o7dPCBzGBvlqMG/Vphsa1DfCgfuTQ+VPuzfHvvPU4Z
         YbeVhI/58gP3vsDnUtZuf02mPNQhrztmkfyqSr+9gSNi+VG4Sd3ODhSSshHz41dLr7S3
         1TCFCoxiOTmPXLfnvzi0aLtbtM7BpCwOwGFa9K3axIN6oQ2eUY4VEycByy5mjVRNY7/Y
         TrPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990046; x=1769594846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq8XN0geTsl35uvZ13O5wVAoDHJO2PWvZykLWCL899Y=;
        b=hkzgJnReAYdSizSelUfSIWDsFzgxcIPDBtKOtYxUyWMUm/YkmbDIePK6j8S6jhRY1u
         bq+ALK1wwaB09Q5EvvBH6tuqxPD2KxHMxR9+SbgQ9Gf/naMf9SAVrAHGr3QHqbRFWDeJ
         m9hB1/O+1BrnYxqcGV3iEg/y0f8DwL74D2qOE9s5EJhJM8JhmZk5aj3uZrFbzClz4J9+
         RINxcL76n6sSb3QFicXXTUdXzFLDFvs4JetgLs8JLthlZ+Ely0yTFer3VnwkLw4iEEA+
         oj3+XeCuhkv3dajicIevG/RzksKKKXNZlDCygjdhHKMni6a//rBJdURT604ZNhCDUrkv
         ofgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990046; x=1769594846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qq8XN0geTsl35uvZ13O5wVAoDHJO2PWvZykLWCL899Y=;
        b=qHZ8D6qa/kSUBV/U87ckuzqTCDBY4BduNfKS8jLRqWDXxOTHxDte2E9amjKfkbTahr
         LG4kHe8gP1i3272FRXuOzc+SJVkIw3lzhZyyrSwf8PL652l9+gGL38Vj6NKE2xzfzIFg
         i0JKSHQMrLQ4rcPjgeccNcpyPdaEfQaskC1fEH7S5ZDLcgOBIWNh7WGJTQMkcVqFApM3
         x5LOoQa70LrVHnX9qwhQjJegD3WcwUaLgSkHEtQmJo3CqIzEIqifJoUAGU+3IRKYMf2y
         UlMEIhSpehs3iESrcrFe0GD5ESsz1oCWq+e5irM9P++W9WEXe8zN5Eq6OuD1PafyJ/bL
         QZSg==
X-Forwarded-Encrypted: i=1; AJvYcCVgZ0Yv4DR1JBAHJ0Uj9s2IHJI+jhMN5Ugzj9i8qlQ19Yb9MQSyKN+yRHlR9ic/qvyV4+mZiitNVFmK@vger.kernel.org
X-Gm-Message-State: AOJu0YxI4xCRgqiL7ehBkUV02s9SgZx/vudyuOh9n9uEwlphoD8mfHtI
	wNmdrq83zGE4yfINamQetBE2zgU1cFrNMSKPm0gRTVeCYiJB+rM6eOT4BDhHp0bB3SbyYdqtLzF
	US9iXZJsjKxjEWMMsFhdlmDSx5WawXCMmGmkrI6Aw6uk87bcmw4HWyZeInwtoBiaDeN7s2NW7+2
	W8cyHZfCxb3xXVi0JcAY3Y3lDLHbqhF49Q+6ZBfuY=
X-Gm-Gg: AZuq6aIHmLJ9XmheCX+0OyBW9Y9NUPnAT97VlS5EL9KpzE51Uf8oJA0Yu9pljBS2dE0
	LBtMxUzfm4o2PxspITrPpKfmgQrk5fh8lOmP57UizlXbBa699oCW9J3K/nbph+NvuGqp8YrfP+U
	X1CDWCor2togDvNCgfRdA1eIQ3oTLY4rjB1TnlJDx2jFhd14ll6RYS/eUUmaHiiEFkNQNU5z0Tc
	XKVpSu1Wt3RRV2seGneJWZv8w==
X-Received: by 2002:a53:d684:0:b0:647:108c:141 with SMTP id 956f58d0204a3-649164cd92fmr11548702d50.56.1768990045901;
        Wed, 21 Jan 2026 02:07:25 -0800 (PST)
X-Received: by 2002:a53:d684:0:b0:647:108c:141 with SMTP id
 956f58d0204a3-649164cd92fmr11548688d50.56.1768990045465; Wed, 21 Jan 2026
 02:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW-Mur4VZrCg5gjM@sirena.org.uk> <df03ebc9-57fd-437d-9fe8-d8e4ea8f3685@sirena.org.uk>
In-Reply-To: <df03ebc9-57fd-437d-9fe8-d8e4ea8f3685@sirena.org.uk>
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:07:14 +0100
X-Gm-Features: AZwV_QjTX-m7EymvjLIQpcI9FRdTUM7dMRf3K1m4THy0mSr9VMijNdIbkZa4734
Message-ID: <CAESzEGiz0aCTBYYCOnwd02R-s4WO8XwCpwisTaUxOp-EFkXU=A@mail.gmail.com>
Subject: Re: Missing signoff in the at24 tree
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NCBTYWx0ZWRfX8lmC0eq8TDIc
 f61y/nl9RM0EkVAbcq2WdrmulGMIBEOW7IuK+kLuQPCMB+NcVV+oPb7PeWzc5qGDQ+gFQpojMIA
 OCfc8se/H/qSjScWqdpKG2CgipQkHDhLdbIkGafcV5Y8LkPEUk+dIbq8+Gajz121eL1ZVx7T2Ok
 G6eQS2oNOEH8RvvnR6hbLIf5WkTm17+GPTD8lHmiEV1MHFSK5PJ8Gp3tB7xvVgEbHEcOJlDPhTT
 7yhOJIusIB/Xc2GH/uWPta+ZxsAkIzsY1vUxUyvbp1/KFGkwpZHTvO+IVFih8ookTp3oRRTRTF9
 Sd16nVYvXM1NbgSoEKHNkfYVwDOUlJM/ui3NIfdtAdxuHXJ8EBcxqTWFliZZxNTg1ex6vanYwrZ
 9IxGAYLFhSF18gidk/DXyLc25cdkGskJ7mzCaaXtd3IqWyCPQBN+swvM2ZkfmGzUlCYwZvZHwYs
 VaL2V5K/ScybuRu7vBA==
X-Proofpoint-ORIG-GUID: ME97xV9zWeli9Qd-uj3ptWmRvG-K1Mca
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=6970a55e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=afUWiLUx_X28PS8l7bEA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: ME97xV9zWeli9Qd-uj3ptWmRvG-K1Mca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210084

On Tue, Jan 20, 2026 at 3:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 02:10:02PM +0000, Mark Brown wrote:
> > Commit
> >
> >   c6e79d34bf80c ("dt-bindings: eeprom: at24: Add compatible for Puya P2=
4C128F")
> >
> > is missing a Signed-off-by from its committer
>
> Fixing up Bartosz's mail address.

Now fixed, sorry.

Bartosz
