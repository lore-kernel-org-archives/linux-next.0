Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC91478E47;
	Thu,  2 Jul 2026 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992985; cv=fail; b=cwpwJOajBcbC+uiLt9sYFvt7SVJvZ9jT/gEHxNCy3dMj/XUUL0tJO/BTb9SoLgyFxQaApKsDBga3qLP0aAI5LKbfROyiJmyJGhH4RCok0YUb9I7QOvQhC1RBZCLxhI1nsh3HfLEO72LFF/S5VNQdxlMAZ6NB/8/VflxfQp9PBME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992985; c=relaxed/simple;
	bh=n7qAqkdUjbyoBI0Z7yFO5Wp7wwxMCtZYVoN994ti1Rg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:MIME-Version; b=TMjXOG51pSi3KA1AIL0UPXDeeROH4YvYEg2kqT2q+MVq0tGGwValOc7NaTdwAtg00nyYWhW/6RJq2QppmpWhdpnvfAHrlc+/dS4r6TlblpCUKJHMduX5I7n0FCZK3IrjBXHyQTTdgREO3NhkKTBFiiyhm5idM1eJp249rtfnx0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cRbiUi1w; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cRbiUi1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3HQxVWKIt6Gl3FM0Q/6Vg9eOeZWSFY5J9smWYsYpl/iUU3aPx93AC9zx59fr9C6c9EeQ9sBMq3OX77s5scHEgz6mRJ86AuTwL/JP1LDTg3UsFP+SAhziVnF1prigbZQMmiF0GW1ySUcuN9a7Mn0KFt4jWmXJe7Mvw1s1r8Q5Kli2+n7aCN76Aia6LFYsP1MPOANha/2+7LHrqtF2FT1iJITpTn7V//Quvx4dWM2LUwy5ginkGjXFjxKz8KZKu4UeDgw59B9QuymepxCg2RluiljirK9zeVhZwqIhQq0MKyP4pcYtJEEj9qWx7FnSd5rzoH31KLyBhbYVVp0vPrZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7qAqkdUjbyoBI0Z7yFO5Wp7wwxMCtZYVoN994ti1Rg=;
 b=WbRdYkLR7pUi1wyVf+oyy3+yycbr6/l1kRbvfm/L8zhwBNpn4vyoosv6iXM0zU+aOcUyl+4B/bx6lJ5QpOX+gu8TbuRG7KjJvDYwcYa1d8YB2YjePdJOeS7Pg2Kl6/XMmZmHW8eJetMuD78JTmXcXMnCOJyyfV7xW4LOo28jeo1CEgnSt5bDamgKlT7loWyxifjMQnLTsmTTOVS2FNv4ozqe+XbAPNyX5ZzX/pKXjSIqXAeWtc6kA200IfAAWFf3T1hmvUkfr2a++5d7YSztDCskoMiGm+mPBNnjyS/SCl8DHCY5f+wZ7/1rIWlXwfAJimbSlZH+B+op3U6qCxwJRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7qAqkdUjbyoBI0Z7yFO5Wp7wwxMCtZYVoN994ti1Rg=;
 b=cRbiUi1wLaPeLaiWg4hhnOSC3PuQ2DjVZnUoNNm9CJAh4eKHqqR6iWKM+xVRucLWRe7zakWCx6RvlCyj82oM1/4aUEVPSkdR0HsWTTOJP7XLLmD0mtPV43L0WpLWqgDfey4uMGR5T72h9Q0QPMI1sTOUSbgMEZ6fX1zQ4Mnq6Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3303.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 11:49:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 11:49:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 12:49:39 +0100
