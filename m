Return-Path: <SRS0=xL23=VB=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F4C46478
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 02:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4350721882
	for <linux-next@archiver.kernel.org>; Thu,  4 Jul 2019 02:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="GvToemLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbfGDCBS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 22:01:18 -0400
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:30414
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbfGDCBS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jul 2019 22:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDOKUcnSBzVhEWWGoxyNSaiwC3cSjRI+ryccklVbwVA=;
 b=GvToemLtmEl5ObY9GAGcxPwGsXk3LWEfPSsERXuCD+t1APFzhCxw84bjpmvFoAHDRiYBnSFEuInB1xW3jh5t5sVmxe40fKpPn1KRFTLPV8Ei+6jnWftcB94Vf+D5XV0ejwndb1ALVi4oaN/eE/NuAGi4Bb9lhzzGkKQpyK1gC1E=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5390.eurprd05.prod.outlook.com (20.177.63.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 02:01:15 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 02:01:15 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Alex Deucher <alexdeucher@gmail.com>
CC:     "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yAgABzhwCAAAGdAIAAUY2A
Date:   Thu, 4 Jul 2019 02:01:14 +0000
Message-ID: <20190704020109.GB32502@mellanox.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com>
 <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
In-Reply-To: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::47) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 447cb622-f93d-45ea-7154-08d700237eca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB5390;
x-ms-traffictypediagnostic: VI1PR05MB5390:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR05MB5390DD0AF422A253812DCB4BCFFA0@VI1PR05MB5390.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(966005)(53936002)(86362001)(256004)(71190400001)(68736007)(6306002)(478600001)(6916009)(8676002)(99286004)(5660300002)(25786009)(4326008)(14454004)(6512007)(71200400001)(2906002)(81156014)(81166006)(14444005)(2616005)(1411001)(8936002)(6506007)(316002)(1076003)(6246003)(66946007)(7736002)(6486002)(66446008)(54906003)(53546011)(229853002)(66556008)(64756008)(26005)(76176011)(66476007)(73956011)(6436002)(11346002)(476003)(66066001)(446003)(33656002)(386003)(36756003)(3846002)(486006)(305945005)(52116002)(6116002)(102836004)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5390;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zA7Cm54Tj+HFs7usxkeRLZ/ZLlyx5Mfu3zGOb2C9ORYKhrJ2rWO4dy6spq+b+l1nFD5vgOeZTrPyaVWdFKLRp2xjf+z4UyUUs8IogdOdbK8kWC+LjC6sZ3c16WmsSstu8pJMQCPnUjiuhOUNeNjK8gIr9YiSVzMI/YCtEQRAWqQwKNL7fEfvitl51EgY3nO1vvr6c6yVfU+vQT6OPGALCgHyneL7w/SB+mXtu9p1OCFNLn0dmIGFusERM8l2Q4sol+fmUHablgcYI5yJxrj3CtXUcWo2gvEajtd3/Jpsec7RwpzYRlPZraxXxHdKQKQWdJx5/c/fdzPwG2g8gmma+RtnwwzwvuJsXxf+5Ysyka0hedYTLwGckLWYo+rQevRBA5vpu4GYXqwRlB1YYoth2pYtzetHRhDij628nuEPzig=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <783845738F0FFF45A9FA38B1C43749D6@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447cb622-f93d-45ea-7154-08d700237eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 02:01:14.9475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5390
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 03, 2019 at 05:09:16PM -0400, Alex Deucher wrote:
> On Wed, Jul 3, 2019 at 5:03 PM Kuehling, Felix <Felix.Kuehling@amd.com> w=
rote:
> >
> > On 2019-07-03 10:10 a.m., Jason Gunthorpe wrote:
> > > On Wed, Jul 03, 2019 at 01:55:08AM +0000, Kuehling, Felix wrote:
> > >> From: Philip Yang <Philip.Yang@amd.com>
> > >>
> > >> In order to pass mirror instead of mm to hmm_range_register, we need
> > >> pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirro=
r
> > >> is part of amdgpu_mn structure, which is accessible from bo.
> > >>
> > >> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> > >> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > >> CC: Stephen Rothwell <sfr@canb.auug.org.au>
> > >> CC: Jason Gunthorpe <jgg@mellanox.com>
> > >> CC: Dave Airlie <airlied@linux.ie>
> > >> CC: Alex Deucher <alexander.deucher@amd.com>
> > >>   drivers/gpu/drm/Kconfig                          |  1 -
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
> > >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
> > >>   8 files changed, 30 insertions(+), 11 deletions(-)
> > > This is too big to use as a conflict resolution, what you could do is
> > > apply the majority of the patch on top of your tree as-is (ie keep
> > > using the old hmm_range_register), then the conflict resolution for
> > > the updated AMD GPU tree can be a simple one line change:
> > >
> > >   -   hmm_range_register(range, mm, start,
> > >   +   hmm_range_register(range, mirror, start,
> > >                          start + ttm->num_pages * PAGE_SIZE, PAGE_SHI=
FT);
> > >
> > > Which is trivial for everone to deal with, and solves the problem.
> >
> > Good idea.
> >
> >
> > >
> > > This is probably a much better option than rebasing the AMD gpu tree.
> >
> > I think Alex is planning to merge hmm.git into an updated drm-next and
> > then rebase amd-staging-drm-next on top of that. Rebasing our
> > amd-staging-drm-next is something we do every month or two anyway.
> >
>=20
> Go ahead and respin your patch as per the suggestion above.  then I
> can apply it I can either merge hmm into amd's drm-next or we can just
> provide the conflict fix patch whichever is easier.  Which hmm branch
> is for 5.3?
> https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/?h=3Dhmm

Yes, anything for 5.2 should go to Andrew.

Jason
