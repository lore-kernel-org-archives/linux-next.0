Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398648;
	b=N5m6Nzapk/DYxTsW/Z3HnU1qnAxo/Vf5gcOtpcZ7UTNQ4mdT3kOsY651WUj932In0UNK
	 hMQlzSkAQH1FEymM/XPii7ecIeMXPJOimX/InOM7RmhdTt5qmkDTyUeLnZQf45dc11H0x
	 PJsQwME/iYR4NZ5+ei2kO5V3FhUkruZLuMMAcXtWmo96m5CZXw06fCNDdx2EhOLyjR0Kq
	 PU0MyVtgmiuU7g70EXyO4a7HMT3ORqjjAQ05/RdlX1DSYFdG6fDejmvD8lHY+8c3YUfvt
	 eiQi5SVkSzFOtInO5t6KwTEul/+FD6BYWRSvt1aUOrXYF4iQVPihHq5sJre2HnAQjpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
	b=iQ8BbwIIwIHutaAZhuI5aoE4FS9IbJ1BP63yyD/Mm35GTKj2J7CUUYo2IpJHJOkahpPy
	 pclZ1u5f/RChxsHUvApRt/kw+OWHa2fv29SPT7BmiZ8YD8U3aFwJzl6APUZQYShbBq3jP
	 QPXbdPLdXk2R8nh5aAEf+3trnYvNjLVRQybaX0vP2Z8AYyw8sIz0BQ/Y5k276OsR+RCZk
	 mwXWooTIWgUGppW9THn0clfmbT1vC7R/MiZ2nYUbWtkNofUHdjg8Cl8nrr6I+YDh98won
	 mqvGB8S1wg3BJC5OebJ8pSJRJ4wzpEWltgzwTsCvdQNvmFNiztqVn9oa+e0qqY/E2tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CvY2lH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAcHUnVk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7927606A335
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7927606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CvY2lH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAcHUnVk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABBTYiV3958994
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=; b=X/CvY2lHnrvPCeei
	JRPs/8T6Bk5CJZOtU0EfTBYOS2lQmbTIVqOzkcqcqrNmsyZBuVmgUrDGritvAb+C
	xnmv36+J8fK4+sEoG4q97VH7WaUXP4gs0TuJR44UFCW3eooQDoDDZ6zRCV3bquGd
	U+j8qiiDNbWf2e5TzRLwxYgxASRCi6I3STt7ZMcMvGTZeBdEgVk19dnU/aUdTHeR
	kE1WWk/0UMYpIUG31V57uBShQCZcZjFbJZX1oWPV7v9xdi37mIZ1IO/2PDkjQT7m
	XEpXLPS+lfJYdvABe0yY8KfH6E7qcKT8lOp6JwJd+Hopj96CS01nt5iHdzKTNO3u
	3N30ig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33dxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 12:04:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so2877370b3a.1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2026 04:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398646; cv=none;
        d=google.com; s=arc-20260327;
        b=MMo/LmfF7ChRydn7MAmdopAPaKPLCf9h/GrL5GQvNfFmdz+J1DairCxB3DnKvnCgsE
         Nlaxdxd/X0QPYEtiNI9DBHsX54TaKM9EazXBNQzu2uOdK+P1ihqwTfq81ohf/rOMbmO7
         jGSLw56vpYNGeJtpomNJQjehIxLvwkcfXn+2KB12QfwpihWD30UUfqThHv7LvFmV95Hu
         vFBdmeiXKbm5oI7bkpfbTD3llp1leT4sHGueM9qXsXI4QVbZ89+A40OFdGJp+xxHP0R8
         fw3H/MCU5oVxZOLkWfyJDn3FMuNTwvcDTCMcDqlmSklLOPmKy1mfPujR+hmHIedyPTOe
         TJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        fh=hVGhfmxiSIIl2OLc8spXV3O9Capf9uuDR4mx3yN6rvs=;
        b=damO7tnHZgtDoEhUp2SvZBLTZUXrdv8lb4bLxVaHPDqaMOyyOXgJnncj13nn9gKzjI
         JZkTWVV2Cdv449jbx42cvHk4rvcnOwNv0qud/fIHLEAFrKf5N8TfJYtLHRKV9DOWrbr0
         +69UudB1vHtKJX1sxmIf8NPDMCDYTRHd8XDfeWFykT4UGgVZKMJrIzeQYotDIMYAekeH
         pC5FZhAEMXqxL2rE8u+9hfkKIGERyW4noAvMQIQkDt32/w5Mq+CgTz4nc2evP7xlqWAj
         8wBHrj8kVl7PMKCcxle6WmVQo1Z9l1+FPNbf6+9+LVCXDq1j58N6ibU1swHZW2f54CLa
         PTPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794398646; x=1795003446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=OAcHUnVkbsxxCk9J1E5i4npIqER9Dolx1heJL/EnpuDI4PHROFyn6XS6Hy2JkVmObm
         93gXtpZ0pYlVfLgAE8i4B+eiGE0preKtX8CxNkWSJwGI0QKxAO4woewt6ddqjzSGJrV6
         kL+qrkI7jNnFX6U5Dx7w7LRbvcRAZfcll0lpphPkASGhs3J6nmUZjNBNK5MYxrWNGvhM
         fEMEZ3eOk9aTnErj1aUZqWSWIgE30ocr5f2MlWsXw6J2lTQFMWxcnzoYLW66ZMJrm2U4
         mgqaRvefOBOXF5YeWJBFaoEgNc0WHRW5Cd1mpKWY3oUphqQyvMgK8+EMCyAGk9RiJ649
         TjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398646; x=1795003446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=gmDS5x8ocVZyiEGviAfqPivIBMH/LTO3NfsPDwDFYmCJsFylMtlwutBh/jwKQk6jVI
         W5q+OD43f5SpGgP6U2rceufKXaptFNHjMWtnZ9SkMPvKcEr8woOezEXxNvdmAzoJnfdN
         0jOIP0YpD9bwh9ng7FCGsRBu6dezrsZbtXeESOUUZGmft2siaGOOz46ApQ4fXCMVwpiF
         7HV1jaP0kunq1WzGXWrn7+ls1CEAxHrDcjlEJrchMcevwyD64rIU519w+CucA9vxKAo0
         lSuj5jxTMhpXfu0Npqq/ux9EF9HhVeNka2nTa/xZWn0RELmXdT7kO3nh8Lb3s15LRX3K
         5zEA==
