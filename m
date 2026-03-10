Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3843F30FC1A;
	Tue, 10 Mar 2026 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157359; cv=fail; b=XRmZF4Bi+ilR/xJpDTPfq+6Nopidm3RO4Dh1+BHXfN2jBF904Q3/2cWw3df8BcwUw+k/ajTZkEy0M1hJhHwIHOxHnjO7zczVzHhk7Yh+/XGdKLDXSyjBGGQCvDKRRCkO/TMAXXCfFe2evPkd0YQ1N8Xl3pLLu2k4TLCH/HqvjKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157359; c=relaxed/simple;
	bh=TMdgRwbINFmytOs2Z4LQ09VNUplV3glNPVQ8mRSDIBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IqMLYWuz3besjs1UdBAqAt0EplPLXWcAxJdT50Ur36Ae7gy+ZjKAg0VZ1PbnnHHVswoY129A9iSrOZaMVutXfcuqUnIsWOHTHYuVdWBTlrzv/SAMuqE5BXfqJVUhcX91emw7Tez8FBwS+zoM6mjO2+y5KZ0X4ZqJ/5F29/uBtRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2u1ENtDt; arc=fail smtp.client-ip=40.107.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2u1ENtDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vpff/TAC1MnDsCV1/4HgCy7L8Y9NcccobCMfjcpHeUQ7TmnE+nqMQyWZdyTdp7jHwr4R1KxznzIjstg2be0kn2Jg4Gvt0FP+SOjMVLO1OEspy1ns9ccOkgE2/KQSq2Ww7mf+uH9HugpgjgpGyi6koAoTdB8QuXkSUFpnThQp3X4iC/ReE+Y1wzpMkWKQdofNe2bE8kL+WQe4iCHcPphyIzmqAk0hGV6MmJQ9ttvfwgy+fFwCrk2vq2rz+mvBXfR5Q91uR0WNk12xh2CAg33I+p7cKKBaednjGMp3g1gU2v9Fk5SS/JuVoR1ksm3J1OEwqCXz7Di3Qhk/pQEXZqJLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7o1Sk/kdcr8rrBkH8jEzijd2b2ZDuUMrgSLPG1h4WE=;
 b=BK7ZMQsSC7azERG5M67w8KT2yDCfLxhmQSmdhLuDsY1/q851Y7/Prfa3T50RhwMhGlCZgt0JcMLCAyppF4CB2lbL9qAKNtlv7fxvtmpSOuq6MNx6iEGxxTIrUXv9p98UJ8AnSxZ3cGlx2/LEsHrMjwULqgTeYB1Iha378AqpmIlHVbNHQCaxOedOPtpP6+jqLBc1qDpK7Yp7cF86gqopS56TTjx3vT1VcB1jVCn0NXVrzkBP0GPuVVG44cPPAROsTKM+M2JEvwsCc1sp+YEFrrBWBgwKuOwDXiLvbiyQbyOF2upzUADvp6yDrV2axYRClGcOgIasBDt/Vcp1PW1B2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7o1Sk/kdcr8rrBkH8jEzijd2b2ZDuUMrgSLPG1h4WE=;
 b=2u1ENtDtSLj9jRGUMqDHF8VKXgyb+ORNbhb9B+mducGKUcgH0ikekfHoS9XKxbwp8L+Wmf9hyRzPnKO+Lj/Vl1LVlFkqKMPUFAJ4Vam6D9g9gGkRCNAtyO/3Pdob4uqZn1T9LT9QLWCELUzHt/WgwGaIVnMHp/QQAwEjubtM5Cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 15:42:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 15:42:35 +0000
