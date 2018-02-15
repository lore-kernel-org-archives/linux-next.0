From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Build: Scripts/Makefile: Remove Repeated Lines
Date: Wed, 14 Feb 2018 21:24:55 -0800
Message-ID: <bec02b84-316b-a41a-91ea-e0957d358ee3@infradead.org>
References: <20180214092558.5846-1-progyanb@acm.org>
 <20180214224937.3f2feb80@canb.auug.org.au>
 <CAGyWO1-9scERtpPw5CCwQcUbCU0SpcqpNq2eiBWRtwpRC-kB-A@mail.gmail.com>
 <20180215160520.5828f900@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:49726 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751074AbeBOFZI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Feb 2018 00:25:08 -0500
In-Reply-To: <20180215160520.5828f900@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Progyan Bhattacharya <bprogyan@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, narmstrong@baylibre.com, akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>, Joe Perches <joe@perches.com>

On 02/14/2018 09:05 PM, Stephen Rothwell wrote:
> Hi Progyan,
> 
> On Thu, 15 Feb 2018 09:50:03 +0530 Progyan Bhattacharya <bprogyan@gmail.com> wrote:
>>
> 
>> PS: I have another question, Is use of range expression within case
>> statements allowed in Kernel? If not, are we using If-Else ladder for that?
> 
> I am not sure if we have a policy on ranges in case labels, but it is
> not standard C (well, C11 at least).  If-else ladders are certainly
> common.

I found 964 case ranges in 4.16-rc1.

or you use something like:

	switch (val) {
	case 5:
	case 10:
	case 15:
		// handle multiples of 5:
		break;
	default:
	}



-- 
~Randy
