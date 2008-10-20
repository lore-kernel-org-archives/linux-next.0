From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: pci_ioremap_bar() breaks s390 build
Date: Mon, 20 Oct 2008 20:12:07 +0200
Message-ID: <20081020181207.GA15328@osiris.boeblingen.de.ibm.com>
References: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com> <48FCC43D.3080305@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([195.212.29.138]:50112 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752377AbYJTSMM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 14:12:12 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m9KIC8um635308
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 18:12:08 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id m9KIC87K4534296
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 19:12:08 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m9KIC8rL011382
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 19:12:08 +0100
Content-Disposition: inline
In-Reply-To: <48FCC43D.3080305@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

On Mon, Oct 20, 2008 at 10:47:41AM -0700, Arjan van de Ven wrote:
> Heiko Carstens wrote:
>> Hi Arjan,
>>
>> your patch "PCI: introduce an pci_ioremap(pdev, barnr) function" breaks s390:
>>
>>   CC      fs/compat_ioctl.o
>> In file included from fs/compat_ioctl.c:52:
>> include/linux/pci.h: In function 'pci_ioremap_bar':
>> include/linux/pci.h:1136: error: implicit declaration of function 'ioremap_nocache'
>> include/linux/pci.h:1137: warning: return makes pointer from integer without a cast
>> make[1]: *** [fs/compat_ioctl.o] Error 1
>> make: *** [fs] Error 2
>
> hmm does s390 have ioremap ?
> since that'd be the most useful solution, to add an ioremap_nocache().

s390 doesn't have ioremap.

> if it doesn't have ioremap.. wtf is it doing using pci.h then ??

Several common code parts pull pci.h, not s390.
fs/compat_ioctl.c is one, drivers/scsi/scsi_lib.c is another one.
