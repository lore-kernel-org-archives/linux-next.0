From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] ima: fix part_pack_uuid() build error
Date: Fri, 22 Feb 2013 12:35:43 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1302221232290.10081@chino.kir.corp.google.com>
References: <1361562413.2908.22.camel@falcor1.watson.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:53086 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754594Ab3BVUfp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Feb 2013 15:35:45 -0500
Received: by mail-pa0-f48.google.com with SMTP id hz10so661433pad.7
        for <linux-next@vger.kernel.org>; Fri, 22 Feb 2013 12:35:45 -0800 (PST)
In-Reply-To: <1361562413.2908.22.camel@falcor1.watson.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, James Morris <jmorris@namei.org>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>

On Fri, 22 Feb 2013, Mimi Zohar wrote:

> Fix a build error when CONFIG_BLOCK is not enabled by defining
> a wrapper called ima_part_pack_uuid().  The wrapper returns
> -EINVAL, when CONFIG_BLOCK is not defined.
> 
> security/integrity/ima/ima_policy.c:538:4: error: implicit declaration
> of function 'part_pack_uuid' [-Werror=implicit-function-declaration]
> 
> Changelog v0:
> - fix UUID scripts/Lindent msgs
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>

Except for the scripts/checkpatch.pl warnings for this patch, it looks 
better and fixes the build error.  The build breakage has now made it to 
Linus' tree, so this will hopefully be pushed to him before rc1.
