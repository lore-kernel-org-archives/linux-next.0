From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: build warnings after merge of the ia64 tree
Date: Fri, 17 Dec 2010 11:58:27 -0800
Message-ID: <987664A83D2D224EAE907B061CE93D530193D00F91@orsmsx505.amr.corp.intel.com>
References: <20101217112357.ec7879f1.sfr@canb.auug.org.au>
	<987664A83D2D224EAE907B061CE93D530193D00A15@orsmsx505.amr.corp.intel.com>
 <20101217115932.a633519e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:60841 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755576Ab0LQT6a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Dec 2010 14:58:30 -0500
In-Reply-To: <20101217115932.a633519e.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>> commit 3b38bb5f7f06356a89bb2cbf92ad346025e95192
>> Author: Huang Ying <ying.huang@intel.com>
>> Date:   Thu Dec 2 10:40:53 2010 +0800
>> 
>>     ACPI, APEI, use raw spinlock in ERST
>
> That commit is in Linus' tree as of v2.6.37-rc6 so if you merge -rc6 into
> your tree, you can fix the conflict there.

Ah good. I've rebased a new version of my code on top of -rc6.

Thanks

-Tony
