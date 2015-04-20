From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: Tree for Apr 20 (gfs2)
Date: Mon, 20 Apr 2015 16:44:31 +0100
Message-ID: <55351EDF.6000708@redhat.com>
References: <20150420154533.3361abe4@canb.auug.org.au> <55351DDC.9060409@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49584 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745AbbDTPof (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2015 11:44:35 -0400
In-Reply-To: <55351DDC.9060409@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cluster-devel@redhat.com, Bob Peterson <rpeterso@redhat.com>

Hi,

On 20/04/15 16:40, Randy Dunlap wrote:
> On 04/19/15 22:45, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v4.2 material to your linux-next included trees
>> until after v4.1-rc1 is released.
>>
>> Changes since 20150415:
>>
> on i386:
>
> ERROR: "__divdi3" [fs/gfs2/gfs2.ko] undefined!
>
>
>

These notices should go to Bob as well now, since he is looking after 
the tree that you are pulling from. I suspect that might be from one of 
his patches too,

Steve.
