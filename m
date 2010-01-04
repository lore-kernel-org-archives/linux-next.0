From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: kgdb tree build failure
Date: Mon, 04 Jan 2010 06:55:30 -0600
Message-ID: <4B41E542.40703@windriver.com>
References: <20100104164209.a5ac8d6a.sfr@canb.auug.org.au> <20100104164452.2803d62e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:58550 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752457Ab0ADMzg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2010 07:55:36 -0500
In-Reply-To: <20100104164452.2803d62e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Jason,
>
> On Mon, 4 Jan 2010 16:42:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>   
>> Today's linux-next build (arm realview_defconfig) failed like this:
>>     
>                                 ^^^^^^^^^
> Most of the other arm builds failed the same way ...
>
>   

That patch could have been dropped from the series, but I did repair the
problem.  I also added a 3 more config tests (sparc, arm and ppc) to my
pre-submission test list.

kgdb-next is updated and I can only hope the light is at the end of the
tunnel for the config testing. :-)

Thanks,
Jason.