X-Forwarded-Encrypted: i=1; AL+hErHNlBrahPEs5w3BNPs0+B/iPqLe9gZXUp8FOXCSLEU0VM/wXirAZnlxcMs9J9fJSZdYHPLoppqcrZiN@vger.kernel.org
X-Gm-Message-State: APuU4Z9lunUROx3mE/MLwPl04YytJ7R+1PisohnnxpioPqF8H3xX38CI
	WsAUWSqPbappvNEIvCviK8sDlZJCV5o7J/Tx54l/2ujSkKZm2FQ/ke/oY9WaLfi8wZDx/q5Ui+G
	b9kUsXenpxKssY8OUu+McHP/QcgVE4Ra8cRs21Hxaz/NYcA38Qdmre3peiSFttSzPsGj0DM5Ij5
	RVenvBWW9wF6EjepNdthPwGX0q/pRUtEspwL4dh2o=
X-Gm-Gg: AYBFou0umQuqjXt2pTU0MKquGt1RByJFfmIUeFNg8jt7QwmBDqT6A7eSrFbEgye4CpL
	LCFNLoOSbfVIAoLKeiJ1JnAYSp895F5Jk7vdCrtS/FgmQDUljXBdnhX6uPaYjvuwsU2/5UwDue1
	V5/5C6LAHUON1dXRGqrZJMVcMNQ9+DiBX/J4qbBKCpCzdClPJ2QPm1e7eb9A==
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id d2e1a72fcca58-8bc1cc6842bmr2465032b3a.28.1794398646203;
        Wed, 11 Nov 2026 04:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id
 d2e1a72fcca58-8bc1cc6842bmr2464996b3a.28.1794398645717; Wed, 11 Nov 2026
 04:04:05 -0800 (PST)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avNHazNbGtMQJ5pV@sirena.org.uk> <20261110170253.2694265-1-sashal@kernel.org>
