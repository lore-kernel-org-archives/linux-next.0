Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5050EC433FF
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 08:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A44A223CB
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 08:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="IbcT7TS8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfHGIx3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 7 Aug 2019 04:53:29 -0400
Received: from mail-eopbgr700046.outbound.protection.outlook.com ([40.107.70.46]:11585
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbfHGIx3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 04:53:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maMXZUbunUkcBh+vdY5Go1bhRtaVpY0vUOGTcU/5+lkFZD9NQCPeEB38piHX2OA/AIy5ZSN5aKIIr5VfZ3TywcvLFsz1XK295O1XkxMZmFDIo4uIOvCmLgP5z0KFDuoYp+HszEklrMdl65JLYXW02nF03NJzGqptWcwmO+bn5tFrbXRcZPYLzTIgTYRilYnnk8ntP7tnF7Vh4/ahlYAwlIdNdp15/NQ8R0XOx/hpsmpUMjUREbVt1cwbh6tfSMwkSdMTfzmidrnx25fO1txCp8X7yid2N961HJ4tkSprFe3vSIcpw2C7LlwaaEN8MQiqneh/7ISAEfcSsfmhv6fJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wyj9TdYcfisZgKkautYT5py2AvvuZ75t9XGu4Rr6Jx0=;
 b=FpHrhOmuU37uArdbphIxE/LLt6Qd0VyAraUtHLFmSWdwjVDWyewHR1czFERR/u+/WRomiREPq4/5NpZBP+0kZ2o+f6mSC1Wizl9dQyvaQxEl2gMmhVqdDRhQ8+yQVdXFmK7ITGO58ugnnsWc+ntpGtv8ZJlpKGFBe2SbWSQrlsUP7fHcqBXOsoTN4WTv0kyX/Hm+novYOqbqQ/AgUZ5QeODA1iiAbFnqObHHw7yD97zyixmyGKbgywefXH+yJZTmW+RtHdhgiu2rs5mLCxPDKRb8xkMZ3lhnCkkV99QLyAMpco3JukLYH64C7BjSGKJ3yurtmUoxzde1E99stadQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wyj9TdYcfisZgKkautYT5py2AvvuZ75t9XGu4Rr6Jx0=;
 b=IbcT7TS8rXCjLa7j0FqcRaXpD7oP/seStjWype0KWt8IJO/Rb75QyBavOKz3eWitpc2XuaC1gN26SbmXIzzG/Zf4goAqmw9MCHog3l6p0hfo5KTq4DUkuwyuVQnuJsF1Nqc6aZl1AXs1+LkdSZIhFagbI+BXhAFuDC5KN9Dptzk=
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1371.namprd12.prod.outlook.com (10.168.239.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 08:53:26 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 08:53:26 +0000
From:   "Koenig, Christian" <Christian.Koenig@amd.com>
To:     Christoph Hellwig <hch@infradead.org>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>
CC:     "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>,
        "Li, Dennis" <Dennis.Li@amd.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Thread-Topic: [PATCH] drm/amdgpu: replace readq/writeq with atomic64
 operations
Thread-Index: AQHVTMvE140hqrZvSkOTllezqlrDj6bvREIAgAAdQoA=
Date:   Wed, 7 Aug 2019 08:53:25 +0000
Message-ID: <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
In-Reply-To: <20190807070834.GA24792@infradead.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d06c977a-1957-440c-4f20-08d71b14b557
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM5PR12MB1371;
x-ms-traffictypediagnostic: DM5PR12MB1371:
x-microsoft-antispam-prvs: <DM5PR12MB1371825DBF2548986AA28CB183D40@DM5PR12MB1371.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(199004)(189003)(31696002)(6506007)(86362001)(2616005)(46003)(25786009)(256004)(8936002)(66446008)(81156014)(66946007)(6512007)(14454004)(99286004)(81166006)(52116002)(64756008)(66556008)(66476007)(76176011)(2906002)(36756003)(31686004)(68736007)(6246003)(102836004)(71190400001)(53936002)(316002)(6486002)(446003)(4744005)(386003)(6116002)(65826007)(110136005)(8676002)(7736002)(11346002)(58126008)(486006)(476003)(229853002)(6636002)(478600001)(64126003)(71200400001)(65956001)(305945005)(6436002)(5660300002)(4326008)(186003)(54906003)(65806001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1371;H:DM5PR12MB1546.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n7BWIbSrYjBs1LHn6hwFPwNaVqrVr1BPcHaYassYQc8VOOHUOk1yBfi/AduD/o6pttJnUYNRJBXL+oc5UKfYcF5sHY83h/5z5uDjv+rwvdkaTXg1PxalKdNZoSe5mfyryPlVtGLGvQKiFZLx57FdCuaAOV5kUJQk0rvDhm/iykPWy6ZcVRytcb/cYJUimNsL1pIcq7H9gCwgr4qwokNkfjUHMJXDwZNmoDS9Dvw4vrjEE4KeBRbHY8PFtC/wucxneQlIs241gGRDvyRUqsLk/0pj4injHdojokGzdKDlHQCiicGDOmiKbyd3qhJuY6sGUtelHIvrfUsXJ7WoqJ6gjCFG0/xre1Z7MgBT8USQvcLAOsVojoir8HM09escAgONuQCxHQwUjc5qerqPkDNRxC6xlzTjaC5NCsoj+Z/QEhQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E712C262E9D105428F8F25A3E55ED872@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06c977a-1957-440c-4f20-08d71b14b557
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 08:53:25.7385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1371
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

QW0gMDcuMDguMTkgdW0gMDk6MDggc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gV2Vk
LCBBdWcgMDcsIDIwMTkgYXQgMTA6NTY6NDBBTSArMDgwMCwgVGFvIFpob3Ugd3JvdGU6DQo+PiBy
ZWFkcS93cml0ZXEgYXJlIG5vdCBzdXBwb3J0ZWQgb24gYWxsIGFyY2hpdGVjdHVyZXMNCj4gTkFL
LiAgWW91IG11c3Qgbm90IHVzZSBhdG9taWNfKiBvbiBfX2lvbWVtIChNTUlPKSBtZW1vcnkuDQoN
CldlbGwgdGhlbiB3aGF0J3MgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmU/DQoNCkVzc2VudGlh
bGx5IHdyaXRlcS9yZWFkcSBkb2Vzbid0IHNlZW1zIHRvIGJlIGF2YWlsYWJsZSBvbiBhbGwgDQph
cmNoaXRlY3R1cmVzIGVpdGhlci4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg==
