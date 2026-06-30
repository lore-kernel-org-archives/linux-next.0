Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079E416D0E;
	Tue, 30 Jun 2026 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825351; cv=fail; b=kt9XdkCKwxuB8VFVHWq7p2d3c92vFvdYDQQGRwJyHkZ9ykPtru7XOqfugWP0hb3gZGU9dreVGIuNGuxF11xq2ggZ83lHesYUVWlBN0CnIvFjrz59rQdNGRYzT9iFvl8/MLxTorEh3rD2sWqHmyVQdkCNdPfrNCWLrtCIH8/Ett4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825351; c=relaxed/simple;
	bh=6LyYpzUiA0SIjIG9X2D2zVt2EKibufukkPOgoCNZaCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PMTqOPnRwJuJ5gMNWJo/BFAG3fDT3bwrhVRnB+65BU5dTZQJFkpfXsovz39zQZtho6c5WtDi3DmR4uXA9ki8IFTNgKt7H8Rgb4dUZtBbvBH/Oqawm0qYWGJMs27KKR9Op3sCHIn+gJPYudAjBrfnSsprHh4jEaY6J7rm+R405t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eSGKp/u6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bmxyj0G4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eSGKp/u6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bmxyj0G4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UCfeBI141447;
	Tue, 30 Jun 2026 13:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=26gWOohM7Yav8r+TWZV8DdK6Qm1K46yRM264Bfoa0Ho=; b=
	eSGKp/u610iiSWN4ztq4SFiKUK2urGYK2p8qRjRX27Vp0VU2689fRPbcYWy3YIk2
	fFouOJqLK5PGjpW7vuUNRR9QftKMXW6Ug0C3zi2HkCv7lbQ0r7E9VHNggBIFbcjt
	is4+wouyxMOOJXj3PRDN6pTyXh02k5kN8mWn0IAL4VVQ0fTTI06k2/M9RieH+VCa
	9eyuS8aw09zzRYmzf5oi242jo3FKITmKfOOny7tLzf6yX0fSvHJfrtqTgO616B04
	0ULf9sLaPd7j0sWZ8AGMWHldpv9llWqgNQy6x2wkM/Az8IvnhiALNJNwhsBOA32b
	o8yGWDrrw7Rz0J5VcB1IXQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4f26jq45hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2026 13:15:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65UDD0DN040084;
	Tue, 30 Jun 2026 13:15:45 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4f24ye55h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jun 2026 13:15:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P634g59rVeNu3s4EJgvd04DFl2oizfz3TeG530zFUtgoZhZv6i8U6Xosn54UjErOWHuHVpacndnDF6q/2Mn4/tKsLq3x0QhhfxY0rfgvLZymv+OQw2zdegBZ57UcBzpxriA714u8INtMFQivY6pdcymEl10u7yDqRL3853g5J6syMuZCWXy/sOEJOIDCOYk2PxQHhaMm3JkXVeimBKMofco/tOJBOqg0ZeijOUDlsE/pp/SdzAOYZfqCYE6dKP2Y+kTUta814ZEzPaUfzksbwjcWtQeYCxbNaWSLRF621bix1dE37InBVlAoodztzFf4YHr/eBNKh6d6Q7AuvDltaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26gWOohM7Yav8r+TWZV8DdK6Qm1K46yRM264Bfoa0Ho=;
 b=Ne9RLSZYz+CXZWbJzfD+uYZs8V8fmB/asdc59hJKliySIs2snILJfBjpJwPNXRv1W1sJLyZ0mnl52JldRVSrf6LVuUyH9ARkeIhVYzn3qYzi65Cc9+mGwZf25BVCxpftkG23FF+pPJuwyESwgV/MDdq2aoLi34MVv1bvt/6z57zuZYatYPR68DBZcPmZmFCvzySVCs9V2UpAiSxG53GF5P2bcf0iary5ubSUvA57mr+EcWOIBwl8X3HYMaCVGthyQg6MgT2zMvnipy0caSKNoL1dJ+gMaCKu2P1ctYx8fHYTqXgNL1oQApcWxMechXwmkSSdwZ1Dn2AecPyuslNp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26gWOohM7Yav8r+TWZV8DdK6Qm1K46yRM264Bfoa0Ho=;
 b=Bmxyj0G4jiLwYNBiGNw47ALlVWmR3OuZmeMgqd8k16VCL5FNtEEy2wvJ5iFqzw3HM+fe7M1yOLHv8uqJLIywwiD5LI7d70DCe8LFs0ujpYkrBVR0d/QHnVPk+PkTLPQPQeql6btvgoZ+J+Vk8auXEwYUA5dEgFNfWsTHZosQFXs=
