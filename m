Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107C84A35
	for <linux-next@vger.kernel.org>; Mon, 16 Feb 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771260648; cv=fail; b=GL42E2yqaPdbWYpFtFhktPyDMfO1tj88LoR2TAiNgAylkmSz676lK0Ekons7Z3HHAWuwJ5kRfUXxx7c+U4bYn0+9J99hvFEqIvPo+w9lUWsbW9W6F0qgQJ8EorNi8BoQaEuMdMIfkguToOnh48VgE3NxOCrshz1/Xk+GJq/4eN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771260648; c=relaxed/simple;
	bh=ptrz2v7rECVT5eMhPPPAdeQuTK4AM/q++n6ABtQ1WsM=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=fv1rr5Qane1tjEKSBN+l6+cgSVhY0Tpes9xoPNYuOBYK4Sexm5bVZrJZjcmHosQoMdgSoK6me84FmNWWl0+2VXJio4FNygoaeCYGuQeK2SNcH8PsmJvDUSogvwbACI3eb+ogJeGS0bDEQepQ0rGozKSIG2oU8gIUNjnrIn8TP0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eMwWLodZ; arc=fail smtp.client-ip=52.101.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eMwWLodZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELjYcK/OJr9D/sttGrdD2MlmTp+avvSffvztRHdzX8SmEWOYRUXVYB+hiacQi/cekZTlk4DjBiTcL9KmrISgYCFk0ZVT95d35jurcbclEu+U0HJXkvBNPWMLd3/M4YORm5X3r7Nn+eDMtUfV2LJdXxuhHClZiC5/0z4mgWwcxKHIINBu92zD9hhoC3ujVLiBBY1uw31fiLWh1j4xVJiR2O3nfkWixNQt0dZ59QNXuF5ShiwBvXZ7FSVD7UaZMpncDLjmLfesgBLSb7a/K3+nF2dbSkzVKBN+gHuLKfypeiKlX8bsYvbMxwua3yZ/M5r3DqClsRk5mwK7ffv2d4NMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fISTUbohHVY+SREz5Trz2Crpp/Bbrj4lKd01wSAUFss=;
 b=vn4CbEgb9uq5FrDCDYW3N50bAtR03C+uUxSHZsPBqA/RaHUEGfd6bvKS2EaMxCJOpngGrGIM2cSkatoiNru3gLAgJtNxvdpvi1rN/FwToQZSWJPAZ9ZZaDxkr76duME0UtgdpMgR6JxLBIWrHU8W+LUIh/WBTBX7ZSz7AfkQiIxzlGfkvNo1AGNQIIZlZIUeTN1j+lASYhelIgetXXykrosAHj6OMrTGt0/BK5e6s4Yj5yi//IwgoAjOfPdFwRn5Rab1mz3CuIRzz+XSPuEkc9CPO8xyQ+4/tHR2w5XNt6vgXtMIAIL9X2wW57NcSJrEM9RTL97QxOfa4ro6+mN80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fISTUbohHVY+SREz5Trz2Crpp/Bbrj4lKd01wSAUFss=;
 b=eMwWLodZIzXiPNMtudm4R+DgDXhDFKpDk0JpxoB92UIlHW4umxWbF9xuhwz38XJWCDZzv34mmY92T+AqA9m8DFcTsaX/gdlRI3GMGQMa677+gt0wcLr35pmejMnIjt3fAYZwNgwKyBcXbTgY24kGuCkv20MfoAdErFPWNbH6+tM=
