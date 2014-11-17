From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: build warning after merge of the ia64 tree
Date: Mon, 17 Nov 2014 18:31:40 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F3293E7B7@ORSMSX114.amr.corp.intel.com>
References: <20141117184959.15d4dbb8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:57724 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751180AbaKQSdb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Nov 2014 13:33:31 -0500
In-Reply-To: <20141117184959.15d4dbb8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Schmidt <yath@yath.de>

> In file included from kernel/printk/printk.c:41:0:
> include/linux/syslog.h:55:12: warning: 'check_syslog_permissions' defined but not used [-Wunused-function]
>  static int check_syslog_permissions(int type, bool from_file)

Bah - missed the "inline".  Fixed now.

Thanks

-Tony
