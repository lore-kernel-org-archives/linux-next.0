From: Chris Kelly <ckelly@ozmodevices.com>
Subject: RE: linux-next: build failure after merge of the final tree
 (staging tree related)
Date: Wed, 29 Feb 2012 17:08:02 +0000
Message-ID: <57C28D85C66F5C49B9E212CBFAFDAC1F23013A86@CH1PRD0802MB115.namprd08.prod.outlook.com>
References: <20120227181303.9aa93b8a8ed02428e9310c5e@canb.auug.org.au>
	<20120227211630.GA18418@kroah.com>
	<57C28D85C66F5C49B9E212CBFAFDAC1F23010F80@CH1PRD0802MB120.namprd08.prod.outlook.com>
 <20120229185227.7f14b1863c7a5d16220bac3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]:4838
	"EHLO DB3EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1030302Ab2B2RIQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Feb 2012 12:08:16 -0500
In-Reply-To: <20120229185227.7f14b1863c7a5d16220bac3f@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <gregkh@linuxfoundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Stephen,

Many thanks for your reply. This is exactly what I needed. I have submitted a patch to fix the problem and it builds OK with the compiler you suggested below.

Kind regards
Chris Kelly

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: 29 February 2012 7:52 AM
To: Chris Kelly
Cc: Greg KH; linux-next@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the final tree (staging tree related)

Hi Chris,

On Wed, 29 Feb 2012 07:35:35 +0000 Chris Kelly <ckelly@ozmodevices.com> wrote:
>
> Hi Greg,
> 
> I believe I understand the cause of the problem and would like to 
> submit a patch to fix it. However, I am unclear on what the starting 
> point is given that the final patch was reverted from linux-next. Do I 
> assume that patch will be reapplied before the applying the new patch 
> or should I provide another patch to reapply the reverted patch? Is it 
> acceptable to submit patches generated against the head of linux-next?

Your patches are all still in Greg's tree which I merge into linux-next every day.  I have then been reverting that last patch each day.  Your patch should be against Greg's tree (or your last patch) and then when the fix is in Greg's tree, I will get it in linux-next and stop reverting the other patch.

> Before submitting the patch, I would like to test that the patch 
> really does fix the issue found by Stephen. Since it doesn't occur 
> when building for x32 or x64 then I need to setup a PowerPC 
> cross-compile tool chain. Do you have any suggestions as to where I 
> can pull a prebuilt tool chain or do I need to build directly from the GNU sources.

http://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.0/x86_64-gcc-4.6.0-nolibc_powerpc64-linux.tar.xz

That is am x86_64 hosted powerpc64 compiler suitable for building the kernel.

--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
