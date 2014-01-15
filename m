From: Ian Munsie <imunsie@au1.ibm.com>
Subject: RE: linux-next: manual merge of the akpm-current tree with the char-misc tree
Date: Thu, 16 Jan 2014 10:52:16 +1100
Message-ID: <1389829885-sup-9038@delenn.ozlabs.ibm.com>
References: <20140114155104.0ab2772aaa909e49bc89cd61@canb.auug.org.au> <5B8DA87D05A7694D9FA63FD143655C1B1AF42F69@HASMSX106.ger.corp.intel.com> <1389750036-sup-8437@delenn.ozlabs.ibm.com> <5B8DA87D05A7694D9FA63FD143655C1B1AF462B0@HASMSX106.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:37811 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbaAPVDN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2014 16:03:13 -0500
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <imunsie@au1.ibm.com>;
	Thu, 16 Jan 2014 09:52:29 +1000
In-reply-to: <5B8DA87D05A7694D9FA63FD143655C1B1AF462B0@HASMSX106.ger.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Winkler, Tomas" <tomas.winkler@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Excerpts from Winkler, Tomas's message of 2014-01-16 09:36:40 +1100:
> I think the issue was fixed and also then number  of consecutive resets were limited to 3 so you should
> not see this issue anymore in the next release, your patch just conflicted with these fixes. 
> Still need to provide a simpler fix for the stable kernel.

Ok, If you think it should not occur again I don't mind if my patch is
dropped.

Cheers,
-Ian
