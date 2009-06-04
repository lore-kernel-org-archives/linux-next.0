From: Jon Smirl <jonsmirl@gmail.com>
Subject: Re: [BUILD FAILURE 02/04] Next June 04:PPC64 randconfig
	[drivers/usb/host/ohci-hcd.o]
Date: Thu, 4 Jun 2009 10:07:06 -0400
Message-ID: <9e4733910906040707o63f81dcdm571b9348ee081b30@mail.gmail.com>
References: <20090604133152.19022.27114.sendpatchset@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:28585 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbZFDOHF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 10:07:05 -0400
In-Reply-To: <20090604133152.19022.27114.sendpatchset@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Kumar Gala <galak@kernel.crashing.org>, linux-usb@vger.kernel.org, David Brownell <david-b@pacbell.net>, Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <randy.dunlap@oracle.com>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>

On Thu, Jun 4, 2009 at 9:31 AM, Subrata Modak
<subrata@linux.vnet.ibm.com> wrote:
> CC =A0 =A0 =A0drivers/usb/host/ohci-hcd.o
> In file included from drivers/usb/host/ohci-hcd.c:1060:
> drivers/usb/host/ohci-ppc-of.c:242:2: error: #error "No endianess sel=
ected for ppc-of-ohci"
> make[3]: *** [drivers/usb/host/ohci-hcd.o] Error 1
> make[2]: *** [drivers/usb/host] Error 2
> make[1]: *** [drivers/usb] Error 2
> make: *** [drivers] Error 2
>
> I reported this earlier, and there were some discussions:
> http://groups.google.co.kr/group/linux.kernel/browse_thread/thread/ed=
ff9d5572d3d225

Proposed patch by Arnd should fix this. It has not been merged.
http://lkml.org/lkml/2009/4/22/49

--=20
Jon Smirl
jonsmirl@gmail.com
