From: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: RE: linux-next: build failure after merge of the char-misc tree
Date: Wed, 27 May 2015 07:08:06 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B3C4A2662@hasmsx109.ger.corp.intel.com>
References: <20150527155201.43e0bbb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:59375 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751558AbbE0HIK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2015 03:08:10 -0400
In-Reply-To: <20150527155201.43e0bbb0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
Might be the case that this one was left out ?
https://lkml.org/lkml/2015/5/7/522 
uuid: extract macros for assigning raw arrays

Tomas
