Return-Path: <SRS0=ikMb=WD=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC8C31E40
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 03:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07F372070C
	for <linux-next@archiver.kernel.org>; Wed,  7 Aug 2019 03:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="M1lPi+2x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfHGDJK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 6 Aug 2019 23:09:10 -0400
Received: from mail-eopbgr680083.outbound.protection.outlook.com ([40.107.68.83]:32159
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726797AbfHGDJK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Aug 2019 23:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lElniQXwqdKJ90gdgk++iZwRYczLtyNkzhvvnW0NsyqujlZuAgw4wf5dvB+6R34FEne2FV7G9WxtH8F64qTLVRe4n+Q1vXqq5JpNJujKOlJOXRFQfhAqX9hGVkyoXk/20Fe08VK9kLxGlsO7uLRRCEYE+ACk+jiCOjp18qcyJTkR6x7LFCbkY4yyNofTfRRqEZMJtdFIVeRkY1n8nZ3ZLtaHwibZiAuDdKhVzYzPGYf9T4CN+lNunYzS8YDZ/RmFGI8/r2jO1QYfFo5qFjiZHsNqFNF+YydL0fIA59VbWyskYgx3gkd5G0TtxYv9G7rlH0xaBJIqxb83CFqKcnTEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTqavC5bZ0Xn9zq9zxHp549mm/WODx/cknwVAJtx28=;
 b=nN2rc59Xli30jpTjDgv4DoGA/4TCtTzkIGgeHWx4CsmhtFc7jRFhT+GvpfQzmKGvbXIDKsy3lf6H/wGoThiKtslYNp05S4/DPbDNcijNdpmVhbuitj8heo50TJI79gDN9i9uXImHKeDkPkBI/BIc/VzC511rs/kMN4ORrj2BZ5eSShOj7+B+G7bW28t5bujwQWwi6OOZmBkvA+JU8/F82lLX3zIgtxEqCTwq4Cfyw9Qs9fKhE0RpoQXum707V/dhWBjBO8QKxz/AvYAab6/7WkwGcSC5shlCh8Wer3leeguhqroO2Qiwy5B60NBegj/MvCPXlcarLTUMBu6KPBjHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTqavC5bZ0Xn9zq9zxHp549mm/WODx/cknwVAJtx28=;
 b=M1lPi+2xEOMhM3ptRgkvEHZ5EUOVbJUlnuI4TmYLNaE3YdvdJpSqr7OQQZ+l0aqIuAs3Bt2TDrA/+ayxxyhs/GOGdOiDHrnQgCKuzqmSRxty0eMqeimmOLBQS4CG3TbLbJcnlYqkQsHR/LwHRgaXEomdSZEOd0wXIserh19qQUs=
Received: from BYAPR03MB4773.namprd03.prod.outlook.com (20.179.92.152) by
 BYAPR03MB3591.namprd03.prod.outlook.com (52.135.213.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Wed, 7 Aug 2019 03:09:07 +0000
Received: from BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::a517:3578:67bf:6c88]) by BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::a517:3578:67bf:6c88%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 03:09:05 +0000
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Tao Zhou <tao.zhou1@amd.com>
CC:     "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "hawking.zhang@amd.com" <hawking.zhang@amd.com>,
        "dennis.li@amd.com" <dennis.li@amd.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Thread-Topic: [PATCH] drm/amdgpu: replace readq/writeq with atomic64
 operations
Thread-Index: AQHVTMvKn2cibV5eE0W0lKhtRWOdxKbu/lEA
Date:   Wed, 7 Aug 2019 03:09:05 +0000
Message-ID: <20190807105759.58a28ef0@xhacker.debian>
References: <20190807025640.682-1-tao.zhou1@amd.com>
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To BYAPR03MB4773.namprd03.prod.outlook.com (2603:10b6:a03:134::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c31620f-20a0-45f8-5338-08d71ae49afe
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR03MB3591;
x-ms-traffictypediagnostic: BYAPR03MB3591:
x-microsoft-antispam-prvs: <BYAPR03MB3591255330BF4B15E84689F2EDD40@BYAPR03MB3591.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(136003)(39860400002)(396003)(376002)(189003)(199004)(54906003)(6116002)(76176011)(3846002)(52116002)(99286004)(386003)(71200400001)(64756008)(66946007)(71190400001)(66446008)(486006)(6436002)(5660300002)(66066001)(7416002)(6506007)(316002)(66476007)(66556008)(476003)(11346002)(6246003)(8936002)(86362001)(50226002)(4326008)(446003)(25786009)(6486002)(1076003)(7736002)(102836004)(229853002)(305945005)(8676002)(6916009)(53936002)(6512007)(256004)(26005)(2906002)(81166006)(14454004)(186003)(478600001)(81156014)(68736007)(9686003)(39210200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB3591;H:BYAPR03MB4773.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DkaHdeJ+NUkEmC+oRl0E+NCwmmXtfEwK09OW1TGDF6lgO7ekqytTnoAf/Pl+/BnjxOmifumz8z1YQ6fjU5DqN0TyAwPPxOoM4vWit2vhNwMA9rXXkkWd7cRJHx2A3gnK5tl35JPnjgbPr5/RvnkoNKYP3d5+NlTwian9V+4nk3ZLDqrDsqhrSOEZc9iTfIcu//NMlt9novH7mLtxtPYe5M5gWY5FG4EDEI8ILu7lWDwuXgFFrRiIIVsGYmKbSWkAjvifkTJyTMkftP6TLmJYnB/sfnngr29BBrv9N5z4m6ZTHAwIZGlPF+7QDtQQJyHoBt4JLrV85DzSE/W+kk6SUUeHJC4UllNKl80gT+fjEUBBQPzWhhmyunKjGQn1aIgFzKzYRJciPhRJwAWb32ABK7YupDeuY7ieAWJJzGEQ7dI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5E427FF48ECA554D95F17DF5415C85A3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c31620f-20a0-45f8-5338-08d71ae49afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 03:09:05.3437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiszha@synaptics.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3591
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 7 Aug 2019 10:56:40 +0800 Tao Zhou wrote:


>=20
>=20
> readq/writeq are not supported on all architectures
>=20
> Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 558fe6d091ed..7eb9e0b9235a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -272,14 +272,10 @@ void amdgpu_mm_wreg(struct amdgpu_device *adev, uin=
t32_t reg, uint32_t v,
>   */
>  uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev, uint32_t reg)
>  {
> -       uint64_t ret;
> -
>         if ((reg * 4) < adev->rmmio_size)
> -               ret =3D readq(((void __iomem *)adev->rmmio) + (reg * 4));
> +               return atomic64_read((atomic64_t *)(adev->rmmio + (reg * =
4)));

atomic64_read doesn't equal to readq on some architectures..

>         else
>                 BUG();
> -
> -       return ret;
>  }
>=20
>  /**
> @@ -294,7 +290,7 @@ uint64_t amdgpu_mm_rreg64(struct amdgpu_device *adev,=
 uint32_t reg)
>  void amdgpu_mm_wreg64(struct amdgpu_device *adev, uint32_t reg, uint64_t=
 v)
>  {
>         if ((reg * 4) < adev->rmmio_size)
> -               writeq(v, ((void __iomem *)adev->rmmio) + (reg * 4));
> +               atomic64_set((atomic64_t *)(adev->rmmio + (reg * 4)), v);
>         else
>                 BUG();
>  }
> --
> 2.17.1
