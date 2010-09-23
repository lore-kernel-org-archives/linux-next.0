From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: New tree to be added on linux-next
Date: Thu, 23 Sep 2010 02:02:08 -0300
Message-ID: <4C9ADF50.60505@redhat.com>
References: <4C99FBF9.3060606@redhat.com> <20100923083406.3c970103.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:4615 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753040Ab0IWFCN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Sep 2010 01:02:13 -0400
In-Reply-To: <20100923083406.3c970103.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linux Edac Mailing List <linux-edac@vger.kernel.org>

Em 22-09-2010 19:34, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> On Wed, 22 Sep 2010 09:52:09 -0300 Mauro Carvalho Chehab <mchehab@redhat.com> wrote:
>>
>> Please add the edac.git tree to linux-next:
>>
>> ssh://master.kernel.org/pub/scm/linux/kernel/git/mchehab/edac.git linux_next
>>
>> It currently contains a new driver for i7300_edac.
> 
> Added from today.  I called it i7300_edac (I now have 3 edac trees, this
> one, i7core_edac and edac-amd).

Thank you! For its current contents, calling it as i7300_edac seems ok.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
