From: Daniel Jurgens <danielj@mellanox.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
Date: Mon, 22 May 2017 21:16:57 +0000
Message-ID: <VI1PR05MB16780A243334245B69FEEB9FC4F80@VI1PR05MB1678.eurprd05.prod.outlook.com>
References: <20170522124855.68ad087f@canb.auug.org.au>
 <CAHC9VhQW8iLyOyr3SWTgyDXEi5yF2yAtbjFKfPQdZ10yZUDf3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-eopbgr10049.outbound.protection.outlook.com ([40.107.1.49]:65152
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933776AbdEVVRD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 17:17:03 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matan Barak <matanb@mellanox.com>

On 5/22/2017 4:12 PM, Paul Moore wrote:=0A=
> On Sun, May 21, 2017 at 10:48 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:=0A=
>> Hi Paul,=0A=
>>=0A=
>> After merging the selinux tree, today's linux-next build (powerpc=0A=
>> ppc64_defconfig) failed like this:=0A=
>>=0A=
>> drivers/infiniband/core/uverbs_cmd.c: In function 'create_qp':=0A=
>> drivers/infiniband/core/uverbs_cmd.c:1513:4: error: label 'err_destroy' =
used but not defined=0A=
>>     goto err_destroy;=0A=
>>     ^=0A=
>>=0A=
>> Caused by commit=0A=
>>=0A=
>>   89b54b4d09bd ("IB/core: Enforce PKey security on QPs")=0A=
>>=0A=
>> interacting with commit=0A=
>>=0A=
>>   fd3c7904db6e ("IB/core: Change idr objects to use the new schema")=0A=
>>=0A=
>> from Linus' tree.=0A=
>>=0A=
>> I have applied the following merge fix patch for today:=0A=
>>=0A=
>> From: Stephen Rothwell <sfr@canb.auug.org.au>=0A=
>> Date: Mon, 22 May 2017 12:45:57 +1000=0A=
>> Subject: [PATCH] IB/core: fix up for create_qp label changes=0A=
>>=0A=
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>=0A=
>> ---=0A=
>>  drivers/infiniband/core/uverbs_cmd.c | 2 +-=0A=
>>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> Thanks Stephen, this looks right to me.=0A=
>=0A=
> Daniel and Doug, does this look right to you?=0A=
=0A=
Yes, that's right.=0A=
=0A=
>=0A=
>> diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/c=
ore/uverbs_cmd.c=0A=
>> index 558fd5204b32..0ad3b05405d8 100644=0A=
>> --- a/drivers/infiniband/core/uverbs_cmd.c=0A=
>> +++ b/drivers/infiniband/core/uverbs_cmd.c=0A=
>> @@ -1510,7 +1510,7 @@ static int create_qp(struct ib_uverbs_file *file,=
=0A=
>>         if (cmd->qp_type !=3D IB_QPT_XRC_TGT) {=0A=
>>                 ret =3D ib_create_qp_security(qp, device);=0A=
>>                 if (ret)=0A=
>> -                       goto err_destroy;=0A=
>> +                       goto err_cb;=0A=
>>=0A=
>>                 qp->real_qp       =3D qp;=0A=
>>                 qp->device        =3D device;=0A=
>> --=0A=
>> 2.11.0=0A=
>>=0A=
>> --=0A=
>> Cheers,=0A=
>> Stephen Rothwell=0A=
>=0A=
>=0A=
=0A=
