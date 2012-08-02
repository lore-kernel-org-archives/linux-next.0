From: Nathan Zimmer <nzimmer@sgi.com>
Subject: Re: linux-next: build warning after merge of the final tree
Date: Thu, 2 Aug 2012 09:45:50 -0500
Message-ID: <501A929E.5020000@sgi.com>
References: <20120802140428.f045d5eb03bd2a5e03a5230d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3.sgi.com ([192.48.152.1]:39648 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751013Ab2HBOpy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Aug 2012 10:45:54 -0400
In-Reply-To: <20120802140428.f045d5eb03bd2a5e03a5230d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/01/2012 11:04 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> produced this warning:
>
> mm/shmem.c: In function 'shmem_interleave':
> mm/shmem.c:1343:9: warning: assignment makes integer from pointer without a cast [enabled by default]
>
> Introduced by commit c3cfa3129c03 ("tmpfs: interleave the starting node
> of /dev/shmem") from the akpm tree.
>
That should disappear shortly.  The patch responsible was obsoleted.

Nate