Message-Id: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
Cc: <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>
Subject: Policy regarding linux-next only changes
From: "Gary Guo" <gary@garyguo.net>
To: "Mark Brown" <broonie@kernel.org>, "Tetsuo Handa"
 <penguin-kernel@I-love.SAKURA.ne.jp>, "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eef3edf-7232-43e5-3bb1-08ded82fffa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|10070799003|1800799024|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	NfRzyjUjc7xYl4O0IBBreZnEYhXS8vQ7OHepdL5eF3vg8cOwBpQX4FbOR3+BTQvAnEC9yZXx/fqoLgZkD1s2t0yHO8RCQqWuTkZ9uJqEqafEgw/PKi5Tm0TZlfx/2f5Qa2ZchwuAwMdK18j5AfDr3FNxs73oHlB3wHYmTNdNTPI5XBkIrXpkomrksxCa0i5egA59qAOdFxUYF/q5bGc4c2ofg55iRdVvcQUyNH3go5yxBC5GjF6Et1Xa/HQiYJ4My+dFMe9+UQHpO5CtjQ1b7lxjgXkyCJmLUx148Iec6nxYiu9pjmyXbXukRva1F9MP8AR5wvOoqjNIsRljgBGv3DoS3DJy3dlum63CTbQdP+oBuGyHRvN1qCjwiHSJWBaTiytbvmS80vOz6ZSXyv/LDLMg/LjUilN07OMeGwl2eDe9VPqNcqkAxc/Asi7sJ/lmk0pcyiP0iWlLsVKrnq4huz0k/Lh2GK6MeTK3mGF36PYXm0/P8biy72g2+iaDp/e8r2Gfb3451oEqoD0fVZSJthfiBjYW7ESA+dWaCFa/gDTglETCfhJoU/XMMmObIPcnf7p87yGsf/wB9CFsxUBNXxHAjHhZf7CygVbRzGMv/kw5RIlwDWlPDFiysA7zvx6rbizD4O83Kck+FCNRlZgtQyx4xuBpFmBVVdUpq/VX6rA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d20xRktGSEJtWVQvVXFwcUVld3ZQcVhEZ2hxTmpTM2JWdGEzVkY2SzdSRWZR?=
 =?utf-8?B?VmFkenc2cjRETFJZeEhLc1gwd2Joc29ZZCtzZ1JxWUl1QWVOdFpPSlZ2NnVU?=
 =?utf-8?B?K3FVQ2YyNVZBMjlKM3dyVHlIcjBvNVQxYm9aOG9IRDBMamY3VnliNzlBeWxW?=
 =?utf-8?B?ZVB0ODFDUXZUWFpXU09IaktJamkyMW1jSDlyV1pBbEMyMSt0TUNrZTdGbjVq?=
 =?utf-8?B?M3F3Q2RJRWE2OVdKSk9zMHdxK1JXUVhrR1ZWcDdNdnQ5UkRtcWJ0Z1UrVkdV?=
 =?utf-8?B?VFpuNHBZUVdsRkFMbkRJU0dROFcxZkRHKzlRODU1QzZmQXBqLzNrQ3hoSWdH?=
 =?utf-8?B?emFtZTQyQXliL2luMFlPd0lKbFZYNE9DTkk3MW9wdnR0aG9mdHJLOGNBZmhK?=
 =?utf-8?B?NE1XTmVpV1FkNHNra1hLT05UbHpoRTAzQkpRSTZ1MVBpSEN3K052aDdBOGE1?=
 =?utf-8?B?Zi9kbGxCZGZJRHJYYmdkR0lNL2lPbi93dThZZkgyaXpSMEx2NW53bTJrZ1F2?=
 =?utf-8?B?SnJFLzFkN014RG5hZDZmYmpOKzhYdzJCdkdBQk9Qc3RHWStVQTUxbEdtSE5V?=
 =?utf-8?B?SjFQZEJwQmZpaDBOM3ZDSHNyUkFJSE9rUmlLQmdXUU90N3BicHlneVM5WWdn?=
 =?utf-8?B?TVZrVWFYMDFtaGpvdktjR29lcEtKMkkrNmVzYldBQUJuZ3U3bVZzcGVNblRT?=
 =?utf-8?B?emdBYkN3OVhVVWtSUVhiQnhTTXAxd0RoTlpHeUMvUjJWNklpTFhBUHJpdjhN?=
 =?utf-8?B?MEZsOFZYUVV4Y3AwU2RuQWROOFErTytYelh6L251TS9DQUtjb2VlTmVpZDAr?=
 =?utf-8?B?bE9IM1V4enE3T0F4SHIwak5kNis2UEVpaEYvUGhqVzFKM0U2SEZYYnJTOUVR?=
 =?utf-8?B?OTM4eDlHc2h5MExxYnU4dTRzSEE5ZTRmby9HdW12N2FDaytDM2dpV0drcTQx?=
 =?utf-8?B?d210Vm5MaEtPV25LMHNJblRTQmxJS09MdEFTSE9KWEZIOC9CbGRkUnRMdHhr?=
 =?utf-8?B?TStHbUNmajA3RDNYUHphdlBWR0Q3cEc3TlF2c2c5cytkTksyOHJoektkdzNI?=
 =?utf-8?B?aHQ5Tjk2eTA0V0lXenpMNUJEVjJEK0RQbDRTdjlkSGV1OTV2a1RRbHdSYmVk?=
 =?utf-8?B?TW1veVR6cnp4SDMyeXJaL0wxdlkrcDN4dFRwOUN2SU5wSU5zVnVFNVVFNXpm?=
 =?utf-8?B?RXNpOFFkbnhmRXhQcExzSEI5bDBXbUhZUFN4OWFvK3BFdDh1RTVWSFQ4dEdu?=
 =?utf-8?B?MDMySEhIMEhpZGVtNkRwcmdnd0V5RkV1TlN3dFFIMzBIa3ZNU0FMRzJnYUVx?=
 =?utf-8?B?RXpSUkQyTFJ6UGJRVm8xRDRwbFlCeVBVSWN6L2dpQ2lldmVxM0FxbTd0N291?=
 =?utf-8?B?ak1JcGgzK1JsZ1lRYXNhUUZ5aWJZQUpkREdtWDNpbVkxYWxNWDloZHZBREg5?=
 =?utf-8?B?VUZhWmFXSWRlMkVOWXp3eDZTWHphZEhpZ25uV1lPZTAxdjR4OW1RNkxrenFU?=
 =?utf-8?B?ZGttTmNsVHBHTlUvS3lyN3J6aUdoNjlJYmc1NC9ldTREQVljOWl3NkFBcmtJ?=
 =?utf-8?B?c0FEM2p0R2JLMTY2K3JDNkhzSEpOc0lSWGwrRk5YQkN3TG5WVFJ2Y3RIOWJW?=
 =?utf-8?B?UjhYNkhWZHNvRCtoZVN2TTF6RUhtRm5wMUgrYlRqZk1vbjlZZ1U2VXBXcThj?=
 =?utf-8?B?Yzd3VXRMSEdJYmwvK3VhY2l1c284NGFucisvTkkvWm9IQi9sSWN4R1VHMkRI?=
 =?utf-8?B?RitxL2hvNFJSekVGNHJKbFN2R0pGK1NVdXJBaHVOZk9EK1NnV0hnSm1ZWlU0?=
 =?utf-8?B?aHhyclljS2FFU1ptMWY4M3MwTW4wWkVSbkJraFZYaWVYMHRlTktrQjJqZVpJ?=
 =?utf-8?B?cUZrTkxvWU1vK0Y5QjRXRGdsTnBoOTUyMG1jODN4LzhXblNoUmRMR2FzbXkv?=
 =?utf-8?B?RUpqeFJ4Nk1ZMEovNEJkM0VQeXByVktKZ0s5cVRnMTRTZFh5ZjRmYjZOK1NZ?=
 =?utf-8?B?NUVBSzNuM1ZXWEwxWFg3Q1prK204L2pDN2xhcHRMM1VIUlNlMVJqWUZrQ1p4?=
 =?utf-8?B?eHhkOWFHOHRKNjhUR2JobGVBUFZNbkduTVloL2RUWXVHQUNHNG5UZkF4REk5?=
 =?utf-8?B?NWc5RithUUdKTndSZEFDTWIzTXNpdk5WMFk5UkQvQ3lMQXhWZW85U3kvdlFT?=
 =?utf-8?B?c2Q2WTJkVllnOXhHTFB5ekRkYktRSHdCZCtTOGJFOElNSFpGOWJDekVOc0g3?=
 =?utf-8?B?VDBxa1BxbWlBelBXV0ZTVW9pSCswa1BYSGZ0b1Vqd0NuTFFRRXp4d0ZpdWtM?=
 =?utf-8?B?UVdHQVlEWElwTE1CMlNERjNsSENoSXVqMWJsUlh5WXRuYlZRVWloUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eef3edf-7232-43e5-3bb1-08ded82fffa5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 11:49:39.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9prv2C1JfuqKuHe+7H6wT1w41XPIlpT2WxXRpr0/1E/WmKuHFEQ+amKUceoyt7WrTKH4YkHkzr7c9l2xSWRow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3303

