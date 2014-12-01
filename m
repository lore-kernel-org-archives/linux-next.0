From: Arend van Spriel <arend@broadcom.com>
Subject: Re: linux-next: build warnings after merge of the driver-core tree
Date: Mon, 1 Dec 2014 08:45:13 +0100
Message-ID: <547C1C89.1070604@broadcom.com>
References: <20141201184205.08a8f7aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:50108 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211AbaLAHpS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2014 02:45:18 -0500
In-Reply-To: <20141201184205.08a8f7aa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 01-12-14 08:42, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from kernel/power/main.c:16:0:
> include/linux/debugfs.h:105:10: warning: 'struct device' declared inside parameter list
>           void *data));
>           ^
> 
> And many more like this.
> 
> Introduced by commit 98210b7f73f1 ("debugfs: add helper function to
> create device related seq_file").  See Rule 1 from
> Documentation/SubmitChecklist - though in this case a simple "struct
> device;" would probably do.
> 

I submitted a patch for that yesterday [1] and got (automated) email
from Greg that it is going into his driver-core tree.

Regards,
Arend

[1] http://mid.gmane.org/1417361481-1136-1-git-send-email-arend@broadcom.com
