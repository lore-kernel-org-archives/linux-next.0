From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: CPU hotplug hang due to "swap: make each swap partition have
 one address_space"
Date: Mon, 04 Feb 2013 09:57:10 -0700
Message-ID: <510FE866.9090600@wwwdotorg.org>
References: <510C9DE9.9040207@wwwdotorg.org> <20130204023646.GA321@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55102 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773Ab3BDQ5O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Feb 2013 11:57:14 -0500
In-Reply-To: <20130204023646.GA321@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>
Cc: Shaohua Li <shli@fusionio.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@redhat.com>, Minchan Kim <minchan@kernel.org>, Joseph Lo <josephl@nvidia.com>

On 02/03/2013 07:36 PM, Shaohua Li wrote:
> On Fri, Feb 01, 2013 at 10:02:33PM -0700, Stephen Warren wrote:
>> Shaohua,
>>
>> In next-20130128, commit 174f064 "swap: make each swap partition have
>> one address_space" (from the mm/akpm tree) appears causes a hang/RCU
>> stall for me when hot-unplugging a CPU.
> 
> does this one work for you?
> http://marc.info/?l=linux-mm&m=135929599505624&w=2
> Or try a more recent linux-next. The patch is in akpm's tree.

Yes, that patch fixes the issue for me, thanks.