Received: from MN2PR10CA0023.namprd10.prod.outlook.com (2603:10b6:208:120::36)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:50:39 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::f1) by MN2PR10CA0023.outlook.office365.com
 (2603:10b6:208:120::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 16:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 16:50:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 16 Feb
 2026 10:50:38 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Feb
 2026 10:50:38 -0600
Received: from [10.252.192.229] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 10:50:37 -0600
Message-ID: <4e10448b-2c29-4ddc-974c-63159549cc23@amd.com>
Date: Mon, 16 Feb 2026 22:20:37 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
Content-Language: en-US
To: <linux-next@vger.kernel.org>
CC: <Narasimhan.V@amd.com>
From: "Kumar, Sumit" <sumitkum@amd.com>
Subject: [REGRESSION] Boot failure on NVMe multipath LVM root since 6.19-rc8
 (dracut cannot find root)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: sumitkum@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a55e669-5e23-4ac3-19cb-08de6d7b83e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czJnalM2dDlQN2tBb0pOOTcvUkh1T0ZUVDZodS8yQng0dHc3U0hqNVdnMFds?=
 =?utf-8?B?OEdSYmxEaGlGV0c0Z1BZckIwYm9jYmdlaXVQbytjSFpzMGY3dm9iMWJKdVBq?=
 =?utf-8?B?bFlYZStnRFdmQmxpd1VqNEt6S2NPR0p2TjQrK0owZDJJK20wZmkxdk50MVEv?=
 =?utf-8?B?aWFOVDBUcDIxY1dvT2NpaTV6VVRKeXk2bkxDS3JXV1VkdEw2ZlUrbytmaDVQ?=
 =?utf-8?B?YysvWmtiTTR0emtXRUR5QlFQSWJGQVBUQnNTNXVsKytSaVFUeDBqa2lrMkJJ?=
 =?utf-8?B?VWFBemFrTFZ2Z1dMS3dmK1J2dUZMWVg0WERqMmVrSjA3eHdXR2F4VUFQbWd1?=
 =?utf-8?B?TjBHWFZYMEpwMFh2MWM1VkNJTmF2eXVzajR6WEkrTTdHNGVmaUtEZnM5cFdu?=
 =?utf-8?B?S2o2NHlqOWJTODBiZjFzaXNxSWRDK0ZRYktKOGo5U3BwMmZoZDlmUGNsTUox?=
 =?utf-8?B?WHp3d3Q1N21LdGxxbWhMbjRjcHFGeUJZaXRyTDJEZ3ZNQzhRRko4L2lDZ3VS?=
 =?utf-8?B?NHRaZENnbU1XN2hGbVNhcE5lU3Z2anp4U2k3NDBvaTBGZitMdWozKytneWpF?=
 =?utf-8?B?MktBOGJOTnNjYlQ2RG9jUWYxQThRMml4MURYdUFMNDViUzl3amtFY3IyVTFB?=
 =?utf-8?B?eFBWOXhkUmZudjFIOG9QTmU3S3J4TitsQTBKQyt4eEU1R1VDZ2ZEMmxTeDli?=
 =?utf-8?B?QmJWaVRZUk56ZDdGRXoyQzZWS3hzdjB5cVVuTGRPT3UxV2lMcFNFT2srZlZU?=
 =?utf-8?B?Y2luRzh0RW5BazczUi9LeTZxSVpGV1JHWVlRaDI5aTgyS1lZZFk3U042d2Uz?=
 =?utf-8?B?bGlJYWJPdEs5amFIeDllWndGTy9ES2syWGtJcDY5NHptQ0NHMldmVE9HYXB1?=
 =?utf-8?B?UTNnWUF0eS9HMXZISEM4bWxCeHVjOFZ3VXFIa3JsSTNKRDZUblA3RTc0Q1hj?=
 =?utf-8?B?RzZUY3lBeU1OWFVvaER6c0NzSTVJZXowL0wyY1F0UGdNL2lpUWViZFM3clFZ?=
 =?utf-8?B?cTUrZTZJMWdha25GMGxraC9ZU2R5NkVGd0ZPemRhK3lVUXJjaEVqNW5Sa2sv?=
 =?utf-8?B?R0Z6UVl5bDhBWXJRaUJSMHpKSHUyOU9EUTFuU2hibHV6QW9CdnVtZzVQbnNq?=
 =?utf-8?B?clRTQkpGNmQva1dzR1ZBRDVlKytURnExRWYxeVFialhtZEhuR0p5M0ZnZkVq?=
 =?utf-8?B?dzIvcmRnaWNkWkRBTmUySmN4N1ZFZi9oQ3cvREZNc0trSEQybmdRM291OENo?=
 =?utf-8?B?M01reitEd0FwWGhPaFRiZTI1dk1IQWI5eE1Od01XNmNqdGdmQnZTR0hXZ29x?=
 =?utf-8?B?OStDY0hZcjIrcXJZak95ZUEwbFpYOXN0a3pGbkhDMFdKRzhLcUI5ZHgxUEZT?=
 =?utf-8?B?ZVlPWXdmZGZNNlRESmtvY1cxK1hISUVlUDdHaUtsWUxYSS9BNzVNalhLcGpp?=
 =?utf-8?B?czNEWFhEaW95YWNQdUV6RDcrSVFSNHJvVGw3cnNueFhWa2VSK0txNHk0b1pt?=
 =?utf-8?B?MWI3NUtZRUFBZ0J1cmFLc2djMUlzVlJveGZWU2lIVkM5U3dyS2EzdTVoVnlq?=
 =?utf-8?B?NUpsVVR1a1pCM09XakdhVkZVcjJkRUU2Z3UxR3NMZ1BQbWhSNk5Gdk9EUmRR?=
 =?utf-8?B?R0ZiNjBuWUlPZnZmNThLU0I2T1dKcnYvQldzZTByZFBYcG9zRlNKWS8rY1A0?=
 =?utf-8?B?b2ZBMVJ1ZGdWdnUxdWxhTlpwUzlZNitnQ2RUN3VyU01QNXNHWUpYeGFub2Zt?=
 =?utf-8?B?OHdqaVpqaDV1ZEpabjNmY0xNWWw3K0R2YzM0OVlyNitDYU1MTUNlSDhHSWw1?=
 =?utf-8?B?K0phT3V2ZzlubGM5M2xZU1ZCcXBCYVpXenVTMmlKdU5CSVkrSjBaVXN1cm43?=
 =?utf-8?B?ckp5MUpCM2JVN1pDZHBUT0JaY1hDd3VrcDdSMVg3dXFvcVNwTWlPN3V6S1Nn?=
 =?utf-8?B?aWVLdHRiTytkK2ppczczK21XWEJZb3NoRWtXYUEwMUtBR0dEUmdRajFBMFFv?=
 =?utf-8?B?TmVJb20rbC9YQ0Y5M1hiTU1uTDROVWU2cFFXRGZXb2VQb0VadGY5ck5mQWEv?=
 =?utf-8?B?VDhGcFpCOWI1UHdVLzRTNytoUlNVNWVFeHoxdkIyRW9Ca0ZhNU1VYy8rREVx?=
 =?utf-8?B?SmJDekRVMEpmNENpUWF6TXVwVE9NL0QrNkZCclh6OVpOWXdpWHpJWjM2a280?=
 =?utf-8?B?Mng5RE5KQ3UvUnhVZ2s5OTM5cGwyN0MweW91UDhiaVYwSUxxdFB1WndJcXRE?=
 =?utf-8?B?eHZpeFlGaDNCb0F0TkN5dUlJcDJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RjNdiLe4LG7NTL9v2s9aLPKCwRG9akmf3RIuNUrSuk+wKwa4xu2DV0rXvl67l0Se7f+v5Q+2kjEQZxGI0oWTJKkfKnnnWheypUDwzdLO50IdTbeujfN+CdLZLy7x22cl9JtCpgHSpBHWT3uIpHyYRbNctQ0ezHdbkXeGTUqshwXHMKNC4Wg0sk+oC7oBvWtoRP8JWNNU2YHNc9tJq7x8Ase/sU41NYixRqVYzJ9yiEtYHdWC0TDwqM4eokkMmivtrYbK3xKfaNV7MvalffqJGrRAVWeJlRsUQSxXqoaJPG7+MV5vxNvMANAISCm6mrYmt/0ac5s55rsdFUBWzS+YZJHVgN4721AYUTYonJjz7tzA30xcXjfAbXM4you8NpHuEYn879QWJ2CrzCsUHBjbcG4/dNFA6+75B+LXZJ4gyEmHWt0DSSHPN/mDOT6kwsCD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:50:39.4265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a55e669-5e23-4ac3-19cb-08de6d7b83e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316

Hi,

I am observing a boot regression where the system fails to boot and drops into the dracut emergency shell because the LVM root device is not detected. The issue is reproducible with both linux-next and mainline kernels.

Regression Status (linux-next):
 Boot passes: 6.19.0-rc7-next-20260129
 Boot fails: 6.19.0-rc8-next-20260203
This indicates a regression introduced between the above kernel versions.

Environment:
 Distribution: RHEL-based system
 Storage: NVMe disk with multipath
 Root filesystem: LVM on NVMe multipath device
 Boot method: local disk

System layout:
 [root@cinnabar-3f48host ~]# lsblk
 nvme1n1
 ├─nvme1n1p1   /boot/efi
 ├─nvme1n1p2   /boot
 └─nvme1n1p3
   ├─rhel_cinnabar--3f48host-root  /
   ├─rhel_cinnabar--3f48host-swap  [SWAP]
   └─rhel_cinnabar--3f48host-home  /home

The affected system has the root disk configured on multipath over NVMe.
A system configured with multipath over SCSI disk boots successfully and does not show this issue.

Problem Description:

During boot, initramfs fails to detect the LVM root and swap devices and eventually enters dracut   emergency mode.

Actual Behavior:

[ 202.597607] dracut-initqueue[1317]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2frhel_cinnabar-3f48host\x2froot.sh: "[ -e "/dev/rhel_cinnabar-3f48host/root" ]"

[ 202.599178] dracut-initqueue[1317]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2frhel_cinnabar-3f48host\x2fswap.sh: "[ -e "/dev/rhel_cinnabar-3f48host/swap" ]"

[ 202.601189] dracut-initqueue[1317]: Warning: dracut-initqueue: starting timeout scripts
[ 202.601312] dracut-initqueue[1317]: Warning: Could not boot.

Starting Dracut Emergency Shell...
Warning: /dev/mapper/rhel_cinnabar--3f48host-root does not exist
Warning: /dev/rhel_cinnabar-3f48host/root does not exist
Warning: /dev/rhel_cinnabar-3f48host/swap does not exist
Generating "/run/initramfs/rdsosreport.txt"
Entering emergency mode.


The system generates /run/initramfs/rdsosreport.txt and drops to the dracut shell.

Expected Behavior:
The system should detect the LVM volumes and boot normally.

Steps to Reproduce:
1. Checkout linux-next tag `6.19.0-rc7-next-20260129`.
2. Build and install the kernel.
3. Boot the system → boot succeeds.
4. Checkout linux-next tag `6.19.0-rc8-next-20260203`.
5. Build and install the kernel.
6. Boot the system → boot fails and drops to dracut emergency shell.

The issue reproduces consistently on systems with NVMe multipath root.

Mainline Results:
The same issue is also observed with mainline kernels:
 Boot passes with 6.19.0-72c395024dac.
 Boot failure starts from 6.19.0-192c0159402e, where the system drops to the dracut emergency shell with   the same behavior described above.


Please let me know if additional logs, kernel configuration, or further debugging information is required.

Thanks,
Sumit Kumar