Received: from DS7PR10MB5134.namprd10.prod.outlook.com (2603:10b6:5:3a1::23)
 by SA1PR10MB997605.namprd10.prod.outlook.com (2603:10b6:806:4b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:15:44 +0000
Received: from DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::10cd:e055:a053:ec92]) by DS7PR10MB5134.namprd10.prod.outlook.com
 ([fe80::10cd:e055:a053:ec92%4]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:15:44 +0000
Message-ID: <8c827da1-fa93-4f94-b553-873214a25175@oracle.com>
Date: Tue, 30 Jun 2026 09:15:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Fixes tags need work in the nfsd tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <akOXz9FI4le8d5FT@sirena.org.uk>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <akOXz9FI4le8d5FT@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::18) To DS7PR10MB5134.namprd10.prod.outlook.com
 (2603:10b6:5:3a1::23)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5134:EE_|SA1PR10MB997605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4a373c-902b-4ed6-ddf4-08ded6a9b0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Rr+wQqxK4pIWI//GKl/PCnwjh/bRvy1n8fLF9htZCv1mMlEOBp7ZrteDBLuyXrCUcC/bBb2dPKjrnhpRyGuqDWbDj6hJgAgSywP0ub/IISOUg1m6OjaHxgLPTjF4FKHuXUS63OI4L+b3JEGEaG3bhYiFex6IFpMOEAcin74dEtWzJFg3t35U0sEDcHOAhvzMdhKHLRriZ2rW2t8+ZCDjGkf28GrZA5Z0jJVinBjuMQzXF1w11YTI+XfY1eX06D+Ahlxj72UmFUygvmtRKRsd370EiKmK1lHEdt7XVqbkml9sJQoqGbS4KzQ3irJ2ZL3AnzsI+9nG1ST4CSR6g4OqMeokDe42brM8W1qTPbUABXwny1LVnvEkipAZIMzUiautaWUWwkhoua+UVkxkY+cS+Oxiv6hgDAHMwkrhMgA1lHDJMsSEwAeIUQIb56nKVXK2eQkdNQ6z3nUM4UE9TUH5jvoOH5Cay9/yXpN7WWAgHLPlKvPSGlJpxneXiFxa81kgETsnCfnQzN+WgblAaqVrlvCwIfS+pK6vdKLfQ0m6NAeztLIf2EYNomPdAwYOfqN5zWgHizaQ8G0wEA3Uze5bCdD59IMj+GfuyjNsMjF0wFytbIGOutrrGzFBp/aUykCKYYlnTezKeSHEklB+1BROpwsre7AE741GQlcX4QT2reo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5134.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmhoSWxMS2NaM2dEdERWNGMvYklodEYzNGZWSzAwUCtYUHllK0VmZ3dLZDRv?=
 =?utf-8?B?U0gydTRZb1NrVWxwU2VQVlJqWkNYZkZiL2w3N00vUWR4c2M2c09WUFBFYmd2?=
 =?utf-8?B?RkVxcGg5eXdheXJWaTZKR2MxNEZwbVpHdkdjVW1nQVRpSnFNQTRsS0EzYWtt?=
 =?utf-8?B?cDA3NkpsRm9EbWFiZUZYTDRnK1RDZ2JlSnJaSFpjVkRNMkI2QWgyWDlSaG9T?=
 =?utf-8?B?aUxkYldjMHVpMVVmcGxqajFaUnltd2ZHUXpnbEE0UENTTjdlWlFsTTg3YVpS?=
 =?utf-8?B?U0FOWGlZTGxOWitzNmpXTDRFVUN4aitGM2VKeW16OXFkbGhLbDNycExpdGhK?=
 =?utf-8?B?NnlVOFAxZW1lWE1GVEwyaEZEMHkzcEVkb1liT0VhNUdhZXltRzQ3YmpZWVBj?=
 =?utf-8?B?YndFZHZBOC93NFY4a1E4NWxweVJZNVZqVWtaZ25aTzVZUDBlQWJzR1hpUjFy?=
 =?utf-8?B?cFcxbk5NditFdTAvd0tUOTc0cEtQVGtWQ3M1WE5ieFhjNWtpZjhHcUR0dnBz?=
 =?utf-8?B?RlRDVk5ERXdwMUhLMGduU2hldC8vaCtVdEpYNFduUkJkcXBKQnUzUi9OQjMr?=
 =?utf-8?B?ek5LTGZmb1Y1WWJmZGFxRVZYWUhTVVlBYmlxQ1JrSitrWkRacU5mbVl2bDVv?=
 =?utf-8?B?WUdJaXEzZEFBd2dxbHo4djRRWTkwK09jWVRNQmhTenFvWFAwUmM0TGczWllU?=
 =?utf-8?B?Qy9CZk5zM092Z3Q1SUQvOER6aHdyb1J6bHNMRjNiYkh4VmtoQXFhVWU0S0hP?=
 =?utf-8?B?dHIzK1Bwa1FyalltVjNVc1JuSjhYMS9PYzloZEYxV0x5NnBrRTVsanNueE41?=
 =?utf-8?B?Z2RiWmZmRVVPa044S1VjZEkvVjB2UVhpRnlMUzczQkEzdjF5L21mVlBFR3NK?=
 =?utf-8?B?TVZrb2RxOVVsbDNhQVpQU3ozeFZadk1qV250L3dFSDNyMW4vMmZ5cjQwQTVY?=
 =?utf-8?B?UHJyMmtBT0d0RmxiV25UQ2xKZ1VtSTJBTFFyS0xtQ2FpZUU2Z1ZyZGpabzlP?=
 =?utf-8?B?VGdKbUYvelFXRk5MMTdjcEcyVHZ0WmozNVloZXRaK0k2YktDSnFNWlcyL2pQ?=
 =?utf-8?B?dTNsTFl0dGZuR2FCZER2anhOVnRzcWY1WDdQQjZ6a0llTHpnVFRRZXBNcHBV?=
 =?utf-8?B?YUwvRE9BSzRQbjA0REZsendlcFJYMWNmRDNvdUExQm1ZbzZETDl0T1Jzb0VH?=
 =?utf-8?B?Smt2dHBoeElJTjVwUjNBNjNuUW5mRDRDNEtiU3B6Zy9TYjZodXRnczFGN3BT?=
 =?utf-8?B?ODhZRUQ5czMwd2NoazkySktpcjdrd3owRzNzS01LYTRTbGZIQi8xY09mbjF2?=
 =?utf-8?B?d3pKUVNYcEVVZGRmK1BjWjNkL2xxV1ZxYjhieEtUNXluQVlzNU01MUN6MzdB?=
 =?utf-8?B?YXdWd3NhcURPRmVwS3liNnFoUnRVWFE1dGRaUG8rQWdOQmFiYjdrOTVZc0U3?=
 =?utf-8?B?Si9kanRDejNjbFFseDlLL1dzSCtjbDA1M1ZEUWp3L040cHhNQ3cyODhOb0pX?=
 =?utf-8?B?QzlyV0VoUHlWU1BoMExiQTVJSytNNllyS0lwZm9oeWxCbEpqYTh2OTg3R2gy?=
 =?utf-8?B?VVl5SHYyRkpwb2hXeG5RMDZHUnZHKzRvZ2tZNFlZc0dreXN1d3MzaWQ3Y3J1?=
 =?utf-8?B?RFVUMkRxTHM2NHBlQTd0b3ZQOFNZaUZFNnlFQzZtajVoZXNOeTJZbkFQNXoz?=
 =?utf-8?B?eXZ3SGV1aTN6a0JBRHlZMWt2eWJvUG1YSHpQOHQ3K1daU3UrYm5XWWpmQ1lK?=
 =?utf-8?B?a09yQVE1Z0xuZS90NXBrQnp6RUgvc2JXcTNkM1dNbmU1ZWIwTjNOSHFIU3dY?=
 =?utf-8?B?VFhKRDN6eHRtKys3K0svRkZnaGYwR2ZqM3NXcUt1UUJ0YTZlVkxiZ1hVWEJw?=
 =?utf-8?B?OTczc1dnd0tWK2hOaDU0anI5UXVYYXRwMDluRVY1dVNUVDJOQVNwSm9NMVBj?=
 =?utf-8?B?UWpWMWo5L1V4Rzd0bmxKU0ZuOE5uQUlkZ1hiS01FR0dVa0pyU2hQQlRlNDQ5?=
 =?utf-8?B?RmVQWStsN1pLR05MZHhPRVZLbkJqODhFWnFPQzBabkYyZjBUdHFGbnJSM1la?=
 =?utf-8?B?M2M1OC8zdVdjaCszSzVIT0Z0ZWgzQXc3T2R3UHFpYU5xRHdaMUVtZXg5bmRk?=
 =?utf-8?B?Y2VKZms2M1NtMDMvQ0Z4bmZMZzBYejB1dnNFOFRVNXA2SUk5aXNTQVpMQjhW?=
 =?utf-8?B?Umh4bGZvSlVQVFFSQmFvM28vQTJPc2tYVlRSRGtvZ0lsZGlTNVJUYlZzNHVi?=
 =?utf-8?B?MlFSWVRRZ1JQOHdnSXFiY0F6RmdSSHZXRVc4U1BzMUwwSVovdDBYZ0UxZjBM?=
 =?utf-8?B?clowRmdDeWhVdGJFSzhrQXJaSndxZVVXRjFZaGQ0UmlJUHBjc3JWUT09?=
