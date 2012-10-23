From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2012-10-22-17-08 uploaded (memory_hotplug.c)
Date: Mon, 22 Oct 2012 21:40:09 -0700
Message-ID: <50861FA9.2030506@xenotime.net>
References: <20121023000924.C56EF5C0050@hpza9.eem.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:45841 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750885Ab2JWEkO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Oct 2012 00:40:14 -0400
In-Reply-To: <20121023000924.C56EF5C0050@hpza9.eem.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org

On 10/22/2012 05:09 PM, akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2012-10-22-17-08 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 



on x86_64, when CONFIG_MEMORY_HOTREMOVE is not enabled:

mm/built-in.o: In function `online_pages':
(.ref.text+0x10e7): undefined reference to `zone_pcp_reset'


-- 
~Randy
