Return-Path: <SRS0=9mSK=VF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E32C606C1
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 15:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE857216F4
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 15:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="y6ClKNOX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388822AbfGHP00 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 8 Jul 2019 11:26:26 -0400
Received: from mail-eopbgr680057.outbound.protection.outlook.com ([40.107.68.57]:5013
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388813AbfGHP0Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Jul 2019 11:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivx+FkOJs0ewzdQ0Ef7cxdmZr4umwnmH6GhxJLk+euQ=;
 b=y6ClKNOXYV3OAQ2zxY+2I6qvf7rgwVb+ZA6S9nndqboA97MevE1RlAkp+Hf03MXjxUTPh72m86mPeLb0XwDzKFJsv7iIPYHfXsbyW1EN+aBSFboXMl7uq5utdhk1CylEI1RLiEJ5D2x+3P1deO325E3iZtBpB2068obn14o6jGA=
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3356.namprd12.prod.outlook.com (20.178.198.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Mon, 8 Jul 2019 15:26:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:26:22 +0000
From:   "Kuehling, Felix" <Felix.Kuehling@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Jason Gunthorpe <jgg@mellanox.com>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAGcL0AgAELGgA=
Date:   Mon, 8 Jul 2019 15:26:22 +0000
Message-ID: <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
 <20190708093020.676f5b3f@canb.auug.org.au>
In-Reply-To: <20190708093020.676f5b3f@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4c430c-d30c-42a5-83a6-08d703b8a1e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM6PR12MB3356;
x-ms-traffictypediagnostic: DM6PR12MB3356:
x-microsoft-antispam-prvs: <DM6PR12MB33569AD9C8BD472C3B89352192F60@DM6PR12MB3356.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(53754006)(8676002)(31696002)(81156014)(86362001)(25786009)(305945005)(8936002)(65956001)(65806001)(66066001)(65826007)(53936002)(68736007)(6246003)(81166006)(71190400001)(7736002)(6486002)(71200400001)(66946007)(316002)(6436002)(14444005)(58126008)(186003)(26005)(110136005)(229853002)(54906003)(6512007)(76176011)(2906002)(4326008)(64126003)(52116002)(102836004)(31686004)(53546011)(6506007)(386003)(2616005)(99286004)(36756003)(478600001)(72206003)(6116002)(3846002)(486006)(446003)(11346002)(64756008)(5660300002)(66446008)(66476007)(476003)(14454004)(73956011)(66556008)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3356;H:DM6PR12MB3947.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2zfszEu1NTypPaRN5GA1pxRHu1HRNazV4QVrafDH389xr3eR6Qf9z3xFUxd3RiADh/395jQzlCUo8mLMi5cwtGuvawVzwKcYDyu4PE5+eD74vxYBzv14b9jhlvpf9kbRXvpE20kahDGxk2XZIuD370LojMhLlxSm9W5//qj7oIWQ1tcYOEbDNgWTyVVhSunQCEUkOkQ5q1T9krwiMhfnl26Q/nfFQQHFBv1+/5Mdr9lDe38XncyWM7RpSl7oIdmUphlD4Fn1+r7nAzqTmiemtg0E+UGjDHDRGFDEbMqInMoYrGYUVwzzgkJSm9NZssKXmo2+UFPBL0wz/WRug6Ofxz0mGR/PwuK/v6XQxNZBVTF+fZpuAPlBm2FGq5E/sF/HV4pKwupuKI+P9HOTDaR6qQdIk+mN6L63g1tBVBzZtK0=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <34DD8908A6549C4B8E1C807651D738CE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4c430c-d30c-42a5-83a6-08d703b8a1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:26:22.4093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019-07-07 7:30 p.m., Stephen Rothwell wrote:
> Hi all,
>
> On Wed, 3 Jul 2019 17:09:16 -0400 Alex Deucher <alexdeucher@gmail.com> wr=
ote:
>> On Wed, Jul 3, 2019 at 5:03 PM Kuehling, Felix <Felix.Kuehling@amd.com> =
wrote:
>>> On 2019-07-03 10:10 a.m., Jason Gunthorpe wrote:
>>>> On Wed, Jul 03, 2019 at 01:55:08AM +0000, Kuehling, Felix wrote:
>>>>> From: Philip Yang <Philip.Yang@amd.com>
>>>>>
>>>>> In order to pass mirror instead of mm to hmm_range_register, we need
>>>>> pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirror
>>>>> is part of amdgpu_mn structure, which is accessible from bo.
>>>>>
>>>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> CC: Stephen Rothwell <sfr@canb.auug.org.au>
>>>>> CC: Jason Gunthorpe <jgg@mellanox.com>
>>>>> CC: Dave Airlie <airlied@linux.ie>
>>>>> CC: Alex Deucher <alexander.deucher@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/Kconfig                          |  1 -
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
>>>>>    8 files changed, 30 insertions(+), 11 deletions(-)
>>>> This is too big to use as a conflict resolution, what you could do is
>>>> apply the majority of the patch on top of your tree as-is (ie keep
>>>> using the old hmm_range_register), then the conflict resolution for
>>>> the updated AMD GPU tree can be a simple one line change:
>>>>
>>>>    -   hmm_range_register(range, mm, start,
>>>>    +   hmm_range_register(range, mirror, start,
>>>>                           start + ttm->num_pages * PAGE_SIZE, PAGE_SHI=
FT);
>>>>
>>>> Which is trivial for everone to deal with, and solves the problem.
>>> Good idea.
> With the changes added to the amdgpu tree over the weekend, I will
> apply the following merge fix patch to the hmm merge today:
>
> From: Philip Yang <Philip.Yang@amd.com>
> Sibject: drm/amdgpu: adopt to hmm_range_register API change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> @@ -783,7 +783,7 @@ int amdgpu_ttm_tt_get_user_pages(struct ttm_tt *ttm, =
struct page **pages)
>   				0 : range->flags[HMM_PFN_WRITE];
>   	range->pfn_flags_mask =3D 0;
>   	range->pfns =3D pfns;
> -	hmm_range_register(range, mm, start,
> +	hmm_range_register(range, mirror, start,
>   			   start + ttm->num_pages * PAGE_SIZE, PAGE_SHIFT);
>  =20
>   retry:
>
> And someone just needs to make sure Linus is aware of this needed merge f=
ix.

Thank you! Who will be that someone? It should probably be one of the=20
maintainers of the trees Linux pulls from ...

Regards,
 =A0 Felix