Message-ID: <0bcc65ca-bbc3-4bbd-b2d7-afd4a559bebf@amd.com>
Date: Tue, 10 Mar 2026 16:42:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm tree
To: Mark Brown <broonie@kernel.org>, Jacob Moroni <jmoroni@google.com>,
 Leon Romanovsky <leon@kernel.org>, Dave Airlie <airlied@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abA38r3vfTOr8_Ks@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <abA38r3vfTOr8_Ks@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: ce63b5f8-dd76-4fa6-cff7-08de7ebba668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rFeDqYqToH2iAITMEDfK8n4J5IS5yD1oTTof/y0KA1fhdugBJVEqSJEQFM1dCcxl2jd/sBsNHqPW76rwJnhqQtokTcY1nc3ESPb5ltOLnsFJBx9P4zpB3YXq/xs6kIaTVRxdUESyC8ZSzjebBvRxCIhaJh7yKY9k43MFdwF70e4CNFEgWIyIsjiOqbUb2Zxk328KBeNHk2A5chIHxP8Wuj0h2/l2AAWSEoYLnVyZOKYqQ9WvjQTM2yYSSifyO1xfN7eGhoayFcKpjOhZ51heph9qluwBJ2S4S+C4k2Z7c6khDqo3MwUabn0duW00we5JbhQC6AlLoJTjz+b8ncgTdqZ02EZew6/MtjuH7keD/yqexHD/DW9wOwp28Wi7SPhqicMg4ZlWHt9ZpezHbeHa8E2zjSBHjvyRZyuhYEliowR6q/Lynq0R+ftc5Sxk90NyOftiUhDDFhv9aUdfMWfZo2IXkPh4Z6ap60iMAl2FN/FoDrW69HWiqHrBelACH8047S/pMoBKDZrd8ddMXv4EsZx6fIEPGruT+Sw0sA95eHSNniEfrz6D2fQXR06J+9sbp0GZkckPU4Y41eMML8XSrsOX27RODns7EtB6/Rx4l0bG78Ru2CV9I2sscIZZfYNFBUZwJEs6TqBxdrYvHKvE0Yg/PhYXVo6WhliPrGr2UZ2LVp9SWxIBVdx/IOBCw8nanr4EJV3vPsj/MzZ33hBNr2kg/VhrtlCY0PvV3GLBZoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjRiM1EvMjVzT1NEVGpabm9WeExVNUJjWjJoUkZGODlhQnJBQnZ3dWdUVlZt?=
 =?utf-8?B?NG04cXlZUWVaenBNa3VxMnNBQkV0WUQvUTNreGpBUFo4Rk9MOEZXMWFsZnJY?=
 =?utf-8?B?MjVrMnNGMndvRVF3TEZFQjdnZUdKajJjZDhxSDEzbGpwQi9hZzQxUFk4UDli?=
 =?utf-8?B?dlpBdDJLaVYxYXVPbUpJaTBQbEJpRkRYOHZwaDRFajlLWFFja3dOa1JudVlp?=
 =?utf-8?B?ejFQTEU2RFdyUDFKMHVqWUl6VGtrSi8wK1p5N05INTliMy91anlYVEoyQUEr?=
 =?utf-8?B?T3liWkNQSlV4dktvcDF0WHFGZjdZZGdQUjM4NEVyNHYxZnQ0WWlPRkthUEJV?=
 =?utf-8?B?czlOcEtSWkZiNHJCak1MZ2pQU1U4Kzg1dXZ0UEc4dlpFZVZGYXE0UjBpUVZv?=
 =?utf-8?B?Skp0SjdVSExwYXRjOGFMZTh0WGNvM2k5REFSQzJRbElwRGhGWTdzTjFTREFy?=
 =?utf-8?B?dWx3cUtXdGNzRHpxbnkweHhiVXdUeXNoZnRJdVh4NVFaTjNUN2Fsd0xsbUpQ?=
 =?utf-8?B?N0hvY0Nnb05DTm5DWmd4bjQ3T0tJUTBqOWVSeVJwckU1azVvV1JJY3RsK2dP?=
 =?utf-8?B?L29MZnZFTk5vQVJ6RUsyNkVWekZPcTQ4TnRRQjJXZzNRc2lRNHZGcGtjV0Rl?=
 =?utf-8?B?TmdPbU90T2hlYjFoRTFEdG00MnBYTy9DRGsraXVDVkQ0czROZDZYUlpLSitQ?=
 =?utf-8?B?QTN3RmNobXpLWmp1UzV6dkNrdVlPVzJnRUNsb3N2Q0FGdEYwdXFMZy81bmJC?=
 =?utf-8?B?cXRFS0JmcWl5MHA2SUdLMHNtSS9SQXF0Q3BCT0hzUXRmTjQyQWEybkF2VE9l?=
 =?utf-8?B?T1dXOUZqQTZlTFdQODl6ZmFaRUswWk1WQlE0TC9uSEsxZWpiZHhlZllGTXow?=
 =?utf-8?B?VDFxK2xwSk1pc3YwNGJmS0tDeFFjMC9qd1RqWjBsdmh3MTVyR0YxUmFIRmpI?=
 =?utf-8?B?N1NDZkRIRFR2aTU4a2pLbDlyQTMwWFJVa0JPM2crWFA1dy9aQkVOWmp6MjJ0?=
 =?utf-8?B?djUrbDRLZ0lINmlua25yZzdPaWx4TFZOMHhHZ1Q2Y3ovNGdybGRsZnl5ajU1?=
 =?utf-8?B?eGJ0N0xGOHBrV2Q5enY4K0hXU2hrcTJZSG1kamo1RmlKVkRtYXZLcjdlWk5X?=
 =?utf-8?B?eWxpeStjNGthODJFekduZUU4ZWJwZ3RjaC93YzZSdlIwbFFiUGswbS9UMTll?=
 =?utf-8?B?bmpTQTNPN3BPTDBnWlRZYmp4cG5TS0tWbXMvT0dMaUdsVk9wSWtDMDlCN09G?=
 =?utf-8?B?QXFVd0F2TG1SKzZuYzFqQ21CMGxxcCszaFptcXZNQzNKYXI2ejBQWmIrYi83?=
 =?utf-8?B?QjM4RGE4Z1RpVSswVDRoaVkrNURPV3BiVGUwREZHdUJNQ0ZtT3NCYUg5bmpk?=
 =?utf-8?B?dmlaWXp3TkxRTGM2ZFc1RU9RWXcvK1pKdW9NNUpRZGNOZ1oybFRRelV0MFJQ?=
 =?utf-8?B?djNSaXNvL1hORzFJSVNnU09NUEh0U0FCL1JpSTh4Tm9uUEpNd0YwM3pWTk5Z?=
 =?utf-8?B?Y3JKdDMrNHBybVBhN3VEV0VJcXpMVEZJT2t0amphcTRiNld4RWNVQWdubmtQ?=
 =?utf-8?B?SE5Nek5yRzJCWFZhY2tYUXF5ekhyRkIxb2FCSlJVT3VwZ09RRjVXMkI3RWl1?=
 =?utf-8?B?RnVXUXgvczBITzRMem5xR2RyMjNSMUdFNW1rL2draWRrRE0zdUUzZkZSNHIr?=
 =?utf-8?B?NHM3VG5kZWxQVGRPTGFZb1AzdlM1eEg0Z0o2UEdMVEs3d0ZtNTlPZjdaK2RL?=
 =?utf-8?B?NGZHSFozT0RRRnVlLzNsQ2h5S1dONnlWTnVob2RQRWl0Z3VnODhlNm5LWEEy?=
 =?utf-8?B?SFFSR2dHOEl4QkRxdURRaFpENGhtaTVxZStPYWo4NUlZUVltdFNpTzQyVDBs?=
 =?utf-8?B?T001c3FmN0p5MDNJN044NGJuVGk4eXJVVkdvQjdHSENZT2hwSzVDUTlXdUNr?=
 =?utf-8?B?SldVUm95SXNNaGVSamJwSlFaSHJUdGswb2VySlhJd3ZkTE5mYlR1S1hSd2xP?=
 =?utf-8?B?NFdqMnViSWdDV1BXRnFpY0dJbkVjZytVbUdOVmNqL1oxK0lmenN5V3lHempj?=
 =?utf-8?B?UUU4WUkwMFVEcUFYanhqMXVReDNibHBxQ1F5OGlBbTk4K1dzKzVxZ0VtZFJz?=
 =?utf-8?B?R0FVZ0g5bjZVNk9vckVvdTJLRzNGY1VvODY0N3hqZ29YSW9FdnNrVW9lWWZ1?=
 =?utf-8?B?L1F1b3VaTFRUaTR3aWs5RTBvdis2QkNJeFUxWmk2MVlXVFVKODlpUmppZTAv?=
 =?utf-8?B?bG5Xay9IZXBHRWNFRFNzOTMrdVkwM0xoSEFrVDdka0lPN2V2U3R0eTl4cVE3?=
 =?utf-8?Q?GwKWj8vGQ3zB9PyCgR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce63b5f8-dd76-4fa6-cff7-08de7ebba668
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:42:35.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 326ejJoXF9f5f6Fb4NUWortRHTPZefbMFXWdhGvNqSLlPCCdMrWcQXuhoyvWKe8z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359