In-Reply-To: <20261110170253.2694265-1-sashal@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:03:54 +0100
X-Gm-Features: AclHuK-TQiAr8PSNCnxTwZnldPhQ9Cil9VcJUdagL6jktT0AFdXWIAAJvTIePqU
Message-ID: <CAPx+jO_hPY0wZHwE2QdryzgOOAPH-2C0KXZTpt=cT3Aca5d6ig@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Guangshuo Li <lgs201920130244@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af459b6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=FacbNd98rA_P5PhHUj8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX2IVA+6IVlZiT
 qg2ZVb6SBfeKqSrK2RHyUCsNcudp2kogF4hgf2+SXtXekNG3M2z74cX6rocVWZ4pHvFBikViBNV
 NbL/jDZPN+d5KrfgBXPn/swUnTwBm92bb85hzs1zVPSXJMr4wVhx9WWL+uLUXjM2dOIU3+l0d7X
 9DKD/KUlArxo256ZqSW5ooHclgAlqSF8ImuVBZWl2IZDFVHXsn8lY+TW3BCGYYQQpY7xPUTGEsd
 G2PbNr2YCbCNQxRE6iEQeuVT6B7E8Jyndq0alDlBvcx5hu9XPuAMkScvf9NLASBsQ3mjsD4qZ8p
 KmA3DXUr/Hfizhc75yXE66ECXHXQ/U+Wt9onuguDL7fdorQGHffz0w1F56YFcxPjQmlVp/nETxI
 wP1o1aWavE65bX8ByDjgjxjfvhzv2j+/J0fZzT1wIx7W2LgWgqFGlqzmO8Pn55LDIdMK3rG22IS
 HWTjwKsdGkAtoVYXlpA==
X-Proofpoint-GUID: Unq3GNunkl-0VSKBPJoASN4tr_cOZBhG
X-Proofpoint-ORIG-GUID: Unq3GNunkl-0VSKBPJoASN4tr_cOZBhG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfXxkGmteJjA9Oq
 dNtQDV5V5iCSZrms97Sl9rqhX/JOFs9Ie3azSLUp94TBGB1flCTyLPw3/0b0AiITScqEGrBVs4r
 e0V7BqhXOfjMVnQ55HR8raWoIq0X/z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047

On Tue, Nov 10, 2026 at 6:02=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 04:33:47PM +0000, Mark Brown wrote:
> >AFAICT this is caused by commit
> >
> >   d7262971a2acc (pmdomain: imx: gpc: remove all initialized power domai=
ns)
> >
> >though I don't really see how.  I have used the tree from next-20261109
> >instead.
>
> The while loop that commit adds to imx_gpc_remove() is never closed, so
> the function is still open at the end of the file:
>
>                 while (num_domains--) {
>                         ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
>                         if (ret) {
>                                 ...
>                                 return;
>                         }
>
>                 if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
>                         imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
> The patch was posted that way [1]. gpc.c is only built with
> HAVE_IMX_GPC, which only SOC_IMX6 on 32-bit ARM selects, so x86 and
> arm64 builds do not see it.
>
> With the brace added, gpc.o builds with imx_v6_v7_defconfig:
>
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -536,8 +536,9 @@
>                                 return;
>                         }
>
> -               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> -                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
> +                       if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                               imx_pgc_put_clocks(&imx_gpc_domains[num_d=
omains]);
> +               }
>         }
>
>         of_node_put(pgc_node);
>
> [1] https://lore.kernel.org/all/20260924142520.1594149-1-lgs201920130244@=
gmail.com/
>
> --
> Thanks,
> Sasha

Thanks, I amended the change like that and rebased my branch.

Kind regards
Uffe
