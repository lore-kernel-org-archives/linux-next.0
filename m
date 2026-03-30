Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021134.outbound.protection.outlook.com [52.101.100.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E48D3D300F;
	Mon, 30 Mar 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877183; cv=fail; b=GXlrz8sCuEtVv0qM12BlgzKR3vGI2iUSWhPoZU42r+g/VlKGiO8fKK+B8tU9rciYxgm8uL3Z6NzTDqgUFbr1MkMgaFiXwq8wQ/fV1h6IbnVZTvRETMZtGlB0su4wXOCG6FUlFzMTaRG6of1WuE2n0TbUYQWZXEC5BP7+gcAILJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877183; c=relaxed/simple;
	bh=WhSbH4sWKh6364KDZZbP/NW9YKldZArKN0/aFPa9nsI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=g9sIGvWqdO1s7dKvpx+DEzj5KUxg0aVr7kryNMTf9W2/TypE0kA7iYWHFYCgCheW7CknhH7sCZsYHywP5Qe2kCMj3HAp2sDGxwjDYkMt6o0L7p5VsAri/iNVnGWnFmjXEufvuGf/hb1h1dh0jGaTLdfrkOBMZgijVxKss9ezGqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pKs8cvMh; arc=fail smtp.client-ip=52.101.100.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pKs8cvMh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPFu1c6mwXhsrVmKmVkvNcWHcW71zjRKvV2I7Wm0s0Qq/yI+VVTJ36OHF2Th0kaRriRcOaFFUwjuAtDrPtXJIxAnHvh8UoiaZmw5LIUz0KFf1SwjgNbyCvuX7H7CkS1BYtfnXq3K2vQfkvI4BeVHKW34qrDvfIk5+jXbexytlZTABVVjyvce0vhS8res/iV6TZgL1Tk3W4dWr1ESVEn+y8o31UKzhg3IHUbr60WzEBfQ2O9XL64ImnmS/F67Im+s7brB1mFRjY4+a5A6ROxeRCR0gmGoXsA54H2SJPwdTuC4LZdIHG3BkoeyFJWB6sDYPrmhMe9bHvD5MvbaMICztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBJN0ruFvzAIFatM2DPc+mRn2f8bs3Q7f00FYEl8760=;
 b=JsMGaF9Reg+1Ms86gh1LJ4WtcjFCFmQkjbc0AYyBptd+NSYoDZsHh34CixzWh5S8mvkymQCtBC0Aca4NIKDiYiLAYvR0pBaoRxsmhNxISAbn65WwULacGhZ+fONxMcfZEPmYkESRhaN+1orW73EzEhLF6whD8Qw5axHVQjhkJ4MmEv65ePaXXwH6+3fryrto9lmHkgwtaQKS17jHLvisekGZyIJFvuE8M4uET+M2azh85eauTzvfmwxASNsfIX4pAqCkUn4Rr9f2hdR9mpUdqtyZfnN5vmv/G1mz5dRs74fsEVQWZkG7aEeo3UcuGKyXFoA241/1tNTPOTDt7jlUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBJN0ruFvzAIFatM2DPc+mRn2f8bs3Q7f00FYEl8760=;
 b=pKs8cvMhseEcP5jqzInejLd0HLKrVXGnz3GHc5ppIApd1XgYj0k5NJ01eRMjKpZrECa/y2HWCG+na2MPhZwt14bTWw/70vEqnIcOBBq8Eb1B8DTLJHakDN9HxRFg3aBKUmnFxhMRzD23MUW+X5IERlLeh00PvsHGNNvTbBkDuvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:26:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:26:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 14:26:15 +0100
Message-Id: <DHG5G61H8WGB.1UL0YPOVFUWFO@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Mark Brown" <broonie@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the origin tree
X-Mailer: aerc 0.21.0
References: <acp4AY8W5_jOo56Z@sirena.org.uk>
In-Reply-To: <acp4AY8W5_jOo56Z@sirena.org.uk>
X-ClientProxiedBy: LO4P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 8381a230-4e61-4e56-ae09-08de8e5feb7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H4Q/TiA3Ayn2Gyua+nZ7w2++xGhuZHu4EM4f+Y2vyy05Uf5GvoRFshgiV/SZPuPpUPJkOtldqDkwmzQEIl4ouM6KWGoH8MDACeirdKJgs8WYYDGY/9E82UR/enwUPgYOA2aGK3KpuAkMYZepcIHYZ6MB34euXO9OqmFeOb0vFGnO1dTau5il6xrrzHY/XYJrpN5xkQoAoJUwQHo6E350+Gi/+eGb0VIPAqG9sQF0+jRSja6JQpnauzeS3SxeEZpJ3tv8da+QOPzolehaBefe0rUwaC2GGT/y1rm74JW+26CnPFKp9AJoFiQRJdDBApKnkZYNLEgpOpTQfq5xCetOD7Rezir4uvib6F5cuoVMvF25E9FAhV5dfczg+oA7xhgE637CQvq0c7HvNZZU2SDkDfKJd18Ab3Rw69+Ywp8EcPIlS9AK7GQgfSAH9rUsw9+X3mp5hr3fxIItthrFjfoQxA4CW8wTiD8kn7RXEhCjPlA2CtaY4oW98oU7fnb5/tWmp/4px5jXt5QrJsc4Rqqhy2oCf4hoaLvZfvjmpRCcXG0LeqoIJVC3TYSykU0oUg04mUKT8IRTWtBoH6GYgHMKkwTcK/+MJM/ZMYvLsOZaLqDJ8t68P5hLAplZ6UMOvcD2F3pshdpOXf2rdcJoYB7k5yzPpIu5Fup3GYUuh2J4bXeWeWmEj1SFJSZV4ToOeFjd4d2wrDjDngB+R7d8dtfFZ4JOyAHm5pD0yy13ceJuBNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MThkd2YwRzhBcUtIdm5DOG1yQmdvY1ptUng4bHZHTlU2d0JrSURlREdWc2ZT?=
 =?utf-8?B?UlZUQ0NyS1FFK2RwQmNiRDlLQXA3MzY3QnN3d1FsYWQ2UXdZbUhIZGI2MjYz?=
 =?utf-8?B?NCtXYWpoOUI3TEx5bGRTTHMyd0xGd2oranlpT2J0N2NiV0RyRTF4OWMvTWZN?=
 =?utf-8?B?OHlOa3k2bHk5Mm9IclZZWEtzaFdlcCtjdmt6Qk5YeGJ6OFR2WHpvdVFoYlV4?=
 =?utf-8?B?VXVnNlRvUHRCTzhtdGhNSThqc0QyTFJTay9acjg3aFJwNVBQdjM5YWMxTWY5?=
 =?utf-8?B?Zk5vcVdzYVJaemMwVXFEUi8vMk12Uk8yR3Rja1h4Y0Z4WElMM0tGNmJWOGlD?=
 =?utf-8?B?d3Z5RkhpM1hXcTdla3RoQnprWi9ITWFGeEZPeThoUlZoT2MyNmFjZmx6anVi?=
 =?utf-8?B?M3BmdTFlcGdiRWJhNFpjTjQ0RVFLMEpZMndhT1VjOGE2WVBJWE9VVzRYY0dx?=
 =?utf-8?B?ZDdXaHFsa0tZakpLMEo5Q3pMYlA0Q2NWeE10TWFsOGhkY1hpSWRmYU9ISEtX?=
 =?utf-8?B?U3kwOGRWbk50YkV0WmVJTjdTdzFtSGpveVB6WVFyeGdIdHZlOXpoa3A0NEZN?=
 =?utf-8?B?T3QzSldSeHBuWE04UEVEcFIvZDcwQmNEVjgwYUNJeU85cTdmTVRpTDhGektF?=
 =?utf-8?B?QUw0UVJYZjJjVHpNb1pqc0d0TUNydWdueHNNangyNHZEUTlhR2dFaHB5UjNi?=
 =?utf-8?B?eHV4SCt5dm13Y251OEYzbXNhVXRQMkQ5YTlSYUNNZUdER2RzN2dVYjh6L3pR?=
 =?utf-8?B?Y0tIYWVSaUtVZHB1UGN0Z3R2Z0JFN2FzVm96Ym9KOHRxTEpzQ2JVZURtRUlS?=
 =?utf-8?B?TllwTmpoQ3BXemNETW5ZbDlzK2xzdXN6TXVJcHMrdDFHQ2tyWTV2TlF2UXEx?=
 =?utf-8?B?ZkpSSW8zR3Zpa3JHUzVPZGcrQ1BSbFcvZktGc3U3MVpOc3dHazFoWVcwU1pL?=
 =?utf-8?B?bEJHUDZRUWUydWJvYW5EeHVBTDJnTDZwZFdmYWN1RUxtbEg3Yy81ZHNaaTJk?=
 =?utf-8?B?VjdQMHRVMG0vc1hoc0wxN1h0U2JubE5aU1ZRMEExOHpKWVJOcVJkS1hMMk1o?=
 =?utf-8?B?cXR1clN0akkyTUZFeWRtYW9wOHA4TGRPeUdaWHdIc0lIdVR2WkM3aFJheVBi?=
 =?utf-8?B?b3ZpWHE4Szl5WEdNOWp4WTRzQlErYW04N0FYV1FiYVpPRjc3cXhwY05aZkZS?=
 =?utf-8?B?R3VtUnAyYldCeHZZY2I1c1dwWDZOeXdid3dydEhLWFFGSmZmQTM4Nk5GN01u?=
 =?utf-8?B?a2FJSFZ1TzE3azdHRjFvU2NMRmo4YlFkVS9xZlBsZDlGWTQ4dThpY3FmWEtN?=
 =?utf-8?B?eGJZazNPRXFNcEtuTjVlUi9JYno0YjJiakt1ejh3TkY1SC9nVk5yQktNaVVi?=
 =?utf-8?B?ZXQ4LytDbmNMV2l6VEVSbDV0K1RBb29naG5FWjlLWmcxYm1QTUtVcCtwT3N4?=
 =?utf-8?B?dlpScnBqRjRFeUs3cWFkRTFXbHNZWWJJU3dHTk4wL2NPcC9DcU85Vkw4VUJR?=
 =?utf-8?B?Zng2cGlOS2Q4SW9uWk9Fa013WTl2ZlNEcjhPa2puWjcyYUlYVEpZZ29ZKzdv?=
 =?utf-8?B?WXFITGZGbEtxbTRYQmRodmRYa1BKUHl4dDZEcUhua1o4b0R5S0xQUU04Tng0?=
 =?utf-8?B?dmdLR0pWMGxrZUUrT2JOYzhXQTRsdHVnWExXRE5uVDkrWUJaZ2Z4d25BanVi?=
 =?utf-8?B?T2dZMHBCRDZtK0dtejEybmJuTEVyMEpYM3oxSmE2VFhGdk03VDJmVHRhWjRY?=
 =?utf-8?B?TndZREVkcW5GckJ4L1c3eExYaGlrM0wrbE9rZHhVc3EvaGFLOURqcWQ3OHNL?=
 =?utf-8?B?amRqRzlDRnhoUVJNR2xHNnpBUjV3YmhBSXVpalVSRXJoQVA3eEVFQkpIb0F0?=
 =?utf-8?B?eXQ1djhFRnZNUXZrQ3dsVGovSHYxYjZOQXJ0VkU1V0xTd1lTbG1NZEJmT3pp?=
 =?utf-8?B?dmNnZm00akJEaTZTWHJGcWo1N1M2dEMxOWUwc0VBdGEyQm5vdEdsdmp0c0p2?=
 =?utf-8?B?bmIwQWU0RDIxQ0UzM3lvUnZoZWJSSmlGR084cjdvK256OWxYcjNiR0NURDg5?=
 =?utf-8?B?YTNBd2VIbWNSZFdYcnVXSkM2VENOWUhPRnU0QkhnTFd5WmcySURYYUswTDZr?=
 =?utf-8?B?L1ZDL1FNaUJ5K2QwcHQrTTdGeDFERFJuTlkrTTJUVzR4clZvZFo1UEY5djk1?=
 =?utf-8?B?amRqcjVQRkdYZTNOVFNvZkJIWGcwVXVCRWJ1N09UTXl2SUdYeXVEbHZmUjVD?=
 =?utf-8?B?Y2xXZ1Y1bFZVYVB4Wk9wbVhrSytqV0h0VjhSOWJXVmZOeFhmSThGV1laWHVw?=
 =?utf-8?B?eUFEbVVFMDN1NEE1bUs1UHhocTIwK0NES2RzKzJROGdYVWNQRXRqUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8381a230-4e61-4e56-ae09-08de8e5feb7b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:26:15.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0Btp0AVXAmsHMHKoZiHCiOT5BgVN+LCb/QC0WCZCshQDF7xpzDv2Jt5jWUnoW4ghC3CVQ0Up16FMgmOL2CLLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7402

On Mon Mar 30, 2026 at 2:17 PM BST, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   scripts/Makefile.build
>
> between commit:
>
>   f41941aab3acd ("rust: ptr: add projection infrastructure")

This commit is in v7.0-rc4 and later. Miguel, perhaps do a back merge to re=
solve
the conflict?

>
> from the origin tree and commit:
>
>   560a7a9b9267f ("rust: add `const_assert!` macro")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc scripts/Makefile.build
> index 3652b85be5459,a6d1a2b210aaa..0000000000000
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@@ -310,7 -310,7 +310,8 @@@ $(obj)/%.lst: $(obj)/%.c FORC
>  =20
>   # The features in this list are the ones allowed for non-`rust/` code.
>   #
>  +#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
> + #   - Stable since Rust 1.79.0: `feature(inline_const)`.

I think we would want the lines to be merged on rust-next. This is fine on
linux-next, though.

>   #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>   #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>   #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> @@@ -321,7 -320,7 +322,7 @@@
>   #
>   # Please see https://github.com/Rust-for-Linux/linux/issues/2 for detai=
ls on
>   # the unstable features in use.
> - rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_w=
ith_arg
>  -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,inli=
ne_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> ++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,inli=
ne_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_lenstrict_prove=
nance,used_with_arg

I think this is missing a comma between slice_ptr_len and strict_provenance=
.

>  =20
>   # `--out-dir` is required to avoid temporaries being created by `rustc`=
 in the
>   # current working directory, which may be not accessible in the out-of-=
tree

Thanks,
Gary