On 3/10/26 16:25, Mark Brown wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: 'struct dma_buf_attach_ops' has no member named 'move_notify'
>   210 |         .move_notify = ib_umem_dmabuf_revoke_locked,
>       |          ^~~~~~~~~~~
> 
> 
> Caused by commit
> 
>   932f1eef09ecb (RDMA/umem: Add pinned revocable dmabuf import interface)
> 
> from the rdma tree interacting with commit
> 
>   ef246da8e63c4 (dma-buf: Rename .move_notify() callback to a clearer identifier)
> 
> from the drm tree.  I have fixed this up as below and can carry as
> required.
> 
> commit 0cab8756cbc2f43cec2b8e88f2ea3c985491a426
> Author: Mark Brown <broonie@kernel.org>
> Date:   Tue Mar 10 15:15:19 2026 +0000
> 
>     drm/rdma: Fix up merge
>     
>     /tmp/next/build/drivers/infiniband/core/umem_dmabuf.c:210:10: error: 'struct dma_buf_attach_ops' has no member named 'move_notify'
>       210 |         .move_notify = ib_umem_dmabuf_revoke_locked,
>           |          ^~~~~~~~~~~
>     make[6]: *** [/tmp/next/build/scripts/Makefile.build:289: drive
>     
>     Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> 
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index d7ade877bf9d1..ad023c2d84d85 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -207,7 +207,7 @@ static void ib_umem_dmabuf_revoke_locked(struct dma_buf_attachment *attach)
>  
>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_revocable_ops = {
>  	.allow_peer2peer = true,
> -	.move_notify = ib_umem_dmabuf_revoke_locked,
> +	.invalidate_mappings = ib_umem_dmabuf_revoke_locked,
>  };
>  
>  static struct ib_umem_dmabuf *

