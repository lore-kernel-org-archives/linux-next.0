From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build warnings after merge of the kbuild-current
 tree
Date: Fri, 08 Oct 2010 17:05:58 +0200
Message-ID: <4CAF3356.8080103@suse.cz>
References: <20101006114433.4fbe86ef.sfr@canb.auug.org.au> <4CAC59D4.5010505@suse.cz> <1286365363.4281.5.camel@e102109-lin.cambridge.arm.com> <20101008145141.GA13688@sepie.suse.cz> <20101008150343.GF4088@hack>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50134 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757334Ab0JHPF7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Oct 2010 11:05:59 -0400
In-Reply-To: <20101008150343.GF4088@hack>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>

On 8.10.2010 17:03, Am=E9rico Wang wrote:
> On Fri, Oct 08, 2010 at 04:51:41PM +0200, Michal Marek wrote:
>>
>>From ca22d6b4c7c26a8ff9092036a9524bc5ba817277 Mon Sep 17 00:00:00 200=
1
>> From: Michal Marek <mmarek@suse.cz>
>> Date: Fri, 8 Oct 2010 16:40:27 +0200
>> Subject: [PATCH] kconfig: Temporarily disable dependency warnings
>>
>> After fixing a use-after-free bug in kconfig, a 'make defconfig' or
>> 'make allmodconfig' fills the screen with warnings that were not
>> detected before. Given that we are close to the release now, disable=
 the
>> warnings temporarily and deal with them after 2.6.36.
>>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>>
>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>> index 943712c..d3cfa49 100644
>> --- a/scripts/kconfig/symbol.c
>> +++ b/scripts/kconfig/symbol.c
>> @@ -350,7 +350,7 @@ void sym_calc_value(struct symbol *sym)
>> 				}
>> 			}
>> 		calc_newval:
>> -			if (sym->dir_dep.tri =3D=3D no && sym->rev_dep.tri !=3D no) {
>> +			if (0 && sym->dir_dep.tri =3D=3D no && sym->rev_dep.tri !=3D no)=
 {
>> 				fprintf(stderr, "warning: (");
>> 				expr_fprint(sym->rev_dep.expr, stderr);
>> 				fprintf(stderr, ") selects %s which has unmet direct dependencie=
s (",
>=20
> Well, this is an odd way to comment a block of code out,
> usually we use #ifdef 0 instead. :)

Right, but that's a tiny technical detail now :).

Michal
