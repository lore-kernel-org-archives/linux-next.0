From: Shahed Shaikh <shahed.shaikh@qlogic.com>
Subject: RE: linux-next: Tree for Mar 28 (qlcnic)
Date: Sat, 29 Mar 2014 09:11:52 +0000
Message-ID: <262CB373A6D1F14F9B81E82F74F77D5A46F881E9@avmb2.qlogic.org>
References: <20140328180950.322d12920ce31e0ad3dace59@canb.auug.org.au>
 <5335BEE1.4030609@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-0016ce01.pphosted.com ([67.231.148.157]:42913 "EHLO
	mx0a-0016ce01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751204AbaC2JMX convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 29 Mar 2014 05:12:23 -0400
In-Reply-To: <5335BEE1.4030609@infradead.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Dept-HSG Linux NIC Dev <Dept-HSGLinuxNICDev@qlogic.com>


> -----Original Message-----
> From: Randy Dunlap [mailto:rdunlap@infradead.org]
> Sent: Friday, March 28, 2014 11:57 PM
> To: Stephen Rothwell; linux-next@vger.kernel.org
> Cc: linux-kernel; netdev; Shahed Shaikh; Dept-HSG Linux NIC Dev
> Subject: Re: linux-next: Tree for Mar 28 (qlcnic)
> 
> On 03/28/2014 12:09 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > This tree still fails (more than usual) the powerpc allyesconfig build.
> >
> > Changes since 20140327:
> >
> 
> 
> on x86_64:
> CONFIG_VXLAN=m
> 
> drivers/built-in.o: In function `qlcnic_attach':
> (.text+0x25d9dc): undefined reference to `vxlan_get_rx_port'
> 
> 
> Full randconfig file is attached.
> 
> depends on VXLAN ?

Yes. Need to add dependency on VXLAN in Kconfig of qlcnic. I will send a patch to fix this build failure.

Thanks,
Shahed
> 
> --
> ~Randy
