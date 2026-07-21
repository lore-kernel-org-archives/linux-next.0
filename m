Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0201472530
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665478; cv=none; b=kGxkmfmsxhA2vyMAXXLnm9iq8b3ZRDbSmkS+NhNM3yj+do0dTenCbOtqZDS2UfqPSYH4dHjb6T1+hVYLrARhXLFgt9jkgiEtJeP1LwoyQld5VmoxQUjkpXhoJzN/XuDqMALiTXS5XkgTzZ9w/CnME4cGOPGMF4Q1ALy6iiZG2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665478; c=relaxed/simple;
	bh=hO1U9j+oLJFP/s/ZpvXyaZZVzQdFRJR6nwamAL+Gfkg=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=ENE9if0eeemmhXNz0UbR0QuwFfCyI2UzGJg3lrOgU7ly9+yHpr2dUwR402vdrg555phwcIGWZN2Y5ihXAqCWCddhwatQzuIK2eOhNHyDSuZDW2PMKiagz9pD5M0hrrwhEBIgBH/37hvdHZ66j+K5L1w2+FrPwhmI8vg70DtMl0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVsDYyit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bBHKD3Za; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVsDYyit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bBHKD3Za"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRMTd2494459
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=003EQkphcyWvdX+01Z1Yf1
	MIjuzGrQjCV5Lw1xv6tuA=; b=JVsDYyitO0zyyfCihvAvLtmT9mFXmIGFmNQotK
	78b6jj3/Gct3blCqopBgxRcJ1rblC0GF2H33jHfojkUsxltD4+gv+y4nYM8gZvko
	ZgqAEva6Wd+Bc9k62BOpOt0+4bvWo6VK0380VaVBEzgAgV18KTAJ63x7OgdQnA9C
	NUf60yVOnjONS4HcM3Hy4tdOlZ0zqFAdUhBbyRYsSGYt7iW/OLdgSgrASiANPstm
	8jm7d3dUHi4roIcIlWknzydea/oPvhFp+bBj2tzeLBiKmS3w3Mo8w8aVOWfWxQxq
	R7oA4bdg02NkvmqdH1dnXVkYzW6kOnyTkY5y4NXuBL2X1LFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d8s33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 20:24:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf27789c79so69543615ad.2
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2026 13:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784665474; x=1785270274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=003EQkphcyWvdX+01Z1Yf1MIjuzGrQjCV5Lw1xv6tuA=;
        b=bBHKD3ZaX8EBLIhOjOgLmZBC0yXy2V+t/6bhZGmvvAxg8moEhnFV1uYw9Wpc21uFR8
         dgaNAkIxWblvJodHT1Pgi0muaecROpHOAVf3pPOVcgpej1vZzkm0xkT4PrbX5NaoUbBi
         +29hL1QEJ4yhsdlaXE+vXnt3BTMxh6dTPepEuPgDwLV7ZMAeg5sbOEmb6xycBowZZYCq
         Eo4TWsNDrIbBWfjZup88hTf0RzzVOH9WDXXcz4h+FBR4SHfJJfSSAuqBzwehgdGb6+Cv
         WHpUJc5PtZSWkZh4Jkap+2WMswuM45W2Kgxnx4AQm227EPnFU2BcZ+BO8pnRmbkZQ8sK
         aP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665474; x=1785270274;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=003EQkphcyWvdX+01Z1Yf1MIjuzGrQjCV5Lw1xv6tuA=;
        b=jm1zL4RV2XPDW9hkCWFMGt66njvTTTkMXJ9aFfRBa3QGue1kYj5GmBhfarAzBGHhum
         floC4MaK40+rXLwQW4MkSBg2UtUZD2eMfTNuwVNR5Qwl2pWFFl7577pPMOkzQSLCbZO6
         alPVCHR88XE/7AnKWp455avSwK8+hW3a2eOeJnrc4ti5pd7eRWMSMtdCIs/9lTzKVSpg
         YY5LMorIC7wtxOLHmowBlSnc4Jr7RtDEEh5PMYriYYYHfh/W6ev7zi16Bw3nzAyN1/v/
         WF+gPH+qY3wQxLVhF7Pw2wTxSIxk2PSUba7c1OjZIb2M4clPy2ccSB4VQ2SkyF3mVSe+
         E25Q==
X-Gm-Message-State: AOJu0YxauSmJZpUSBOFASgyVNtxbzo2MtuqzEJZZ/Y6eNbE6i5fFZd2Y
	QmDzU8aXIILjGmYptQ4d9EwftkPuciBYf3TxzoV9XMKnbnYE3PTPmc3aOVsM1SqJ0d2Knep4nRR
	3Ui/wpuRbhvNSTGqrgGEzFMSKauYmIPU2/7QgnkHMUSyaC11oV1A7entf7T9sJpSQTE7dvbtl
