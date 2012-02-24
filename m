From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the irqdomain tree with the powerpc tree
Date: Thu, 23 Feb 2012 23:07:51 -0700
Message-ID: <CACxGe6tgrAj+sHJ211=pRcqYBSM0xq2f1ycctK4RXLT7rSNhww@mail.gmail.com>
References: <20120224162504.49480de981431c3fd95601a2@canb.auug.org.au> <20120224163042.4cc2633945c9799b997ff4e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:55220 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754033Ab2BXGIM convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Feb 2012 01:08:12 -0500
Received: by obcva7 with SMTP id va7so2396013obc.19
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2012 22:08:11 -0800 (PST)
In-Reply-To: <20120224163042.4cc2633945c9799b997ff4e7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kyle Moffett <Kyle.D.Moffett@boeing.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Thu, Feb 23, 2012 at 10:30 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> [Just adding the PPC guys]
>
> On Fri, 24 Feb 2012 16:25:04 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> Hi Grant,
>>
>> Today's linux-next merge of the irqdomain tree got a conflict in
>> arch/powerpc/sysdev/mpic.c between commits 3a7a7176e840 ("powerpc/mp=
ic:
>> Fix use of "flags" variable in mpic_alloc()") and c1b8d45db4db
>> ("powerpc/mpic: Add "last-interrupt-source" property to override
>> hardware") from the powerpc tree and commit a8db8cf0d894 ("irq_domai=
n:
>> Replace irq_alloc_host() with revmap-specific initializers") from th=
e
>> irqdomain tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary.

Thanks Stephen.

g.

>> --
>> Cheers,
>> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auu=
g.org.au
>>
>> diff --cc arch/powerpc/sysdev/mpic.c
>> index b9b989d,c83a512..0000000
>> --- a/arch/powerpc/sysdev/mpic.c
>> +++ b/arch/powerpc/sysdev/mpic.c
>> @@@ -1351,9 -1345,9 +1351,8 @@@ struct mpic * __init mpic_alloc(stru=
ct
>> =A0 =A0 =A0 mpic->isu_shift =3D 1 + __ilog2(mpic->isu_size - 1);
>> =A0 =A0 =A0 mpic->isu_mask =3D (1 << mpic->isu_shift) - 1;
>>
>> - =A0 =A0 mpic->irqhost =3D irq_alloc_host(mpic->node, IRQ_HOST_MAP_=
LINEAR,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0mpic->isu_size, &mpic_host_ops,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0intvec_top + 1);
>> + =A0 =A0 mpic->irqhost =3D irq_domain_add_linear(mpic->node,
>> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 isu_size ? isu_size : mpic->num_sources,
>> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 &mpic_host_ops, mpic);
>> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 mpic->isu_size, &mpic_host_ops, mpic);
>>
>> =A0 =A0 =A0 /*
>> =A0 =A0 =A0 =A0* FIXME: The code leaks the MPIC object and mappings =
here; this



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
