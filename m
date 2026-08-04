Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBE361940
	for <linux-next@vger.kernel.org>; Tue,  4 Aug 2026 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843315; cv=pass; b=ornVLNGCkcRnkg1wjHuez+/kbPZfUL7WjFtHweJv2vz7IMd8YhBQNP+64a+MqcV1UcgYi4vHCoBCfsZCLtP7EXXIIqcAO6uX75hulnySAHymWrqkQBgn5qui3aFqLyhywlrzHPTxZzZNRC+iBKNN5cnAmpX9nrvlYlldsx5RnP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843315; c=relaxed/simple;
	bh=7IE92bTty2OICVSjCTY56ZZVIT1cIa9QyNsag/YPggc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpGMYUqBkoEFqSKMAWhsdu7OniD/LtywziMQ8CGLrfUb2mZ0x4E3cUaazLfBCvnNnofO+Eo88beVFL6f2zweQBTWNsN+iB9TLRsopEjS9FCfBZRBsa2E6TZKxghLmQRZlLH3Zs1Meb9tztqAgo+PDjUWntKLuPkg7J/6iRGMJKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=H+33A++O; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="H+33A++O"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748C93E3821365
	for <linux-next@vger.kernel.org>; Tue, 4 Aug 2026 04:35:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=7IE92bTty2OICVSjCTY56ZZVIT1cIa9QyNsag
	/YPggc=; b=H+33A++O0zNWK2w2eMe/OKt8OeZgubzTHoBHBpKVgChj3zh8cnbyB
	xc266pxURNXKkj3MpJ27yidW0b3BSKtl+rPIAdRJMDmmC/60tcAnzTkFqPS+iU2K
	qiVVEE4zoQKLRbxeyIkbE+7qqDWrfwPqINzJpfU/hb8f6GEXP8YNq6iQGqK5rJaB
	YZo8D6HjrcHr9aM3JyrTJYecbRqWiumkKnVUajQ5QjtYXGiziPcvfk4S1oJ1SEal
	nY57taQm1GBEaO+gj1hoclIf9Z6YfVYuS0W+jtXb8eQtsQ0F+jRkSgXCETEsr3i5
	re85qMdK2th/hXmvxEr6kXagGyV+fGZow==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsehf8yx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 04:35:12 -0700 (PDT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81f0b6bb02dso13056967b3.3
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2026 04:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785843312; cv=none;
        d=google.com; s=arc-20260327;
        b=By1e1F2D0H1Ys26/INfl4nZfIdZQ8mltuwyoVeuDLk1x4ydNs5WV33GK61vUWii+sd
         hWRv8fTkkyeOkT9D5cV00sPMzJvmzFQg6oFXobBBzOeiNOrvRa6iKd2TX96mCnuBpC0V
         zWCghnDDzBR0TOAmXBFxJBM6rpKghAp6li5LMD+w+zWi9m4sub5wMsN+KUk94q4bGD+6
         u6k012LsSdd1AAIpGDtTbZMxcN768gJa73Fi8E1OzX163hWenRRE9N8rfLrPp7LOl6FB
         tJqb2ny1t2GzlSsruPzr3bEk0rgtv0VuzerUI+VqLQezIOXLLCQab/qsf7MhYIQmXQPP
         apDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=7IE92bTty2OICVSjCTY56ZZVIT1cIa9QyNsag/YPggc=;
        fh=+aMmAJpLTNAuzocx74PBu+zPpXg1UO5dWMg9eS2kufI=;
        b=X6+th8/VLfiHPN9XyHvPAq9ZhgmeQPVXY3dmreLwrtRPPCnRvKwGuEA4yOVIZujjVs
         wMJsVyynNpeG/I6hpFpuqGyJKg5XpqW9Pee/XEq0RrJqXM+TlsXg6iEaewHL9EXRry/m
         z7n7AnCjq6ouLEgeC9xvDTkQLNyYbeRZ5FBVs6bHWw3QdyD1/m6Y8qkoT04Z1tL1peyP
         tONoGBD1k3/lKxukQfwr8IDbFlbVWsdVUINjG2+gLDJAes8Rod79UkfravIHe2uyFB6w
         i0tlu1IyjLOl9NUCx01qJN6pjYmTqU58ot0rE+RcfIZR/xwk6T76CgHiaR7yW9y5wR62
         +7Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785843312; x=1786448112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7IE92bTty2OICVSjCTY56ZZVIT1cIa9QyNsag/YPggc=;
        b=Kl+QDljcHl7fhDHAw7LlyVIF86vbbnOGeubvzSw5esaf7sLTMbt6hKBFp0QjK1N5TJ
         KgHx1ZxzB88T086yVFYJ8ub1hFmOUSJob8CwqBtPsOulojN71DExWn9fPgHaHFamFs2y
         rOyl7OaMAxd2a9kK0sF0Q6uL9vLxFYvt6dC1ouZx4twtpp7M8q2WsDJOVxWeW9kdzDk9
         TOjPOhJ9D9SqL+3+lTSbYUol8po5nVb6FC+1FWOu/itJeF/tG9xNtZES0l9xFQTo4dZy
         1jRlSjzH/yEQOMqujPUvn83AbGj0AqE/XaAF4/hw/IeiirYpzQdPyDJ+GnS+kbsoSBkX
         bTfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpexAgcTDo/Jqga5Rz8XiwekQvTabKGLmVqsxpkIRH+mO4G74xrxj33A4t3TTfXvZMg5KQv4saKAgD5@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyo0TH2syZEA7r3SsR4eExDfC722R1GJCqobyqU96q0ciTKhD
	35p8rcDG2dKnBk37uUl/QLo5HwdH/BEBA6MtDeTM1A+afASWk00o1JyiU6138/kwsdO6DNFpwvy
	nDCGaCaRA/JWXaqC7ecfzsmFNdY6KOKISQlWbgn1WzNskdcK+w++C2Th7XiXrQh3ETThe/otNsd
	ChElhES68pkCgmPjEbmuDTY8AeWctDr40uPJfu
X-Gm-Gg: AR+sD12w16UEer0iciGPxXniozIRgvKd6A9/2mRudajMkPJu+TSGBlFswnoC/Up5dGk
	FY5q68fHCoAwJVNhbaxTEEcvBkiX9OA3a8Ou4pVqqcLoGoJ7VCV98QTC2gtolIiO0S2qT1JMfeX
	kK6x4m9v+LUSFrIi7l/rPzQZRtz4CuljsJ5oG0gMgoJGo7UYgpOx4unFaDOfyooPMhQAza1K35d
	Zo8ndqA7AXnqXxp5ow=
X-Received: by 2002:a05:690c:dcb:b0:7ff:1a06:472 with SMTP id 00721157ae682-81fd4a66f00mr172882257b3.4.1785843311773;
        Tue, 04 Aug 2026 04:35:11 -0700 (PDT)
X-Received: by 2002:a05:690c:dcb:b0:7ff:1a06:472 with SMTP id
 00721157ae682-81fd4a66f00mr172882037b3.4.1785843311346; Tue, 04 Aug 2026
 04:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk> <ff3c03f5-fac1-49e2-be18-66f5ff773596@sirena.org.uk>
In-Reply-To: <ff3c03f5-fac1-49e2-be18-66f5ff773596@sirena.org.uk>
From: Mykyta Yatsenko <yatsenko@meta.com>
Date: Tue, 4 Aug 2026 12:35:00 +0100
X-Gm-Features: AUfX_mzH-9esLZONXfpGf5GZiPHAaQy7a0UgeKwKtULm_-WaYNfr559nYXkGKpU
Message-ID: <CAFsYEO+soZiSo6RoYhmby_ydEAfSri48FKivj8ndbJV-8JDEAw@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MiBTYWx0ZWRfX8vP+kIX5SdO9
 34G6aIYmKSwuG4r9+zUcaaMu7C0FTrJ0KS20GymHTASMZPdjEEMBTGxksPNxiUWrFxxXsBlV0k/
 Ox/N7R1mLrn16UwIvjBS+uqGGSOaJqfeqxYkuoc7day8G/zm1lohkDiXMyjuDyjwaMCZrOH1Df5
 cG2iZdyGI8OLrImime11VqZAg1Q6zR4jd6lvUoJUuILkZgTaCOWSwdzU08QVDLZmFomua1fXjfu
 DEkfxoSTSCzmGpLuEYUE1RI5P86VVdCtM7xD239CywvbY1XvdLv/fnlPDjFqeyllwpruvipG2Hc
 b+SKmuJ65ed4au/VNwd9njhPsBRc23M1ba0pTcyd3fzKmrPLkkMDhqcz+m3MdCvUGBaOFBwQc23
 5Vu5x49noxer+kPsLPkn0V3qxFNLyOewXS1I1hXXyOkycX46WifAlKDPky18xRD+1/YWGLCCAmE
 CKEUq+WDM4PVI9zk00Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MiBTYWx0ZWRfX9ZVwGEDL6wJz
 HPXQkOcAjzhxYFrJsb+Lw5d571JmPNFtEaTQzF8v1OizfPW7bFtnKqpDbsmeBgZX+0wHG8np6Qe
 dWd1BuL8IniKkZFXim8p2nKMFavOFH8=
X-Proofpoint-ORIG-GUID: 8DdzSD-tNKAH6Om-FAXxRySu9yIa2gTv
X-Proofpoint-GUID: 8DdzSD-tNKAH6Om-FAXxRySu9yIa2gTv
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a71ce70 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=EZN1DsTIAR6ZSkQplvIA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01

On Mon, Aug 3, 2026 at 5:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Jul 29, 2026 at 04:34:28PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > After in the final build, today's linux-next build (arm64 allyesconfig)
> > failed like this:
> >
> > ld: drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x40): multipl=
e definition of `__bpf_trace_btf_ids_dev_reg_evt'; drivers/net/wireless/med=
iatek/mt76/trace.o:(.bss+0x80): first defined here
> > ld: drivers/media/platform/nvidia/tegra-vde/vde.o:(.bss+0x180): multipl=
e definition of `__bpf_trace_btf_ids_register_access'; drivers/gpu/drm/tegr=
a/trace.o:(.bss+0x0): first defined here
>
> This issue is still present today.

My fix for the issue:
https://lore.kernel.org/all/20260730-b4-fix_btf_tracefs-v2-1-6b66da8dc103@m=
eta.com/
Steven, did you get a chance to look at it?