X-Gm-Gg: AR+sD10tPlRBzlaFOzp53YtHeIKfSLB2otiJjOGGVcnzxr6OGrYvtg/xI8/uLWrDW/L
	3lTNRTv60clz45NsNVvqsNuGl/f+ZLr/rNnFtzsAyn8X5hkEM+ZDc2DL+BEseizbWfoqz6InkHn
	SbBzPtaqgC6NT70pQALP2M4nEYENe0AAgt8mF2VQA8HNevmOYw2FSsh1Ax3nJBZqTditP3A4Rv5
	W7COX8+Y7tyq23yXSxZvj7cZgsTx++nrblyRwBBJml0FmixCXdu1a0YGbC7Yp+DapaDirOa5l5T
	Core7DUeHkppV0TNTBsCCu37gOxG2nIDA79hNUMMVGxDSe2gz4ak+KCF/UMrsveRO5jFmG7bnbx
	KYRodT9CIuY4bZ+CpKlMVE5oQRdd9lHEV0D7Ax/KOgMgJ6jb4Cv9mtMG+JA==
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr21263162637.40.1784665474410;
        Tue, 21 Jul 2026 13:24:34 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c3ad9717d4mr21263140637.40.1784665473920;
        Tue, 21 Jul 2026 13:24:33 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1cf8fasm1590839eec.31.2026.07.21.13.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 13:24:33 -0700 (PDT)
Message-ID: <d5581c2d-ec80-4698-8d2b-055e8e8e909f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:24:32 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: conflicting changes between wireless and wireless-next
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfXwlk2j6cHrNj0
 IP0VzGQh209vRhoW8u1quVJNlnLb2dDhIcEHxWT7SnLcv9Pe1xQDMzIg+RaYF3Y4vg/F3Pt+cB/
 MhYpk3Y2SwpYF74vALR3b49icSc6fF8=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5fd583 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=rflHcMbu63eELnImz-MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMSBTYWx0ZWRfX9Mxd6Bo4IfVl
 o5ZSvL54+5vD6RCCiR4NnSl+IROd3ZbWnPLRndi1LxVtRTAxDMBy8NbNtR6bJP/wxds4P+Whf+z
 Euu1VcSHkZyplmk7vse2qwy2GrrBhyhrXoKJPKQtKOdksTD2dhOoDWwNs3GRrN5IquT4h9uVyl5
 avcbjDEZhMMnHYB4iKfuzngHNbujtoppEWdQ7mInI63z71pqaykPFVDsnJ54e6kx1Q9aquaAMq4
 YDxVRBgyJWg9c/cNwGw5n7c0UC45vXwcRdrbhgcjNxCUVvH+SRJu4LdSsUYPJAq2xfLpvEeANJf
 cSCYj75Hqs6dd8BUGzAg6FDsyHeWHL7DIYQ4LlqnkSa3QzoX0PwE0zKFyeAdJ6ooKhPWGAXrdU+
 sUwD/21XqyjmDMa8E239+sxZ/cfZd7EbtFUTMU/ks6+MnR8fglGFELkjn7/IotRtuVkmPlBKKWz
 WBGBX9gHEAqM/CR4yWg==
X-Proofpoint-GUID: V7x2uuUOs1i93wXQ7gqGzxDWdkIL63-u
X-Proofpoint-ORIG-GUID: V7x2uuUOs1i93wXQ7gqGzxDWdkIL63-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210211

Johannes,
I'm trying to construct a new ath/main which involves combining:
wireless + wireless-next + ath-current + ath-next

I'm seeing a conflict when combining wireless and wireless-next.

There are similar patches in each tree fixing the same problem in a slightly
different way.

Can you pick one over the other? I'm guessing drop the wireless-next version?

thanks
/jeff

wireless:
commit 4a360c6e18dfa9d70006c7247a6a8cc8dfe0d60f
Author: Zhao Li <enderaoelyther@gmail.com>
Date:   Sat Jun 13 02:50:45 2026 +0800

    wifi: mac80211: validate deauth frame length before reason access

@@ -5641,13 +5641,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
                                     struct ieee80211_mgmt *mgmt, size_t len)
 {
        struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
-       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
+       u16 reason_code;
 
        lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
-       if (len < 24 + 2)
+       if (len < offsetofend(struct ieee80211_mgmt, u.deauth.reason_code))
                return;
 
+       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
+

wireless-next
commit 8a0ed6ce39852d6a5dace3b3908c77c17468f250
Author: Shahar Tzarfati <shahar.tzarfati@intel.com>
Date:   Wed Jul 15 21:27:44 2026 +0300

    wifi: mac80211: mlme: read deauth reason_code after frame length check

@@ -5639,13 +5639,15 @@ static void ieee80211_rx_mgmt_deauth(struct ieee80211_sub_if_data *sdata,
                                     struct ieee80211_mgmt *mgmt, size_t len)
 {
        struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
-       u16 reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
+       u16 reason_code;
 
        lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
-       if (len < 24 + 2)
+       if (len < IEEE80211_DEAUTH_FRAME_LEN)
                return;
 
+       reason_code = le16_to_cpu(mgmt->u.deauth.reason_code);
+


