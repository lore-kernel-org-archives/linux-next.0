From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: add_taint() change left s390 alone
Date: Wed, 20 Mar 2013 10:19:15 +0100
Message-ID: <20130320091915.GB13679@osiris>
References: <20130320083844.GA11977@osiris>
 <20130320200819.7ebe1f2c5a9fe73e3f024e2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:54984 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586Ab3CTJTb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 05:19:31 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Wed, 20 Mar 2013 09:16:53 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4CB77219005C
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 09:21:00 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r2K9J7Jm55836870
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 09:19:07 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r2K9JFYN025160
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 03:19:16 -0600
Content-Disposition: inline
In-Reply-To: <20130320200819.7ebe1f2c5a9fe73e3f024e2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org

On Wed, Mar 20, 2013 at 08:08:19PM +1100, Stephen Rothwell wrote:
> Hi Heilo,
>=20
> On Wed, 20 Mar 2013 09:38:44 +0100 Heiko Carstens <heiko.carstens@de.=
ibm.com> wrote:
> >
> > your commit "taint: add explicit flag to show whether lock dep is s=
till OK."
> > missed to change the s390 invocation of add_taint():
> >=20
> >   CC      arch/s390/kernel/dumpstack.o
> > arch/s390/kernel/dumpstack.c: In function =E2=80=98die=E2=80=99:
> > arch/s390/kernel/dumpstack.c:228:2: error: too few arguments to fun=
ction =E2=80=98add_taint=E2=80=99
> >=20
> > Could be that this is a merge issue since dumpstack.c is a new file=
 which
> > contains stuff that was formerly in arch/s390/kernel/traps.c
>=20
> The commit (9ff3d92a818e "s390/dumpstack: fix call chain walking" in
> today's version of the s390 tree) that adds dumpstack.c has add_taint=
()
> with 2 arguments removed from traps.c and add_taint() with one argume=
nt
> added to dumpstack.c ... and add_taint() already has 2 arguments in t=
hat
> tree ...

Ouch! Looks like our work flow still sucks.
Sorry for the noise and blaming others, we'll fix it up!