X-Exchange-RoutingPolicyChecked:
	Cc61BX5HtZfdfvzinaWLYKtRHTuLXInqo+YddpthCoJTfKFIUy7uKpA5ciFZeTS6RWMY6/HrMvp9nWqecKpMHQXoElEA3vKpgXwA22s6qQ6moyhr9sNUm/VIynEGxIm5o9FrF+P83cXTIWBDikQYL5CAPLyNz8qntq6R/1ctHGBjvfMZ4aLU4q3YawaX9/Ad5tMDiBQ0CpnPYRdqhdYuPOYWfXaqwe02pgCulJ6OYQ7mu5gD2Wrk+fg1loJYE3Im9FLgnuwu0jycBsWqra2q9syui9rozijxgWjmxD8GQm2pYj2zI0CqF4Vb2FekvKcwYiC8VFMMf0nJAxsevN4kWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bCCiSgcuwYBHOZ2VJ7POQrRb+OGLnSalo86PwZwpglLJbes4kw4LUXxV20U37k0EOFRSOcPZYlLqNbLvvYR4qpOCepFFQBzDs3JZoAUo3JHdwb0xScRSgYTLr3mA4VaQP7TOcvXhCXocacww2zzzEK3IzrsKG9EujkJ9vLQ3Qtp6mRyjKFn5Pqc029UfYDienGL12zRY7qf59p3pxDcb5dH3UGSm0i7TuLsdcRd+E9UL2VrckCST3JU8OZn46VsR/dCrI3J9OEfEsKdp0AqRJfPl5znIsgS2avXU5y/1GAbUkF7e6OBti/J9787n1UUJ37xnG1kgRXezdfKC5ByLaBUjy/xUIt+wxHHd+ARC6m9PMvI1eoJCqXcDEEJB0Ulm7fyIwYZ6ijxqptDA5mDb9egwhlTzO+W4ymU3CDxdTu+NmKFmg3X5zxIgO5sOGz3S5jEdGaz+pn++qn7+VokMQgKkV+VjbA2Ql64qnihkJoak7N0x8qMx0HBkRwIsNohW/2I9v8Z2C8tBDmW581cQ7MTYhEj2HEkn7aKdEPtcIY7BmYyFuQ2v+4X8zueWvzINvIisbC0Y9cH7XOWQuDJvJKkZYXSATcezaBNrw4jsrb8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4a373c-902b-4ed6-ddf4-08ded6a9b0e6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5134.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:15:44.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yz4vJ2T8Xmj6L3j4iOyI2/iQ+nf4jrIKevPWFsEIX3Faprn10NkX7vI2Pbdje/QxcN+9Tr9G6dMCOEavsn1VYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997605
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=774 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2606300123
X-Proofpoint-ORIG-GUID: wfaaiYiJTy8eEAhd85cPeyC7B4L6cImx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMyBTYWx0ZWRfX4YJqtE2Xb4Jn
 /kUZ7SD/m2uJ8s1spBZ6nRW4mfNEFR6SkeaQtiN20/snCP/hxDZtNNe0nkPK2rzWZp/LL+IDKuf
 gvFpqwSJ8bnWYrRJ4P827yOAWN3MsLAq7+TGXXPf7dRtJFQEvxERWu9fuRLckZrecbWqkVIPnGL
 c3Z8B3suxM/RSjU3rAlB/whx4LT5ko9IqUObVu1nFyheIi68gGy5kNKBCT8i8qICEVuXWt32P0N
 tvDjxARlu4uS0aQGA5XyXXTG0MqHKn4rNI8GtYFxx4bHl89lnPBgROx86/nI+2aznHFn7V1OtNm
 G4lcBVPHUWiJCf+NeIg3x5nAu0qTnb+VZtJakK3hNT7Z04qyT5i8AhT+KumcCopn5e1KQu0KQ0T
 RNBP6llXYyEFZp150X4x/ldEM6Nj6mjV1bwUup8DQ1PcOREzOdwZ1TGueBC95ZpMj8vDE4vtYvu
 Rn0Uo1tmx+ZugxTNAlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMyBTYWx0ZWRfXxxL7KnR8ujw/
 7ApdqEpk4wzfsguDy6YpfuYEZVDt3/jOEI2bvm4/Ebw6p4EjqDKacTszjvNSrV2OY1Ewo0ntqnL
 sA2f0LMsonCUYnTk5td5Tol+ldigUFeE0jqt1uuNaZiGIxkVgA09
X-Proofpoint-GUID: wfaaiYiJTy8eEAhd85cPeyC7B4L6cImx
X-Authority-Analysis: v=2.4 cv=XrbK/1F9 c=1 sm=1 tr=0 ts=6a43c182 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=vzEHfqdJoK0itp5k_uMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10

On 6/30/26 6:17 AM, Mark Brown wrote:
> In commit
> 
>   296c5e5960b55 ("SUNRPC: xdr_buf_trim: clamp buf->len to avoid underflow")
> 
> Fixes tag
> 
>   Fixes: 0a8e7b7d0846 ("SUNRPC: Revert 241b1f419f0e (\"SUNRPC: Remove xdr_buf_trim()\")")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Thanks for the heads-up, now fixed in nfsd-next.


-- 
Chuck Lever