Hi Mark,

While testing lockdep changes on linux-next, I found there is a commit
ca65ccfdc5b3 ("locking/lockdep: make lockdep_print_held_locks() always prin=
t if
CONFIG_DEBUG_AID_FOR_SYZBOT=3Dy") applied to lockdep. Checking the history =
it
looks like this commit has been in linux-next for quite a while (at least 2
months); there were no emails on LKML about this commit at all.

I asked Boqun and as a maintainer of the file he's not aware of such change=
s
being made. This commit is being added to linux-next via the TOMOYO securit=
y
module tree; checking the merge it appears that none of the changes pulled =
in
via the TOMOYO tree is related to LSM at all:

e07d10ed0f23 lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels=
.
8f598d86dc9c net: add "struct dst_entry" debugging
295e1a24166f net: update dev_put()/dev_hold() debugging
ca65ccfdc5b3 locking/lockdep: make lockdep_print_held_locks() always print =
if CONFIG_DEBUG_AID_FOR_SYZBOT=3Dy
83d2b1cd5d27 lib/Kconfig.debug: add CONFIG_DEBUG_AID_FOR_SYZBOT option

For obvious reasons I have concern about this practice; being a maintainer
shouldn't mean that you're allowed to add random stuff to linux-next. This
reminds me of another case last month
https://lore.kernel.org/all/20260604210704.41751-1-ojeda@kernel.org/ where =
the
added stuff via TOMOYO tree breaks Rust build on linux-next. I think this
practice is questionable and I would like a clarification on the policy of
adding stuff that is not upstream material.

I recognize that there is a need to add commits that serve as testing and
debugging purpose to linux-next, but I think any of these changes should be
temporary in nature and have acknowledgement from maintainers of touched co=
de.
Perhaps these changes should also be in a separate topic branch which gets
pulled from linux-next temporarily.

Best,
Gary
