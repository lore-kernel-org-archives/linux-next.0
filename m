From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: add_taint() change left s390 alone
Date: Wed, 20 Mar 2013 09:38:44 +0100
Message-ID: <20130320083844.GA11977@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:44064 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750928Ab3CTIit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Mar 2013 04:38:49 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Wed, 20 Mar 2013 08:36:42 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id CEAD817D8018
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 08:39:27 +0000 (GMT)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com [9.149.37.250])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r2K8caFH54525996
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 08:38:36 GMT
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id r2K8ciRD019089
	for <linux-next@vger.kernel.org>; Wed, 20 Mar 2013 02:38:45 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Rusty,

your commit "taint: add explicit flag to show whether lock dep is still=
 OK."
missed to change the s390 invocation of add_taint():

  CC      arch/s390/kernel/dumpstack.o
arch/s390/kernel/dumpstack.c: In function =E2=80=98die=E2=80=99:
arch/s390/kernel/dumpstack.c:228:2: error: too few arguments to functio=
n =E2=80=98add_taint=E2=80=99

Could be that this is a merge issue since dumpstack.c is a new file whi=
ch
contains stuff that was formerly in arch/s390/kernel/traps.c
