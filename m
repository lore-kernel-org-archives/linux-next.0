From: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Subject: Re: linux-next: warning from build
Date: Mon, 10 Nov 2008 10:52:43 -0800
Message-ID: <797B9E9F-5C89-4887-BD3A-920D41077A3F@qlogic.com>
References: <20081110152546.0d13a794.sfr@canb.auug.org.au>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avexch2.qlogic.com ([198.70.193.116]:17313 "EHLO
	avexch2.qlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754711AbYKJSwp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2008 13:52:45 -0500
In-Reply-To: <20081110152546.0d13a794.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org


On Nov 9, 2008, at 8:25 PM, Stephen Rothwell wrote:

> Hi James,
>
> The current linux-next build (x86_64 allmodconfig) produces this  
> warning:
>
> drivers/scsi/qla2xxx/qla_os.c: In function 'qla2x00_probe_one':
> drivers/scsi/qla2xxx/qla_os.c:1582: warning: 'mem_only' is used  
> uninitialized in this function
>
> Caused by commit 00aeec5c93a80145cfa939bb9c9e244b207cb48c ("[SCSI]
> qla2xxx: Code changes for qla data structure refactoring") which  
> removed
> the initialisation of mem_only.

I am really sorry about that. James, should I resubmit the patch or  
send a patch against
00aeec5c93a80145cfa939bb9c9e244b207cb48c commit?

Thanks,
Anirban
