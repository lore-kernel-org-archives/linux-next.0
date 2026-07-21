Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010006.outbound.protection.outlook.com [52.103.2.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984C1F3D56;
	Tue, 21 Jul 2026 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654137; cv=fail; b=rU1PZz76uM1Pai5g+5tR5ts2qQRUD23BfFNPDB1Mbdp44fRKCcAMdioiZQoMNMrQVZva5CQyI0Hgb9v8t5qZVPvv5oI5WzilKIXL7slUExgP1SYQd3Usu/gEqJW/QvGGxLGd8ZtAN1aCuyUrfBBn5frpNHl3y/tMmeTYa2YkF7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654137; c=relaxed/simple;
	bh=gYB+S+ihByYKPy++fLYakP90jKQc7RtDifuwMJ71TCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NsX7ePvpC61TNYiy0ZFbjUMgQvlqUtQsg6h6M1D7ve4vN+CAeI0KW5WGLb8L0P24ebvJAmp9DakodMR31WOdvglgbDZLV+EnUKVCF1nENMcWXvqnJ6xbTLAVeSJnMd5xCjh+7swknVIYmahaYMYcGfeB8O2OOypu/hhv+T15DN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=KzZWFggt; arc=fail smtp.client-ip=52.103.2.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="KzZWFggt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX26Xyu8rnu9ZbvvlWEK+oKkcANxuPnGmj12562srkfi8kzGxMdbBtWfcBX6KOdsVZmQNldVaNieYgm6vv7EUaj1V/3WF3Wn3lnpCaD2AnwOsoFvvkftTVugOpNjFv/3/l5rM3SmixZomeTO0GSUxGyT8vQl3a5zPVLXMGd2/7tgLqb/C30WtIp1okUJSZp57PlZ+6uNLlcfCuXJy6aHeei3kMtZvXqaaKdhIM0YEL3W4U+bJ1Uk3m5w+enBWeAhL42IPCAJkLYT/b4FuSU1+jr7kKiFW+XcerS90s6NrYp0N0ZBb0bleSfEBPLNRyE1lXKH6ZK9ISEXrN1f5iQ+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM0B5QrdJFk/Nv9+0HEiD6niDSmxKRtmLanJbUKUBeE=;
 b=jWBzQKH7ls0aBjiMIVK5avkxagUpoT1ZCozH/3v9LFQyxroflQ6ZiWLbL+SSlQ9yDkQTzqGCvZLnhdUz7Y5YQ68V9BFLW8wmwA25l3/fnzYeNhZhIDYvL/J+Vlw5RyzpIH5lTDrtQU8U3OLIL7laHzznOZ/c4AMusef+tlK9OdJa8fkHr2D7Rk2SFNKIG1jk2PXkySGb/tWNgkkxaUz59IU+JKWJbKZFRqFfF+452Mk9Kmoe170F8Cn421dBqRJthK9YqakJP0Qd2gnonIMFjqHA94b4uG/6ne+jS/9w5/K8ncQLq3Ws4dwo1/QIzsIYE1bxuaJcPCmL00kohWnZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM0B5QrdJFk/Nv9+0HEiD6niDSmxKRtmLanJbUKUBeE=;
 b=KzZWFggta2CUl5lL4NP7fQius1OX1VXK7PsBYOboEQog20IE+fLeRi1gEzqcNISi9qSO+Vj9YgVGtwCpFCQU2Byb4RtWRa9VaaiSb95ryZnqUfPbqOYh2kaK5q0YQyIHnW7/XXiRFaHJE6Hek7O67JDR1JhKtGgBRmKVFw5BHhb42JBVAtsNz6Dwa3bOY5NhHOK530q50PBpEghbnAwzUtY9RoR6WUzavo7atg9/J6NW1wFK7wpFWFgAqgtaroSi4njBI0dQqcELNJ7SZQPMTW2sx3TToxuTKTwKHO1AsyLpPdEbrQWdAV/LSfGjz0DJTaHp4KW14Kgy/Sm0kweFhg==
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 (2603:10b6:510:3b1::18) by SA3PR19MB9476.namprd19.prod.outlook.com
 (2603:10b6:806:494::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 17:15:35 +0000
Received: from PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172]) by PH0PR19MB997338.namprd19.prod.outlook.com
 ([fe80::fd22:ee23:3e25:3172%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 17:15:35 +0000
Date: Tue, 21 Jul 2026 12:15:32 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the battery tree
Message-ID:
 <PH0PR19MB997338AD35728E948A41A7A05AA5C22@PH0PR19MB997338.namprd19.prod.outlook.com>
References: <al-HUrIVJZ-vLN2n@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-HUrIVJZ-vLN2n@sirena.org.uk>
X-ClientProxiedBy: DS7PR05CA0079.namprd05.prod.outlook.com (2603:10b6:8:57::9)
 To PH0PR19MB997338.namprd19.prod.outlook.com (2603:10b6:510:3b1::18)
X-Microsoft-Original-Message-ID: <al-pNLa-8NPGFK6l@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR19MB997338:EE_|SA3PR19MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 894a782d-9f72-475c-8e96-08dee74bad33
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|4140399003|25010399006|15080799012|37011999003|23021999003|25031999004|19110799012|24021099003|8060799015|55001999006|6090799003|440099028|3412199025|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5YVVTCv+tSi1i3H1TBa+DU4w5SMBMTPJ0lyqNu7IKgR5mMDRZ2RjXxW78qlM?=
 =?us-ascii?Q?ocvpXLW5MH/itMNPOqGTFzsFzkR1t1LQAYnBa4D0M+7YqoZV8imkP33drb22?=
 =?us-ascii?Q?4QJ1TmkGao37z9ku4f4kDQpRr7A1fHfX4VogVYvltttiGKCp4ivoHkHQJH3L?=
 =?us-ascii?Q?hDksPv/MIuSmX8UnB9WGqbgCqcKg5gltiaqbf6jiDIa7YE+kE09WVe/fhCST?=
 =?us-ascii?Q?K1qUL2pvS3nj8jsfgALGrXj6pNTQQAMkf+zy+hU/WZcGilCdecsUbZuVg5A2?=
 =?us-ascii?Q?p9TsxbJeG8ABoodpY9yD6xMZzA476xiUpeDmpbjpW2kls0voKjrBSh9RhQX6?=
 =?us-ascii?Q?07a03vT620ZfwzbPKR8uBGTOSnUEsDecnLbve+2wPxOrVrHareeDUe46WG+5?=
 =?us-ascii?Q?BWg+oZoKvtGbzuXQDVQnYedt9e4bfDOlk6bcNn8T23hpczEI/NBnbhYjOZIn?=
 =?us-ascii?Q?H6jBbMzag0q4MMwyU9/rA8rgoMDpw4XLXU5rF8/jlRBl6Fw4SYZ02qiUJpIT?=
 =?us-ascii?Q?yEQTVcY9JI43WV6pqv3xYoHHEvZk7ozQhiX4vuaUGFhKxeLgxJeO8QUluOlD?=
 =?us-ascii?Q?z34tU4lbX4DqsL3Oa9X19GIzzHtv4vOEC6ll95tcYEB+APwUeMmhIDOT823P?=
 =?us-ascii?Q?nl3cVF1xoUddXIISkC6kecSlc6BZxhXPyOa3Xd/erAjz1b46wP+8CVN/2QLH?=
 =?us-ascii?Q?NKlbJm7zI8nq4MggcLbSlMKgf2yhGa0MMIpJofPk2eKycggfzYPAFIXnd4KT?=
 =?us-ascii?Q?jLsyHKa9El4vJBHsqSBejUWSsLaoYSyxYJ4EE4xIi9J5Ays5tUviGtWxYezF?=
 =?us-ascii?Q?RZLN8R+QKzO/ztRglEKdHnWlUI5HNr7dlWopYYlk83IwBPgXakYCRZwPNvtM?=
 =?us-ascii?Q?KAfI1CMwtMJwbL0CHC34MuI6CF+Yiq4QYJNO4SGy3sD8xTbXGp6q+V79NWAM?=
 =?us-ascii?Q?67q9LEfw+3ww/PO5BdriIWBL+nkEvwNmPw7k3KHHZ+QQGyrKb9NW8iMY9DTF?=
 =?us-ascii?Q?sYcY08XzvJXISPPATiAzVdsZM2tnzmvvvllHwi3+uJaB1ANKH74EoWwUyXH8?=
 =?us-ascii?Q?nkf0mzLT?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgPSFb2SwGgB5wR2bxVPc8t27G5sprAY027tYZJzmI8VG3sIAjSgEVaB3XJC?=
 =?us-ascii?Q?JzjiTIp9sxLDdkH8xZXedCOpZE5EoDroolAA429n2GPmSeB102O4wDe5or5l?=
 =?us-ascii?Q?guR9adi/92wRszfcjoANGVmuB8hUntrhGUryPBMMeSc2ODTzmgFAPcU1EnQr?=
 =?us-ascii?Q?+nGWJLHHMSYConP/HeRCN0ACYk2sw6kQCtrOAglSmmayR4wEQPL7GbSbJ0Ws?=
 =?us-ascii?Q?qbZ56aKGSJXWAH3yRV24zHqfvtfH2iDqDnEHwTKwGXrhPxNPvOTYrzk0ONSS?=
 =?us-ascii?Q?bZ8s/MT+97aVuQuRP/FrV1NiNos80i6wBH6B5vEKFE6JVoJWu1lIIAogW9Wi?=
 =?us-ascii?Q?BWWGYnyF8Tcrh2pBaizGQV7J0CzkVs26JOKPcnT1+TKEQuSovXVb8oD5ndMF?=
 =?us-ascii?Q?eTYkVzGMxb6YsdObK1xPScz1D3jeM9hvUKfZmHF0n5g1YZuq427mH17hSvQF?=
 =?us-ascii?Q?vwAX6kMVRVusWoBEK9v0JnCqtHShqW2IhCVgiiMVddnfItAHGZSGSA9mdopF?=
 =?us-ascii?Q?cq5XSV65n1dpcLx2/xh6OZ+i2CPSj1jlaluVPuVgLxEaV2TIO2xh4E0KpanJ?=
 =?us-ascii?Q?5PeadIIvzcgBGPM7xmoMv3OPuMurR0RzZ+sLmIv47JVy4knx5SvjgWgsAJC4?=
 =?us-ascii?Q?kkROBqZTOaNshSr3fVT167+00Sa8EzZWb4AItCOmym98fTF4nGeGr5xmLKnU?=
 =?us-ascii?Q?kN+3oBZTlL77zRejYacfy0rPSjqQRdeRM+f53fm3mKWJyx/ZKEwBr7gsWDPy?=
 =?us-ascii?Q?cDD6o4N8OlJ7ZdL0eqNyTLX5HN2pj6mK9g+P18XFcJe8UCdwC5HmGWsYw+3H?=
 =?us-ascii?Q?E1Lc+HvRnqdGMrTB06rA2pKTJICWb36mlI1szk6ZQUxTvVis/vnb6MeffYJz?=
 =?us-ascii?Q?u2xWUWMVyBRSmxq6LHV6xVY7ZvwdM7RbUjI0N7zNRR1H4TBYYWwml90cfw0r?=
 =?us-ascii?Q?s5MkKmZPhcmik31L+bcIReaVVAteQIOwf3If8lUrRunIZQbdDJmBJZuJ91Xd?=
 =?us-ascii?Q?xz2+2GZ6OKtdxpZ3cSJFozxEVrZgNvq/mr1W+hvge1IAulqHpEmOm5oRwv9P?=
 =?us-ascii?Q?yNb20yXEMPMyA169uoV5GPTKOZ83XYXCe3RbC24eWZY/wqa40rhKZd30ixSN?=
 =?us-ascii?Q?QnmYB+fLVO6/5tZUsSld0UVKIJPu3+UzDYT/WVHWCEKY27+hB/phUEDfCK9X?=
 =?us-ascii?Q?2SfjQMXlf4KIdI9er763BIm1iX4CGqRzvknewj4HSAQIypaoiSkwpf4XXoth?=
 =?us-ascii?Q?isy5dIZf2qtqMP3hakujAfjt7344QvL3qCcz9sYpINVmac8LK05gRDw+wAWG?=
 =?us-ascii?Q?G4qpE2hh7E3s2G0UXFSbD7zsVlSyMPglgAZPt4lXQFksoYtn1yosHMf4bPgO?=
 =?us-ascii?Q?GwoXqqlpnj2RiCi00Jd5bPv3fq5Ynd2gTttxbzQR5vLKAeQ88g=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 894a782d-9f72-475c-8e96-08dee74bad33
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB997338.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 17:15:34.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9476

On Tue, Jul 21, 2026 at 03:50:58PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the battery tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/power/supply/sgm41542_charger.c:209:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   209 |         reg_val = FIELD_PREP(SGM4154X_PRECHRG_CUR_MASK, reg_val);
>       |                   ^
> /tmp/next/build/drivers/power/supply/sgm41542_charger.c:249:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   249 |         val = FIELD_GET(SGM4154X_ICHRG_CUR_MASK, reg);
>       |               ^
> /tmp/next/build/drivers/power/supply/sgm41542_charger.c:271:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   271 |         reg_val = FIELD_PREP(SGM4154X_VREG_V_MASK, reg_val);
>       |                   ^
> /tmp/next/build/drivers/power/supply/sgm41542_charger.c:293:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   293 |         val = FIELD_GET(SGM4154X_VREG_V_MASK, reg);
>       |               ^
> /tmp/next/build/drivers/power/supply/sgm41542_charger.c:452:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   452 |         time = FIELD_PREP(SGM4154X_WDT_TIMER_MASK, time);
>       |                ^
> 5 errors generated.
> 
> 
> Caused by commit
> 
>    ac55d04627d41 (power: supply: sgm41542: Add SG Micro sgm41542 charger)
> 
> I have used the version from next-20260720 instead.
> 

Sorry, I wasn't aware this was getting pulled for Linux next or I
would have noted that in the last revision I just sent. I suspect
I'm just missing a header here, which I am also missing in V8 just
submitted. I'll add an include for linux/bitfield.h in revision 9
which I'll send just as soon in the next day or two once I can get
a code review from a human and from the sashiko.dev code bot.

Thank you,
Chris
